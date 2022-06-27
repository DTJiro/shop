package com.bamboo.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bamboo.dao.UserDao;
import com.bamboo.domain.User;
import com.bamboo.utils.DataSourceUtils;

public class UserDaoImpl implements UserDao{
	
	QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	/**
	 * 用户注册
	 */
	public void save(User user) throws SQLException {

		String sql = "insert into user values(?,?,?,?,?,?,?,?);";
		qr.update(sql, user.getUid(),user.getUsername(),user.getPassword(),
				user.getName(),user.getEmail(),user.getTelephone(),
				user.getBirthday(),user.getSex());
	}

	/**
	 * 更新用户
	 */
	public void update(User user) throws Exception {

		String sql="update user set password = ?,sex = ? where uid = ?";
		qr.update(sql, user.getPassword(),user.getSex(),user.getUid());
	}

	/**
	 * 用户登录
	 */
	public User getByUsernameAndPwd(String username, String password) throws Exception {
		String sql = "select * from user where username = ? and password = ? limit 1";
		return qr.query(sql, new BeanHandler<>(User.class), username,password);
	}
}
