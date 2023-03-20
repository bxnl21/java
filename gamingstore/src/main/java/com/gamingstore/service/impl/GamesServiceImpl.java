package com.gamingstore.service.impl;

import java.util.List;

import javax.persistence.EntityManager;

import com.gamingstore.dao.GamesDao;
import com.gamingstore.dao.impl.GamesDaoImpl;
import com.gamingstore.entity.Games;
import com.gamingstore.service.GamesService;

public class GamesServiceImpl implements GamesService {
	
	private GamesDao dao;
	
	public GamesServiceImpl() {
		dao = new GamesDaoImpl();
	}

	@Override
	public Games findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public Games findByHref(String href) {
		return dao.findByHref(href);
	}

	@Override
	public List<Games> findAll() {
		return dao.findAll();
	}

	@Override
	public Games create(Games entity) {
		entity.setIsActive(Boolean.TRUE);
		return dao.create(entity);
	}

	@Override
	public Games update(Games entity) {
		return dao.update(entity);
	}

	@Override
	public Games delete(String href) {
		Games entity = findByHref(href);
		entity.setIsActive(Boolean.FALSE);
		return dao.update(entity);
	}

	@Override
	public void updateQuantity(Integer gameId, Integer quantity, EntityManager em) {
		dao.updateQuantity(gameId, quantity, em);
	}
}