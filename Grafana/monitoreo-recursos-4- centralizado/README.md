
![arquitectura](https://github.com/ander345/pruebas_de_concepto/blob/main/Grafana/monitoreo-recursos-4-%20centralizado/arquitectura.png)

# maestro 
## servidor central 

loki: logs

prometheus: metricas; disco, ram, etc

grafana: graficadora de los datos

# esclavo
## Agente
prometheus: se deja otro prometheus debido a que se puede perder la conexion entre los 2 servidores y se pierden los datos

node_exportes: monitorea metricas a nivel general.
cAdvisor: monitoriza todos los contenedores, obtenemos metricas

promtail: herramienta monitoreas archivos y enviarlos a loki

 stdout: en caso de que podamos conectarlo a loki como se hace al levantar desde docker podemos hacerlo de forma directa

 file: logs que no podemos conectar directamente a loki lo pasamos a travez de promtail

 .history: comandos
 .syslog. logs

 las flechas indican a donde se conecta cada uno

tener en cuenta que se guarden los logs con la hora concatenada, por que al no tener un servidores esclavo de espejo para loki para evitar algun inconveniente si se cae la conexion, cuando se reestablesca si llevara los logs, pero los llevara con la hora en que se reestablesca la conexion

para pruebas se hizo virtual box, nota; por cada servidor ir a network y seleccionar en attached to: bridged adapter y despues abajito en mac address darle en actualizar para que cambie la ip y tambien forzar ip fija.


## ejecutar 

en master, si queremos agregar un nuevo prometheus esclavo simplemente vamos al yml agregamos y hacemos un >docker-compose restart master_prometheus

no olvidar configurar de acuerdo al servidor donde este el loki cambiarlo en el .env del slave

**nota**: Windows es distinto al de Linux y tu VS Code está configurado con salto de linea CRLF. Lo puedes ver en la barra inferior. Linux usa LF. Por lo que mi sugerencia sería cambiar el salto de linea a LF, guardar de nuevo el archivo e intentarlo nuevamente

si no funciona, copiar directamente en la consola estos comandos de startup.sh


### una vez se ejecute el grafana, no olvidar agregar loki y prometheus

>docker-compose up -d
>docker-compose down -v --timeout 0


http://loki:3100
http://prometheus:9090


si vamos a explore en prometheus y escribimos en metrics **machine_cpu_cores** vamos a ver todo labels que filtramos antes como pais, cliente, hostname y si damos **use query** podremos ver de mejor manera las 2 metricas, tanto como dev como qa

si no se ven entran al primer esclavo **http://localhost:9090/targets** y ahi deberia aparecer lo 2 jobs


para las pruebas quite los logs globales

,
  "log-driver": "loki",
  "log-opts": {
    "loki-url": "http://localhost:3100/loki/api/v1/push"
  }


  si se genera este error en los logs de promtail: 
  >level=error ts=2023-05-18T08:26:47.643979239Z caller=positions.go:178 msg="error writing positions file" error="rename /tmp/.positions.yaml5146007166345768034 /tmp/positions.yaml: device or resource busy"

  puedes ejecutar estos comandos :
  >docker stop slave_promtail
  > docker start slave_promtail 
  y volver a verificar los logs
  >docker logs slave_promtail 