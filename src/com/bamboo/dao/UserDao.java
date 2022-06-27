package com.bamboo.dao;

import com.bamboo.domain.User;

public interface UserDao {

	void save(User user) throws Exception;

	void update(User user) throws Exception;

	User getByUsernameAndPwd(String username, String password) throws Exception;
}
