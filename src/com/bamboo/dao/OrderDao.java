package com.bamboo.dao;

import java.util.List;

import com.bamboo.domain.Order;
import com.bamboo.domain.OrderItem;
import com.bamboo.domain.PageBean;

public interface OrderDao {

	void save(Order order) throws Exception;

	void saveItem(OrderItem oi) throws Exception;

	int getTotalRecord(int uid) throws Exception;

	List<Order> findMyOrdersByPage(PageBean<Order> pb, int uid) throws Exception;

	Order getById(String oid) throws Exception;

	void update(Order order) throws Exception;

	List<Order> findAllByState(String state) throws Exception;

}
