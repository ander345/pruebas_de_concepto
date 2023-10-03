package com.kafka.consumers;

import java.util.Properties;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Producers {

	public static final Logger log = LoggerFactory.getLogger(Producers.class);
	
	public static void main(String[] args) {

		long startTime = System.currentTimeMillis();
		
		Properties props=new Properties();
		props.put("bootstrap.servers","localhost:9092");// Broker de kafka al que nos vamos a conectar
		props.put("acks","all");// se puede poner 1 o 2 referente al broker
		/*props.put("compression.type","gzip");
		props.put("linger.ms","1");
		props.put("batch.size","32384");
		props.put("transactional.id","devs4j-producer");
		props.put("buffer.memory","33554432");*/
		props.put("key.serializer",
		"org.apache.kafka.common.serialization.StringSerializer");// en este caso es para que sea un string
		props.put("value.serializer",
		"org.apache.kafka.common.serialization.StringSerializer");
		
		/**
		 * ejemplo simple 1
		 */
		/*try(Producer<String, String> producer = new	KafkaProducer<>(props)) {
			producer.send(new ProducerRecord<String, String>("devs4j-topic","devsj-key", "devs4j-value"));
		}*/
		
		/**
		 * ejemplo simple 2, es un envio de forma asincrona, no llegaran en orden, si agrego un .get() seria syncrono
		 * tener en cuenta que se debe tener encuenta por el performance
		 */
		try(Producer<String, String> producer = new	KafkaProducer<>(props)) {
			for(int i= 0;i< 10000;i++) {
				producer.send(new ProducerRecord<String, String>("devs4j-topic",String.valueOf(i), "devs4j-value"));
			}
			producer.flush();
		}
		
		log.info("processing time = {} ms ", (System.currentTimeMillis()-startTime));
		
		
		
		/*try(Producer<String, String> producer = new	Kafk aProducer<>(props)) {
			try{
				producer.initTransactions();
				producer.beginTransaction();
				for(int i= 0;i< 100000;i++) {
					producer.send(new
					ProducerRecord<>("devs4j-topic","message"));
					if(i== 100) {
						throw new Exception("Random exception");
					}
				}
				producer.commitTransaction();
			}catch(Exception e) {
				producer.abortTransaction();
				log.error("Error processing messages",e);
			}
		}*/
	}
}
