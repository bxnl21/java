package com.gamingstore.service.impl;

import java.util.List;

import com.gamingstore.dao.UsersDao;
import com.gamingstore.dao.impl.UsersDaoImpl;
import com.gamingstore.entity.Users;
import com.gamingstore.service.UsersService;

public class UsersServiceImpl implements UsersService {
	
	private UsersDao dao;
	
	public UsersServiceImpl() {
		dao = new UsersDaoImpl();	
	}

	@Override
	public Users findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public Users findByEmail(String email) {
		return dao.findByEmail(email);
	}

	@Override
	public Users findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public Users login(String username, String password) {
		return dao.findByUsernameAndPassword(username, password);
	}

	@Override
	public List<Users> findAll() {
		return dao.findAll();
	}
}
