package com.bamboo.service.impl;

import com.bamboo.dao.AdminDao;
import com.bamboo.dao.impl.AdminDaoImpl;
import com.bamboo.domain.Admin;
import com.bamboo.service.AdminService;

public class AdminServiceImpl implements AdminService {
	
	AdminDao ad=new AdminDaoImpl();
	
	public Admin login(String username, String password) throws Exception {
		return ad.getByAdminnameAndPwd(username,password);
	}
}
