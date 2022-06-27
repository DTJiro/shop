package com.bamboo.service.impl;

import java.util.List;

import com.bamboo.dao.OrderDao;
import com.bamboo.dao.impl.OrderDaoImpl;
import com.bamboo.domain.Order;
import com.bamboo.domain.OrderItem;
import com.bamboo.domain.PageBean;
import com.bamboo.service.OrderService;
import com.bamboo.utils.DataSourceUtils;

public class OrderServiceImpl implements OrderService {

	@Override
	/**
	 * 保存订单
	 */
	public void save(Order order) throws Exception{
		try {
			//获取dao
			OrderDao od  =new OrderDaoImpl();
			//1.开启事务
			DataSourceUtils.startTransaction();
			
			//2.向orders表中插入一条
			od.save(order);
			
			//3.向orderitem中插入n条
			for (OrderItem oi : order.getItems()) {
				od.saveItem(oi);
			}
			
			//4.事务控制
			DataSourceUtils.commitAndClose();
		} catch (Exception e) {
			e.printStackTrace();
			DataSourceUtils.rollbackAndClose();
			throw e;
		}
	}

	
	/**
	 * 我的订单
	 */
	public PageBean<Order> findMyOrdersByPage(int pageNumber, int pageSize, int uid) throws Exception {
		OrderDao od  =new OrderDaoImpl();
		
		//1.创建pagebean
		PageBean<Order> pb = new PageBean<>(pageNumber, pageSize);
		
		//2.查询总条数  设置总条数 
		int totalRecord = od.getTotalRecord(uid);
		pb.setTotalRecord(totalRecord);
		
		//3.查询当前页数据 设置当前页数据
		List<Order> data = od.findMyOrdersByPage(pb,uid);
		pb.setData(data);
		return pb;
	}

	@Override
	/**
	 * 订单详情
	 */
	public Order getById(String oid) throws Exception {
		OrderDao od = new OrderDaoImpl();
		return od.getById(oid);
	}

	@Override
	/**
	 * 修改订单
	 */
	public void update(Order order) throws Exception {
		OrderDao od = new OrderDaoImpl();
		od.update(order);
	}

	@Override
	/**
	 * 后台查询订单列表
	 */
	public List<Order> findAllByState(String state) throws Exception {

		OrderDao od = new OrderDaoImpl();
		return od.findAllByState(state);
	}

}
