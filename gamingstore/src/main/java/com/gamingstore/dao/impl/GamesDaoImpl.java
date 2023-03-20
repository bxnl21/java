package com.gamingstore.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;

import com.gamingstore.dao.AbstractDao;
import com.gamingstore.dao.GamesDao;
import com.gamingstore.entity.Games;

public class GamesDaoImpl extends AbstractDao<Games> implements GamesDao {

	@Override
	public Games findById(Integer id) {
		return super.findById(Games.class, id);
	}

	@Override
	public Games findByHref(String href) {
		String sql = "SELECT o FROM Games o WHERE o.href = ?0";
		return super.findOne(Games.class, sql, href);
	}

	@Override
	public List<Games> findAll() {
		return super.findAll(Games.class, true);
	}

	@Override
	public void updateQuantity(Integer gameId, Integer quantity, EntityManager em) {
		String sql = String.format("UPDATE games SET quantity = %d WHERE id = %d", 
				quantity, gameId);
		super.executeNativeQueryNoReturn(sql, em);
	}
}
