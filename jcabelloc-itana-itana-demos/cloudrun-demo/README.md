# Desplegar un app java a Google Cloud Run

## 1. Contruyendo el contenedor
* Reference: https://cloud.google.com/run/docs/building/containers

### 1.1 Construir localmente la imagen del contenedor

#### Usando gcloud, revisar configuracion, usuario y proyecto
* Previamente se ha creado el proyecto, desde la consola web, con nombre y id: cloudrun16-demo 
```

gcloud config configurations list
gcloud config configurations activate jcabelloc
gcloud config set account jcabelloc@gmail.com
gcloud config list
gcloud projects list

gcloud config set project cloudrun16-demo


```


#### Crear un Dockerfile
* En la raiz del proyecto Spring Boot, crear el archivo Dockerfile
```
FROM adoptopenjdk/openjdk11:alpine-slim

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

#### Generar el jar usando maven

```
mvn package
mvn package -DskipTests
```

#### Generar la imagen del container usando Docker:
* Desde la raiz del proyecto 
```
docker build -t IMAGE_URL .
docker build -t gcr.io/cloudrun16-demo/cloudrun16-demo:latest .
```

### 1.2 Subir la imagen a Google Container Registry  


#### Configure Docker to use the gcloud command-line tool to authenticate requests to Container Registry
```
gcloud auth configure-docker

```
* Resultado de la ejecucion del comando anterior
```
~❯ gcloud auth configure-docker                 

Adding credentials for all GCR repositories.
WARNING: A long list of credential helpers may cause delays running 'docker build'. We recommend passing the registry name to configure only the registry you are using.
After update, the following will be written to your Docker config file
 located at [/Users/jcabelloc/.docker/config.json]:
 {
  "credHelpers": {
    "gcr.io": "gcloud",
    "us.gcr.io": "gcloud",
    "eu.gcr.io": "gcloud",
    "asia.gcr.io": "gcloud",
    "staging-k8s.gcr.io": "gcloud",
    "marketplace.gcr.io": "gcloud"
  }
}

Do you want to continue (Y/n)?  Y

Docker configuration file updated.

```

#### Enable Container Registry API
* Ir a Google Console / Container Registry / Habilitar dicha API


#### Push the container image to Container Registry:
* Este comando sube la imagen al Container Registry, se puede verificar mediante Google Cloud Console
```
docker push gcr.io/cloudrun16-demo/cloudrun16-demo
```





## 2. Desplegar la imagen del container
* Referencia: https://cloud.google.com/run/docs/deploying#command-line


### Desplegar un nuevo servicio
```
gcloud run deploy cloudrun16-demo-service --image gcr.io/cloudrun16-demo/cloudrun16-demo --platform managed --region us-central1 --allow-unauthenticated
```
* Si el API de Cloud Run no fue hablitado, saldra lo siguiente:
```
API [run.googleapis.com] not enabled on project [1008516036846]. Would
 you like to enable and retry (this will take a few minutes)? (y/N)?  y

Enabling service [run.googleapis.com] on project [1008516036846]...
Operation "operations/acf.d6221b40-0a98-4968-937f-cfd180f35c39" finished successfully.
...
...

Service [cloudrun16-demo-service] revision [cloudrun16-demo-service-00002-tut] has been deployed and is serving 100 percent of traffic at https://cloudrun16-demo-service-xmgeu6mqxq-uc.a.run.app

```

