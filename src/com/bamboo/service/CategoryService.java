package com.bamboo.service;

import java.util.List;

import com.bamboo.domain.Category;

public interface CategoryService {

	String findAll() throws Exception;

	String findAllFromRedis() throws Exception;

	List<Category> findList() throws Exception;

	void save(Category c) throws Exception;

}