package com.bamboo.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.bamboo.dao.CategoryDao;
import com.bamboo.domain.Category;
import com.bamboo.utils.DataSourceUtils;

public class CategoryDaoImpl implements CategoryDao {

	QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	
	@Override
	/**
	 * 查询所有分类
	 */
	public List<Category> findAll() throws Exception {
		String sql = "select * from category";
		return qr.query(sql, new BeanListHandler<>(Category.class));
	}

	@Override
	/**
	 * 添加分类
	 */
	public void save(Category c) throws Exception {
		String sql = "insert into category values (?,?);";
		qr.update(sql, c.getCid(),c.getCname());
	}

}
