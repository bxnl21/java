package com.gamingstore.dao.impl;

import java.util.List;

import com.gamingstore.dao.AbstractDao;
import com.gamingstore.dao.UsersDao;
import com.gamingstore.entity.Users;

public class UsersDaoImpl extends AbstractDao<Users> implements UsersDao {

	@Override
	public Users findById(Integer id) {
		return super.findById(Users.class, id);
	}

	@Override
	public Users findByEmail(String email) {
		String sql = "SELECT o FROM Users o WHERE o.email = ?0";
		return super.findOne(Users.class, sql, email);
	}

	@Override
	public Users findByUsername(String username) {
		String sql = "SELECT o FROM Users o WHERE o.username = ?0";
		return super.findOne(Users.class, sql, username);
	}

	@Override
	public Users findByUsernameAndPassword(String username, String password) {
		String sql = "SELECT o FROM Users o WHERE o.username = ?0 AND o.password = ?1";
		return super.findOne(Users.class, sql, username, password);
	}

	@Override
	public List<Users> findAll() {
		return super.findAll(Users.class, true);
	}
}
