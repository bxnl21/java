package com.gamingstore.dao.impl;

import javax.persistence.EntityManager;

import com.gamingstore.dao.AbstractDao;
import com.gamingstore.dao.OrderDetailsDao;
import com.gamingstore.dto.CartDetailDto;
import com.gamingstore.entity.OrderDetails;

public class OrderDetailsDaoImpl extends AbstractDao<OrderDetails> implements OrderDetailsDao {

	@Override
	public void insert(CartDetailDto dto, EntityManager em) {
		String sql = String.format("INSERT INTO order_details(orderId, gameId, price, quantity)"
				+ " VALUES(%d, %d, %s, %d)", 
				dto.getOrderId(), dto.getGameId(), dto.getPrice(), dto.getQuantity());
		super.executeNativeQueryNoReturn(sql, em);
	}
}
