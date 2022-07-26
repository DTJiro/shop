package com.bamboo.service.impl;

import com.bamboo.constant.Constant;
import com.bamboo.dao.UserDao;
import com.bamboo.dao.impl.UserDaoImpl;
import com.bamboo.domain.User;
import com.bamboo.service.UserService;


public class UserServiceImpl implements UserService {
	
	UserDao ud=new UserDaoImpl();

	@Override
	/**
	 * 用户注册
	 */
	public void register(User user) throws Exception {
		//1.调用dao完成注册
		ud.save(user);
		
	}

	@Override
	/**
	 * 用户登录
	 */
	public User login(String username, String password) throws Exception {
		return ud.getByUsernameAndPwd(username,password);
	}
}
