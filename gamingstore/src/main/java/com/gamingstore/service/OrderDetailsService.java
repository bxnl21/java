package com.gamingstore.service;

import javax.persistence.EntityManager;

import com.gamingstore.dto.CartDetailDto;

public interface OrderDetailsService {
	
	void insert(CartDetailDto dto, EntityManager em);
}
