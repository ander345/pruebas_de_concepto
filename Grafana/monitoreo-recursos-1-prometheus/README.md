**Edit a file, create a new file, and clone from Bitbucket in under 2 minutes**

When you're done, you can delete the content in this README and update the file with details for others getting started with your repository.

*We recommend that you open this README in another tab as you perform the tasks below. You can [watch our video](https://youtu.be/0ocf7u76WSo) for a full demo of all the steps in this tutorial. Open the video in a new tab to avoid leaving Bitbucket.*

---

## Edit a file

You’ll start by editing this README file to learn how to edit a file in Bitbucket.

1. Click **Source** on the left side.
2. Click the README.md link from the list of files.
3. Click the **Edit** button.
4. Delete the following text: *Delete this line to make a change to the README from Bitbucket.*
5. After making your change, click **Commit** and then **Commit** again in the dialog. The commit page will open and you’ll see the change you just made.
6. Go back to the **Source** page.

---

## Create a file

Next, you’ll add a new file to this repository.

1. Click the **New file** button at the top of the **Source** page.
2. Give the file a filename of **contributors.txt**.
3. Enter your name in the empty file space.
4. Click **Commit** and then **Commit** again in the dialog.
5. Go back to the **Source** page.

Before you move on, go ahead and explore the repository. You've already seen the **Source** page, but check out the **Commits**, **Branches**, and **Settings** pages.

---

## Clone a repository

Use these steps to clone from SourceTree, our client for using the repository command-line free. Cloning allows you to work on your files locally. If you don't yet have SourceTree, [download and install first](https://www.sourcetreeapp.com/). If you prefer to clone from the command line, see [Clone a repository](https://confluence.atlassian.com/x/4whODQ).

1. You’ll see the clone button under the **Source** heading. Click that button.
2. Now click **Check out in SourceTree**. You may need to create a SourceTree account or log in.
3. When you see the **Clone New** dialog in SourceTree, update the destination path and name if you’d like to and then click **Clone**.
4. Open the directory you just created to see your repository’s files.

Now that you're more familiar with your Bitbucket repository, go ahead and add a new file locally. You can [push your change back to Bitbucket with SourceTree](https://confluence.atlassian.com/x/iqyBMg), or you can [add, commit,](https://confluence.atlassian.com/x/8QhODQ) and [push from the command line](https://confluence.atlassian.com/x/NQ0zDQ).


# esta parte es para capturar consumo de recursos y visualizar en grafana

## bajar imagenes
**docker-compose pull**
## ejecutar imagenes
**docker-compose up -d**
## ver si se ejecuta el servidor
**localhost**
sin puerto debido a que la imagen esta en el puerto 80
localhost/metrics
http://localhost/metrics.

## servidor de promisius
localhost:9090/targets
#### tener en cuenta los labels en los jobs

## node exporte
localhost:9100/metrics

## Grafana
localhost:3000

**user: admin**

**pass:admin

# conectar promisius con grafana
 em grafana vamos a `data source` que esta en configuracion, añadimos una fuente, en este caso  `prometheus`

donde dice URL simplemente agregamos `prometheus:9090`, es asi de simple debido a que para este ejemplo esta dentro del mismo docker composer (red) el lo resuelve solo el dns. damos a guardar

ya con esto si nos vamos a la pestaña de `explorar` y damos click en `Metrics browser`, nos lista todas las metricas.

si le damos en `2. select labels to search in ` y escribimos algo como job, podemos ver todos los jobs disponibles que tiene prometheus para mostrar.

descargar un [dashboard](https://grafana.com/grafana/dashboards/).
vamos a buscar por node `exporter`
para el que usamos en este ejemplo copiamos el id, que en este caso fue 11074
otro puede ser node exporter full y el codigo es 1860, 15172

vamos al grafana vamos al `+` que es create y damos a importar, despues seleccionamos cual metrica vamos a usar e importar 

otro dash board para el cadvisor:
`docker-cadvisor`  13946