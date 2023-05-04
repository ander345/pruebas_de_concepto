package com.blocknitive.asentify.controller;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blocknitive.asentify.model.Msg;
import com.blocknitive.asentify.service.MailService;
import com.blocknitive.asentify.serviceImpl.MailServiceImpl;
import com.wordnik.swagger.annotations.Api;

@RestController
@Api(value = "SendEmailApiController", description = "controller class for java service execution")
@RequestMapping("/sendEmailApi")
public class SendEmailApiController {

	private static final Logger logger = LoggerFactory.getLogger(MailServiceImpl.class);
	
	@Autowired
	private MailService mailService;
	
    @PostMapping("/send")
    public ResponseEntity<String> sendEmail( @RequestBody Msg msg ) throws Throwable {
    	UUID uuid = UUID.randomUUID();
	    String uuidAs = uuid.toString();  
        try {
        	logger.info("Call send mailServic... ");
        	logger.info("uuid: " + uuidAs);
            return ResponseEntity.ok( mailService.sendEmail(msg.getUserId()) + " ,uuid: " + uuidAs );
        } catch (Exception e) {
        	logger.warn("Message not sent: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Message not sent, uuid: " + uuidAs);
        }
    }
}
