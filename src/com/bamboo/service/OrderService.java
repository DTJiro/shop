package com.bamboo.service;

import java.util.List;

import com.bamboo.domain.Order;
import com.bamboo.domain.PageBean;

public interface OrderService {

	void save(Order order)throws Exception;

	PageBean<Order> findMyOrdersByPage(int pageNumber, int pageSize, int i)throws Exception;

	Order getById(String oid)throws Exception;

	void update(Order order)throws Exception;

	List<Order> findAllByState(String state)throws Exception;

}

