package com.thai.vn.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * The class handler 404 exception 
 */
@Data
@AllArgsConstructor
@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class NotFoundExc extends RuntimeException{

	private static final long serialVersionUID = -5303403440666022501L;
	
	private String message;
}
