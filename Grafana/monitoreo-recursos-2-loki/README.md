# Collecting Docker logs with Grafana Loki





First step is to install the loki-docker-driver plugin.

> docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions

A continuación se muestran dos ejemplos sobre cómo especificar manualmente el controlador de registro para un contenedor. Un ejemplo de ejecución de Docker y un ejemplo de composición de Docker. Ambos ejemplos reenvían registros a la instancia de Loki que implementamos con Docker Compose.

```
docker run --name hello-world \
  --log-driver=loki \
  --log-opt loki-url="http://localhost:3100/loki/api/v1/push" \
  -p 3000:3000 \
  -d kerwood/hello-word
```

```
services:
  hello-world:
    image: kerwood/hello-world
    logging:
      driver: loki
      options:
        loki-url: "http://localhost:3100/loki/api/v1/push"
```

para el caso del el docker-file use otro ngix en vez del anterior




Reinicie Docker y todos los contenedores ahora enviarán registros a Loki.
esto se hace despues de instalar el plugin y es importante

>sudo systemctl restart docker


si esta en windows puede ejecutar los siguientes comandos para correr curl en windows
> Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

>choco install curl
>choco install jq 


### se ejecuta el contenedor

>docker-compose pull
>docker-compose up -d


verificamos que nginx este respondiendo en el navegador: **localhost:80**

luego verirficamos grafana: 
**localhost:3000**

luego vuelvo a agregar en fuente de origen en **data-source** que podemos ver en configuracion y agregamos 
>Loki

en url agregamos http://loki:3100/ **para la version 9.3.2 obligacion que tenga http o se genera error
>loki:3100


y guardamos y verificamos que la conexion sea exitosa

## trabajando con la version 8.0.6
en explore seleccionamos loki, vamos a log browser
si seleccionamos nos muestra una lista donde si le damos en container_name nos muestra los contenedores de los que esta mostrando los logs, seleecionamos uno y damos a show logs

en la parte superior derecha podemos darle live para ver en tiempo real los logs

tambien hay una opcion de ver por el nombre del contenedor y darle click en **run query**

>{container_name="hello-world"}

o tambien filtrar 

>{container_name="nginx"} |~ "GET"
>{container_name="nginx"} |= "GET"

lo que esta dentro de las comillas es lo que vamos a filtrar en los logs 

## notas: para la version 9.3.2 para ver los logs al lado de **run query** en **Absolute time range** seleccior una fecha para poder ver los logs

recordar que para conectar estos logs solo instalamo el plugin y agregamos estas lineas en el docker del servicio
```
    logging:
      driver: loki
      options:
        loki-url: "http://localhost:3100/loki/api/v1/push"
```

lo siguiente para evitar poner en cada contenedor la configuracion podemos hacer lo siguiente: 

Cambiar el controlador de registro predeterminado
Si desea cambiar el controlador de registro predeterminado para todos los contenedores, deberá editar `/etc/docker/daemon.json` y agregar las mismas opciones que en los ejemplos anteriores. Si el archivo ya contiene un objeto JSON con opciones de Docker, simplemente combine las propiedades del controlador de registro.

```
{
  "log-driver": "loki",
  "log-opts": {
    "loki-url": "http://localhost:3100/loki/api/v1/push"
  }
}
```
en los que no se pone loki y ponemos localhost es por que esta por fuera y no puede resolverlo el dns de docker


si no agregamos el container name, el docker nos pondra con un _1 y sera diferente del container_service 