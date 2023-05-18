
#                       ALERTAS

Documentacion:
- https://grafana.com/docs/
- https://grafana.com/docs/grafana/latest/alerting/fundamentals/contact-points/

## ejecutar
>docker-compose up -d

bajar contenedores y volumenes
>docker-compose down -v --timeout 0

## realizar conexion prometheus y loki
>http://loki:3100 

>http://prometheus:9090


## recordatorio:
- grafana: visualizador
- prometheus: almacena informacion
- cadvisor: cadvisor: métricas de los contenedores
- node-exporter. Métricas del servidor ejemplo cuanta ram tiene el servidor,  cpu, consumo de disco etc
- loki: todos los log 
- promtail: : agente de loki, analiza archivos en general y los envía a loki, tener en cuenta que los logs de aplicaciones van directos a loki por configuracion, promtail lleva logs del sistema que nosotros le configuremos.

## iniciando alertas
una vez configurado lo anterior, primero se va a **alertas** 

nota: para la versión Grafana 9.3.x ya no está disponible la opción de Canales, ahora se llama Contacts points

se puede usar jmeter para generar cargas ficticias


.... incompleto