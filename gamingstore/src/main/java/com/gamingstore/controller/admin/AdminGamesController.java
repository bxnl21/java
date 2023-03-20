package com.gamingstore.controller.admin;

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
import com.gamingstore.service.impl.GamesServiceImpl;

@WebServlet(urlPatterns = {"/admin/game"})
public class AdminGamesController extends HttpServlet {

	private static final long serialVersionUID = 3968414433292121855L;
	
	private GamesService gamesService = new GamesServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Users currentUser = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
				case "view":
					doGetOverView(req, resp);
					break;
				case "add":
					doGetAdd(req, resp);
					break;
				case "delete":
					doGetDelete(req, resp);
					break;
				case "edit":
					req.setAttribute("isEdit", true);
					doGetEdit(req, resp);
					break;
			}
		} else {
			resp.sendRedirect("/gamingstore/index");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Users currentUser = (Users) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
				case "add":
					doPostAdd(req, resp);
					break;
				case "edit":
					doPostEdit(req, resp);
					break;
			}
		} else {
			resp.sendRedirect("/gamingstore/index");
		}
	}
	
	private void doGetOverView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Games> games = gamesService.findAll();
		req.setAttribute("games", games);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/game-overview.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/game-edit.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String href = req.getParameter("href");
		Games gameDeleted = gamesService.delete(href);
		if (gameDeleted != null) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}
	
	private void doGetEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String href = req.getParameter("href");
		Games game = gamesService.findByHref(href);
		req.setAttribute("game", game);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/admin/game-edit.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doPostAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String href = req.getParameter("newHref");
		String poster = req.getParameter("poster");
		
		Games game = new Games();
		game.setTitle(title);
		game.setHref(href);
		game.setDescription(description);
		game.setPoster(poster);
		game.setPrice(100000D);
		game.setQuantity(100);
		
		Games gameReturn = gamesService.create(game);
		if (gameReturn != null) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}
	
	private void doPostEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String href = req.getParameter("newHref");
		String poster = req.getParameter("poster");
		String hrefOrigin = req.getParameter("hrefOrigin");
		
		Games game = gamesService.findByHref(hrefOrigin);
		game.setTitle(title);
		game.setHref(href);
		game.setDescription(description);
		game.setPoster(poster);
		
		Games gameReturn = gamesService.update(game);
		if (gameReturn != null) {
			resp.setStatus(204);
		} else {
			resp.setStatus(400);
		}
	}
}
