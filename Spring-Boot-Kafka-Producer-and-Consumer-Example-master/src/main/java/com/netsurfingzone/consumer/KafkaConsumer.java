package com.netsurfingzone.consumer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.netsurfingzone.constant.ApplicationConstant;
import com.netsurfingzone.dto.Student;

@Component
public class KafkaConsumer {

	private static final Logger logger = LoggerFactory.getLogger(KafkaConsumer.class);

	public Integer count = 0;
	
	@KafkaListener(groupId = ApplicationConstant.GROUP_ID_JSON
				, topics = ApplicationConstant.TOPIC_NAME
			//,containerFactory = ApplicationConstant.KAFKA_LISTENER_CONTAINER_FACTORY
			//, errorHandler = "voidSendToErrorHandler"
			)
	public void receivedMessage(Student message) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(message);
		count+=1;
		logger.info("print count: {} test {}", count, "prueba test");
		logger.info("Json message received using Kafka listener " + jsonString);
		//throw new RuntimeException("error generado prueba"); // this line is for test retries
		
		
	}
}
