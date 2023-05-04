package com.blocknitive.asentify.model;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
@ToString
@EqualsAndHashCode
@Table( name = "\"userDetails\"")
public class UserDetails {
	
    @Id
    @Column(name = "\"id\"")
    public String id;

    @Column(name = "\"name\"")
    public String name;

    @Column(name = "\"contactId\"")
    public String contactId;
	
}
