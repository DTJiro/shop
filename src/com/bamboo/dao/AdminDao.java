package com.bamboo.dao;

import com.bamboo.domain.Admin;

public interface AdminDao {
	
	Admin getByAdminnameAndPwd(String username, String password) throws Exception;
}
