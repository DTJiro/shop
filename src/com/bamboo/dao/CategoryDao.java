package com.bamboo.dao;

import java.util.List;

import com.bamboo.domain.Category;

public interface CategoryDao {

	List<Category> findAll() throws Exception;

	void save(Category c) throws Exception;

}
