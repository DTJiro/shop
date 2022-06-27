package com.bamboo.service;

import com.bamboo.domain.Admin;

public interface AdminService {
	
	Admin login(String username, String password) throws Exception;
}
