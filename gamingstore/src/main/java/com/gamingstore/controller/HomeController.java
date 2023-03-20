package com.gamingstore.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamingstore.constant.SessionAttr;
import com.gamingstore.entity.Games;
import com.gamingstore.entity.Users;
import com.gamingstore.service.GamesService;
import com.gamingstore.service.UsersService;
import com.gamingstore.service.impl.GamesServiceImpl;
import com.gamingstore.service.impl.UsersServiceImpl;

@WebServlet(urlPatterns = {"/index", "/login", "/logout"})
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 217102226059304023L;
	
	private GamesService gamesService = new GamesServiceImpl(); 
	private UsersService usersService = new UsersServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
			case "/index":
				doGetIndex(req, resp);
				break;
			case "/logout":
				doGetLogout(session, req, resp);
				break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
			case "/login":
				doPostLogin(session, req, resp);
				break;
		}
	}
	
	private void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Games> games = gamesService.findAll();
		req.setAttribute("games", games);
		req.setCharacterEncoding("UTF-8");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/index.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session.removeAttribute(SessionAttr.CURRENT_USER);
		resp.sendRedirect("index");
	}
	
	private void doPostLogin(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		Users user = usersService.login(username, password);
		
		if (user != null) {
			session.setAttribute(SessionAttr.CURRENT_USER, user);
			resp.sendRedirect("index");
		} else {
			resp.sendRedirect("index");
		}
	}
}
