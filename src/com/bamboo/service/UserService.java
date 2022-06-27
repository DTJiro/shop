package com.bamboo.service;

import com.bamboo.domain.User;

public interface UserService {

	void register(User user) throws Exception;

	User login(String username, String password) throws Exception;

}
