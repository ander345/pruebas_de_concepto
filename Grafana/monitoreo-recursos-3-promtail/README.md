

# configuracion igual que en el anterior pero enfocado a promtail

buenas practica hacer primero el **docker-compose pull** y despues up -d

no funciono los logs de forma correcta en las pruebas que se hicieron sobre windows, sobre linux si se muestran los jobs, por ese motivo se dejo levantado un contenedor pero terminan mostrando lo mismo que monitoreo 2


en la configuracion adicional para los bash_history no se actualiza en tiempo real, para que eso suceda, se corrio un sh

lo que hace ese comando es que por cada comando que se ejecuta en el servidor se actualice al mismo tiempo el history, lo malo es que se debe correr por cada usuario que tengan en el servidor. 

### archivo de posicion
para ver el archivo de posicion se debe entrar al contenedor de promtail 
>docker exec -it promtail /bin/bash

se entra a la carpeta tem, y ahi se hace un cat y se ve los archivos que estuvo leyendo


notas: 

tener en cuenta que la hora no es del todo exacta, debido que toma la hora en la que se envia y puede verse a la misma hora en algunos cacos como el history