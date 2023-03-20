package com.gamingstore.service.impl;

import com.gamingstore.dao.OrdersDao;
import com.gamingstore.dao.impl.OrdersDaoImpl;
import com.gamingstore.entity.Orders;
import com.gamingstore.service.OrdersService;

public class OrdersServiceImpl implements OrdersService {
	
	private OrdersDao dao;
	
	public OrdersServiceImpl() {
		dao = new OrdersDaoImpl();
	}

	@Override
	public Orders create(Orders entity) {
		return dao.create(entity);
	}

}
