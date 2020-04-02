package com.thai.vn.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "Users")
public class User implements Serializable {
	

	private static final long serialVersionUID = -3498543312105752155L;

	@Id
	@GeneratedValue( strategy= GenerationType.IDENTITY)
	private int id;
	
	@NotNull
	@Column(unique = true)
	private String userName;
	
	@Column
	@NotNull
 	private String password;
	
	@Column
	@NotNull
	@Length(max = 11)
	private String fullName;
	
	@Column
	@NotNull
	private String phone;
	
	@Column(unique = true)
	@NotNull
	private String email;
	
	@Column
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd") //MM/dd/yyyy
	private Date date;
	
	@Column()
	@NotNull
	private boolean gender;
	
	@Column()
	private String photo;
	
	@Column()
	@NotNull
	private String adress;
	
	@Column()
	private String notes;
	
}
