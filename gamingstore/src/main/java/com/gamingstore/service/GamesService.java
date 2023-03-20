package com.gamingstore.service;

import java.util.List;

import javax.persistence.EntityManager;

import com.gamingstore.entity.Games;

public interface GamesService {
	
	Games findById(Integer id);
	Games findByHref(String href);
	List<Games> findAll();
	Games create(Games entity);
	Games update(Games entity);
	Games delete(String href);
	void updateQuantity(Integer gameId, Integer quantity, EntityManager em);
}
