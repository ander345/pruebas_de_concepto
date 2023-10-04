package com.kafka.multithread;

import java.time.Duration;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.errors.WakeupException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ambiente multithread para consumir mensajes de kafka
 * @author 01061
 *
 */
public class ThreadConsumer extends Thread{

	public static final Logger log = LoggerFactory.getLogger(ThreadConsumer.class);
	
	private final AtomicBoolean closed = new AtomicBoolean(false);
	
	 private final KafkaConsumer<String, String> consumer;
	
	 public ThreadConsumer(KafkaConsumer<String, String> consumer) {
		 this.consumer = consumer;
	 }
	 
	 
	@Override
	public void run() {
		
		consumer.subscribe(Arrays.asList("devs4j-topic"));
		
		try {
			while (!closed.get()) {
				ConsumerRecords<String,String>records=consumer.poll(Duration.ofMillis(100));
				for(ConsumerRecord<String,String>record:records) {
					log.debug("partition = {} , offset = {}, key = {},value = {}",
							record.partition(),record.offset(),record.key(),record.value());
					if((Integer.parseInt(record.key())%100000)==0) {
						log.info("partition = {} , offset = {}, key = {},value = {}",
								record.partition(),record.offset(),record.key(),record.value());
					}
				}
						
			}
		} catch (WakeupException e) {
			if(!closed.get()) {
				throw e;
			}
		}finally {
			consumer.close();
		}
			
		

	}
	
	public void shutdowm() {
		closed.set(true);
		consumer.wakeup();
	}
	

}
