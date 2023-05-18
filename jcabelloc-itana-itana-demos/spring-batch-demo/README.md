# Demo de Spring Batch

## Referencias
* [Spring Boot With Spring Batch](https://www.baeldung.com/spring-boot-spring-batch)
* [Spring Batch Tutorial: Batch Processing Made Easy with Spring](https://www.toptal.com/spring/spring-batch-tutorial)
* [Scheduling Tasks](https://spring.io/guides/gs/scheduling-tasks/)
* [Configuring and Running a Job](https://docs.spring.io/spring-batch/docs/4.3.x/reference/html/job.html#configureJob)
* [Spring Batch - Reference Documentation](https://docs.spring.io/spring-batch/docs/4.3.x/reference/html/index.html)

## Creacion del proyecto con Spring Boot Starter

## BD Docker usada en la demo
* Script docker para iniciar BD
```
docker run -it -p 3306:3306 -e TZ=America/Lima -e MYSQL_ROOT_PASSWORD=secreto -e MYSQL_DATABASE=batchdb -e MYSQL_USER=batch -e MYSQL_PASSWORD=secreto --name batchdb mysql:8.0.22 --character-set-server=latin1 --collation-server=latin1_general_ci

```


