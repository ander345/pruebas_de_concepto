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

para el caso del el docker-file use un ngix en vez del anterior

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


Reinicie Docker y todos los contenedores ahora enviarán registros a Loki.
esto se hace despues de instalar el plugin y es importante

>sudo systemctl restart docker


### se ejecuta el contenedor

>docker-compose pull
>docker-compose up -d


verificamos que nginx este respondiendo en el navegador: **localhost:80**

luego verirficamos grafana: 
**localhost:3000**

luego vuelvo a agregar en fuente de origen en **data-source** que podemos ver en configuracion y agregamos 
>Loki

en url agregamos 
>loki:3100

y guardamos y verificamos que la conexion sea exitosa