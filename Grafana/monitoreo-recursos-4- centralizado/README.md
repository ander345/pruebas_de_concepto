
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

 stdout: en caso de que podamos conectarlo a loqui como se hace al levantar 
