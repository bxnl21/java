package com.gamingstore.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamingstore.entity.Games;
import com.gamingstore.service.GamesService;
import com.gamingstore.service.impl.GamesServiceImpl;

@WebServlet(urlPatterns = "/game")
public class GamesController extends HttpServlet {

	private static final long serialVersionUID = 7388741981193937759L;
	
	private GamesService gamesService = new GamesServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionParam = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();
		
		switch (actionParam) {
			case "preview":
				doGetPreview(session, href, req, resp);
				break;
		}
	}
	
	private void doGetPreview(HttpSession session, String href, HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		Games game = gamesService.findByHref(href);
		req.setAttribute("game", game);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/detail.jsp");
		requestDispatcher.forward(req, resp);
	}
}
