package com.thai.vn.model;

import java.io.Serializable;
import java.util.Date;

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
@Table(name = "Orders")
public class Order implements Serializable {

	private static final long serialVersionUID = -8548882817634692523L;

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column
	@NotNull
	private Date date;
	
	@ManyToOne
	@JoinColumn(name = "id_Customer", referencedColumnName = "id", nullable = false)
	private Customer customer;
}
