package com.blocknitive.asentify.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "`contactDetails`")
@Data
public class ContactDetails {

    @Id
    @Column(name = "`id`")
    private String id;

    @Column(name = "`email`")
    private String email;
}
