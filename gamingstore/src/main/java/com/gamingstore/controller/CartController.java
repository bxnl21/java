package com.gamingstore.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamingstore.constant.SessionAttr;
import com.gamingstore.dto.CartDto;
import com.gamingstore.service.CartService;
import com.gamingstore.service.impl.CartServiceImpl;

@WebServlet(urlPatterns = "/cart")
public class CartController extends HttpServlet {

	private static final long serialVersionUID = -8822796803721051803L;
	
	private CartService cartService = new CartServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = "";
		if (null != req.getParameter("action")) {
			action = req.getParameter("action");
		}
		switch (action) {
		case "update":
			doGetUpdate(req, resp);
			break;
		case "checkout":
			doGetCheckout(req, resp);
			break;
		case "view":
		case "":
			doGetViewCart(req, resp);
		}
	}

	private void doGetViewCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/cart.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetUpdate(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		CartDto currentCart = (CartDto) session.getAttribute(SessionAttr.CURRENT_CART);
		
		resp.setContentType("application/json");
		String gameId = req.getParameter("gameId");
		String quantity = req.getParameter("quantity");
		String isReplace = req.getParameter("isReplace");
		try {
			cartService.updateCart(currentCart, Integer.valueOf(gameId), Integer.valueOf(quantity), Boolean.valueOf(isReplace));
			resp.setStatus(204);
		} catch (Exception ex) {
			ex.printStackTrace();
			resp.setStatus(400);
		}
	}
	
	private void doGetCheckout(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		CartDto currentCart = (CartDto) session.getAttribute(SessionAttr.CURRENT_CART);
		
		resp.setContentType("application/json");
		try {
			cartService.insert(currentCart);
			session.setAttribute(SessionAttr.CURRENT_CART, new CartDto());
			resp.setStatus(204);
		} catch (Exception ex) {
			ex.printStackTrace();
			resp.setStatus(400);
		}
	}
}
