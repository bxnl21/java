package com.gamingstore.service;

import java.util.List;

import com.gamingstore.entity.Users;

public interface UsersService {
	
	Users findById(Integer id);
	Users findByEmail(String email);
	Users findByUsername(String username);
	Users login(String username, String password);
	List<Users> findAll();
}