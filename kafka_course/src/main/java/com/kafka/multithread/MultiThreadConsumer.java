package com.kafka.multithread;

import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.kafka.clients.consumer.KafkaConsumer;

public class MultiThreadConsumer {
	public static void main(String[] args) {
		Properties props=new Properties();
		props.setProperty("bootstrap.servers","localhost:9092");
		props.setProperty("group.id","devs4j-group");
		props.setProperty("enable.auto.commit","true");
		props.setProperty("auto.commit.interval.ms","1000");
		props.setProperty("key.deserializer",
		"org.apache.kafka.common.serialization.StringDeserializer");
		props.setProperty("value.deserializer",
		"org.apache.kafka.common.serialization.StringDeserializer");
		props.setProperty("isolation.level","read_committed");
		
		//para lanzar 5 hilos, teniendo en cuenta que tengo 5 particiones
		ExecutorService executor = Executors.newFixedThreadPool(5);
		for(int i= 0;i< 5;i++) {
			ThreadConsumer consumer = new
					ThreadConsumer(new KafkaConsumer<>(props));
					executor.execute(consumer);
			/*Runnable worker= new
			ThreadConsumer(new KafkaConsumer<>(props));
			executor.execute(worker);*/
		}
		executor.shutdown();
		while(!executor.isTerminated()) ;
	}

}
