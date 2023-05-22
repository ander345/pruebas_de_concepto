# Descargar windows exporter

>https://github.com/prometheus-community/windows_exporter

vamos a releases y en la parte de abajo vemos las versiones a descargar

- el instalador lo que hara es ponerlo como servicio y cada que encienda la maquina va a estar corriendo windows exportes (.msi)

- y el .exe cada vez que lo neceitemos nos toca levantarlo

el servicio queda levantado en el puerto 9182

# Descargar prometheus

>https://www.youtube.com/watch?v=VJU867HHxXg&list=PLC-jxfv-8E7L-w6bdX61qa4ehrrgCIh4R&index=11

en el archivo yml simlemente es agregarle un job 

```
  - job_name: "windows_exporter"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["localhost:9182"]

```

para ejecutar este prometheus se da shif y click derecho y **abrir shell de linux aqui**  y escribimos 
>.\prometheus.exe

y abrirlo con **localhost:9090**

ya lo que queda es lo realizado en videos anteriores, montar un grafana y  realizar conexion con prometheus

un dashboard puede ser:  **windows_exporter for prometheus Dashboard** id: 13466