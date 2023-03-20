package com.gamingstore.service;

import com.gamingstore.dto.CartDto;

public interface CartService {
	
	CartDto updateCart(CartDto cart, Integer gameId, Integer quantity, boolean isReplace);
	Integer getTotalQuantity(CartDto cart);
	Double getTotalPrice(CartDto cart);
	void insert(CartDto cart) throws Exception;
}
