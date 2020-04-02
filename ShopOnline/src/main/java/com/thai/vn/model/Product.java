package com.thai.vn.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable{

	private static final long serialVersionUID = -5462787754983651938L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	@NotNull
	private String name;
	
	@Column
	@NotNull
	private int price; 
	
	@Column
	@NotNull
	private int quantity;
	
	@Column
	@NotNull
	private String descriptions;
	
	@Column
	@NotNull
	private String photo;
	
	@ManyToOne
	@JoinColumn(name = "id_ProductType",referencedColumnName = "id" , nullable = true)
	private ProductType productType;
	
}
