package com.gamingstore.service.impl;

import javax.persistence.EntityManager;

import com.gamingstore.dao.OrderDetailsDao;
import com.gamingstore.dao.impl.OrderDetailsDaoImpl;
import com.gamingstore.dto.CartDetailDto;
import com.gamingstore.service.OrderDetailsService;

public class OrderDetailsServiceImpl implements OrderDetailsService {
	
	private OrderDetailsDao dao;
	
	public OrderDetailsServiceImpl() {
		dao = new OrderDetailsDaoImpl();
	}

	@Override
	public void insert(CartDetailDto dto, EntityManager em) {
		dao.insert(dto, em);
	}
}
