package com.blocknitive.asentify.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blocknitive.asentify.model.ContactDetails;


public interface ContactDetailsRepository extends JpaRepository<ContactDetails, String>{

	Optional<ContactDetails> findById(String id);
}