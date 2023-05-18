# Configuración del Proyecto Google Maps - Flutter

## Configurar Google Maps

###  Generar clave API
```
Nos dirigimos a https://cloud.google.com/maps-platform/

- Escogemos el proyecto en el que desea habilitar Google Maps.
- En la sección biblioteca buscamos "Maps SDK for Android" y lo habilitamos.
- Generamos una clave API.
```

### Configuración en Android
```
1 Modificar el minSdkVersion en android/app/build.gradle:

android {
    defaultConfig {
        minSdkVersion 20
    }
}

2 Agregamos la clave API en android/app/src/main/AndroidManifest.xml

<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>  

3 Instalamos el paquete google_maps_flutter: ^2.2.1
```