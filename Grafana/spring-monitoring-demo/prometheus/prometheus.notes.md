# Configurar Prometheus
## Referencias
* https://prometheus.io/docs/prometheus/latest/installation/
* https://www.tutorialworks.com/spring-boot-prometheus-micrometer/


## Levantar servidor
```
docker run -p 9090:9090 prom/prometheus
```

```
docker run -p 9090:9090 -v /path/to/config:/etc/prometheus prom/prometheus
docker run -it -p 9090:9090  -v "$(pwd)/config/prometheus.yml":"/etc/prometheus/prometheus.yml" --name prometheus prom/prometheus
docker run --net=host -it -v "$(pwd)/config/prometheus.yml":"/etc/prometheus/prometheus.yml" --name prometheus prom/prometheus
```
* --net=host => no funciona para mac

## Acceder a Prometheus
```
http://localhost:9090/targets
```