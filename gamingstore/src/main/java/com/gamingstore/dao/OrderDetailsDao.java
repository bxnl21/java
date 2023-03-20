package com.gamingstore.dao;

import javax.persistence.EntityManager;

import com.gamingstore.dto.CartDetailDto;

public interface OrderDetailsDao {
	
	void insert(CartDetailDto dto, EntityManager em);
}
