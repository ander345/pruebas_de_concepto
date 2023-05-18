# Grafana - Notes

## Referencias
* https://prometheus.io/docs/visualization/grafana/
* https://grafana.com/grafana/download?platform=docker&edition=oss
* https://grafana.com/grafana/download/8.2.3?platform=mac&edition=oss

## Instalacion - Con Docker (funciono!!)
```
docker run -d --name=grafana -p 3000:3000 grafana/grafana-oss
```
* Ingresar: http://localhost:3000/
* Usuario y clave: admin/admin

## Instalacion - Usando binario
```
curl -O https://dl.grafana.com/oss/release/grafana-8.2.3.darwin-amd64.tar.gz
tar -zxvf grafana-8.2.3.darwin-amd64.tar.gz
```
* Iniciar grafana
```
./bin/grafana-server web
```
* Ingresar: http://localhost:3000/
* Usuario y clave: admin/admin

## Creating a Prometheus data source
```
Click on the "cogwheel" in the sidebar to open the Configuration menu.
Click on "Data Sources".
Click on "Add data source".
Select "Prometheus" as the type.
Set the appropriate Prometheus server URL (for example, http://localhost:9090/)
Adjust other data source settings as desired (for example, choosing the right Access method).
Click "Save & Test" to save the new data source.

```

## Creating a Prometheus graph
```
Click the graph title, then click "Edit".
Under the "Metrics" tab, select your Prometheus data source (bottom right).
Enter any Prometheus expression into the "Query" field, while using the "Metric" field to lookup metrics via autocompletion.
To format the legend names of time series, use the "Legend format" input. For example, to show only the method and status labels of a returned query result, separated by a dash, you could use the legend format string {{method}} - {{status}}.
Tune other graph settings until you have a working graph.

```


## Uso del Dashboard plantilla para Spring
```
https://grafana.com/grafana/dashboards/6756
```
* En el Dashboard, usar como instance: 192.168.1.73:8080 y como Application: demoapp

