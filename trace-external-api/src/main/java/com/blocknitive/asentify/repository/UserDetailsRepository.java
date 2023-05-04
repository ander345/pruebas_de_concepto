package com.blocknitive.asentify.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blocknitive.asentify.model.UserDetails;


public interface UserDetailsRepository extends JpaRepository<UserDetails, String>{
	
	//@Query(value="select * from userDetails  where name=:name", nativeQuery = true)
	Optional<UserDetails> findById(String id);
	
}