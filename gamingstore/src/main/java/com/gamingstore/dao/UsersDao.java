package com.gamingstore.dao;

import java.util.List;

import com.gamingstore.entity.Users;

public interface UsersDao {
	
	Users findById(Integer id);
	Users findByEmail(String email);
	Users findByUsername(String username);
	Users findByUsernameAndPassword(String username, String password);
	List<Users> findAll();
	Users create(Users entity);
	Users update(Users entity);
	Users delete(Users entity);
}
