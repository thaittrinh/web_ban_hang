package com.thai.vn.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
@Entity
@Table(name = "Customers")
public class Customer implements Serializable {

	
	private static final long serialVersionUID = 6052163315343673317L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column
	@NotNull
	private String name;
	
	@Column()
	@Length(max = 11)
	private String phone;
	
	@Column(unique = true)
	private String email;
	
	@Column
	@NotNull
	private String password;
	
	@Column
	private boolean gender;
	
	@Column
	private String adress;
	
	
	
}
