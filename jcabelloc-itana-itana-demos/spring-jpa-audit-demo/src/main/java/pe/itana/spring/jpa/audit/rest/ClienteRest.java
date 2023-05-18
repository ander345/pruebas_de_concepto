package pe.itana.spring.jpa.audit.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pe.itana.spring.jpa.audit.models.Cliente;
import pe.itana.spring.jpa.audit.repository.ClienteRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("clientes")
public class ClienteRest {
	private static final Logger logger = LoggerFactory.getLogger(ClienteRest.class);

	@Autowired
	ClienteRepository clienteRepository;
	
	@GetMapping
	public List<Cliente> getClientes() {
		
		return clienteRepository.findAll();
	}
	
	@PostMapping
	public Cliente createCliente(@RequestBody Cliente cliente ) {
		return clienteRepository.save(cliente);
	}
}
