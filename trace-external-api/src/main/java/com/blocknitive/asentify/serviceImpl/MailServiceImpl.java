package com.blocknitive.asentify.serviceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.implementation.bytecode.Throw;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.jboss.jandex.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.blocknitive.asentify.model.UserDetails;
import com.blocknitive.asentify.repository.ContactDetailsRepository;
import com.blocknitive.asentify.repository.UserDetailsRepository;
import com.blocknitive.asentify.service.MailService;
import com.blocknitive.asentify.utils.CssInliner;




@Service
@Slf4j
@RequiredArgsConstructor
public class MailServiceImpl implements MailService
{
	@Autowired
	private JavaMailSender emailSender;
	
	@Value("${spring.mail.properties.mail.smtp.from}")
    private String from;
	
	@Autowired
    private SpringTemplateEngine templateEngine;
	
	@Autowired
	private final UserDetailsRepository userDetailsRepository;

    @Autowired
    private final ContactDetailsRepository contactDetailsRepository;
	
	public interface userDetails {
	    String getNombre();
	}
	
	@Override
	public String sendEmail(String id) throws Throwable {
		try {
			log.info("Inicio sendEmail ");

			Optional<UserDetails> userDetails = userDetailsRepository.findById(id);
            String name = userDetails.get().name;
            String to = contactDetailsRepository.findById(userDetails.get().contactId).get().getEmail();
			log.info("Enviando a: " + to);

			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
            Context context = new Context();
            Map<String, Object> model = new HashMap<>();
            model.put("name", name);
            model.put("text", "prueba enviando correo");
            model.put("sign", to);
            context.setVariables(model);
            String html = templateEngine.process("mail", context);
            
            InputStream inputStream = Main.class.getResourceAsStream("/templates/theme/default.css");
            File tempFile = File.createTempFile("default", ".css");
            try (FileOutputStream outputStream = new FileOutputStream(tempFile)) {
                IOUtils.copy(inputStream, outputStream);
            }
            
            String template = CssInliner.inlineCss(tempFile, html);
            System.out.println("aqui");
            System.out.println(template);
            to = "jose.casas@blocknitive.com";
            System.out.println(from);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject("Asentify Notificación: Envio de correo");
            helper.setText(template, true);
            log.info("sending...");
            emailSender.send(message);
            log.info("Email sent successfully!");
	        return "Email sent successfully!";
	        
		} catch (MessagingException e) {
			log.error("Message not sent in sendEmail: " + e.getMessage());
            e.printStackTrace();
            throw  new Exception(e.getMessage());
        } catch (FileNotFoundException e) {
        	log.error("Message not sent in sendEmail: " + e.getMessage());
            e.printStackTrace();
            throw  new Exception(e.getMessage());
        } catch (IOException e) {
        	log.error("Message not sent in sendEmail: " + e.getMessage());
            e.printStackTrace();
            throw  new Exception(e.getMessage());
        } catch (Exception e) {
			log.error("Message not sent in sendEmail: " + e.getMessage());
            e.printStackTrace();
            throw  new Exception(e.getMessage());
		}
        
	}
	
		

}
