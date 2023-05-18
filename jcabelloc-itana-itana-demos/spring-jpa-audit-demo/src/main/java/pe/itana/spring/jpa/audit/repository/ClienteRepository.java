package pe.itana.spring.jpa.audit.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pe.itana.spring.jpa.audit.models.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

}
