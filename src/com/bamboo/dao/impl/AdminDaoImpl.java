package com.bamboo.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bamboo.dao.AdminDao;
import com.bamboo.domain.Admin;
import com.bamboo.utils.DataSourceUtils;

public class AdminDaoImpl implements AdminDao {
	
	QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	
	public Admin getByAdminnameAndPwd(String username, String password) throws Exception {
		String sql = "select * from admin where username = ? and password = ? limit 1";
		return qr.query(sql, new BeanHandler<>(Admin.class), username,password);
	}
}
