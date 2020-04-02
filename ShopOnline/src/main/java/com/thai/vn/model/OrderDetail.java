package com.thai.vn.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Entity
@Table(name = "OrderDetail")
public class OrderDetail implements Serializable{

	private static final long serialVersionUID = -2398465965412677633L;

	@EmbeddedId
	private PK pk;
	
	@Column
	@NotNull
	private int price;
	
	@Column
	@NotNull
	private int quantity;
	
	@Embeddable
	public static class PK implements Serializable {

		private static final long serialVersionUID = -1665273498712598013L;

		@ManyToOne
		@JoinColumn(name = "id_Order", referencedColumnName = "id", nullable = false)
		private Order order;
		
		@ManyToOne
		@JoinColumn(name = "id_Product", referencedColumnName = "id", nullable = false)
		private Product product;
		
	}
}
