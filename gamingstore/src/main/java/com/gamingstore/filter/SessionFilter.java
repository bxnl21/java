package com.gamingstore.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.gamingstore.constant.SessionAttr;
import com.gamingstore.dto.CartDto;

public class SessionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		if (null == session.getAttribute(SessionAttr.CURRENT_CART)) {
			session.setAttribute(SessionAttr.CURRENT_CART, new CartDto());
		}
		chain.doFilter(request, response);
	}
}
