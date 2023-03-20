package com.gamingstore.service.impl;

import java.util.HashMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import com.gamingstore.dto.CartDetailDto;
import com.gamingstore.dto.CartDto;
import com.gamingstore.entity.Games;
import com.gamingstore.entity.Orders;
import com.gamingstore.service.CartService;
import com.gamingstore.service.GamesService;
import com.gamingstore.service.OrderDetailsService;
import com.gamingstore.service.OrdersService;
import com.gamingstore.util.JpaUtil;

public class CartServiceImpl implements CartService {
	
	private GamesService gameService = new GamesServiceImpl();
	private OrdersService orderService = new OrdersServiceImpl();
	private OrderDetailsService orderDetailService = new OrderDetailsServiceImpl();
	
	@Override
	public CartDto updateCart(CartDto cart, Integer gameId, Integer quantity, boolean isReplace) {
		Games game = gameService.findById(gameId);
		
		HashMap<Integer, CartDetailDto> details = cart.getDetails();

		if (!details.containsKey(gameId)) {
			CartDetailDto newDetail = createNewCartDetail(game, quantity);
			details.put(gameId, newDetail);
		} else if (quantity > 0) {
			if (isReplace) {
				details.get(gameId).setQuantity(quantity);
			} else {
				details.get(gameId).setQuantity(details.get(gameId).getQuantity() + quantity);
			}
		} else {
			details.remove(gameId);
		}
		cart.setTotalQuantity(getTotalQuantity(cart));
		cart.setTotalPrice(getTotalPrice(cart));
		return cart;
	}

	@Override
	public Integer getTotalQuantity(CartDto cart) {
		Integer totalQuantity = 0;
		HashMap<Integer, CartDetailDto> details = cart.getDetails();
		for (CartDetailDto cartDetail : details.values()) {
			totalQuantity += cartDetail.getQuantity();
		}
		return totalQuantity;
	}

	@Override
	public Double getTotalPrice(CartDto cart) {
		Double totalPrice = 0D;
		HashMap<Integer, CartDetailDto> details = cart.getDetails();
		for (CartDetailDto cartDetail : details.values()) {
			totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
		}
		return totalPrice;
	}

	@Override
	public void insert(CartDto cart) throws Exception {
		EntityManager em = JpaUtil.getEntityManager();
		EntityTransaction entityTransaction = em.getTransaction();
		entityTransaction.begin();
		
		Orders order = new Orders();
		order.setAddress("HCM");
		order.setPhone("0987654321");
		order.setFullname("Bai lam");
		order.setEmail("gamingstore@gmail.com");
		
		Orders orderResponse = orderService.create(order);
		
		for (CartDetailDto cartDetail : cart.getDetails().values()) {
			Games game = gameService.findById(cartDetail.getGameId());
			cartDetail.setOrderId(orderResponse.getId());
			orderDetailService.insert(cartDetail, em);
			
			Integer newQuantity = game.getQuantity() - cartDetail.getQuantity();
			gameService.updateQuantity(game.getId(), newQuantity, em);
		}
		
		em.getTransaction().commit();
		em.close();
	}
	
	private CartDetailDto createNewCartDetail(Games game, Integer quantity) {
		CartDetailDto cartDetail = new CartDetailDto();
		cartDetail.setGameId(game.getId());
		cartDetail.setPrice(game.getPrice());
		cartDetail.setQuantity(quantity);
		cartDetail.setPoster(game.getPoster());
		cartDetail.setHref(game.getHref());
		cartDetail.setTitle(game.getTitle());
		return cartDetail;
	}
}
