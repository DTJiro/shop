package com.bamboo.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.bamboo.constant.Constant;
import com.bamboo.dao.ProductDao;
import com.bamboo.domain.PageBean;
import com.bamboo.domain.Product;
import com.bamboo.utils.DataSourceUtils;

public class ProductDaoImpl implements ProductDao {

	QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	
	@Override
	/**
	 * 查询热门
	 */
	public List<Product> findHot() throws Exception {
		String sql = "select * from product where is_hot = ? and pflag = ? order by pdate desc limit 9";
		return qr.query(sql, new BeanListHandler<>(Product.class), Constant.PRODUCT_HOT,Constant.PRODUCT_UP);
	}

	@Override
	/**
	 * 查询最新
	 */
	public List<Product> findNew() throws Exception {
		String sql = "select * from product where pflag = ? order by pdate desc limit 9";
		return qr.query(sql, new BeanListHandler<>(Product.class),Constant.PRODUCT_UP);
	}

	@Override
	/**
	 * 查询单个商品
	 */
	public Product getById(String pid) throws Exception {
		String sql = "select * from product where pid = ? limit 1";
		return qr.query(sql, new BeanHandler<>(Product.class), pid);
		
	}

	@Override
	/**
	 * 查询当前页数据
	 */
	public List<Product> findByPage(PageBean<Product> pb, String cid) throws Exception {
		String sql = "select * from product where cid = ? and pflag = ? order by pdate desc limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Product.class), cid,Constant.PRODUCT_UP,pb.getStartIndex(),pb.getPageSize());
	}

	@Override
	/**
	 * 获取总记录数
	 */
	public int getTotalRecord(String cid) throws Exception {
		return ((Long)new QueryRunner(DataSourceUtils.getDataSource()).query("select count(*) from product where cid = ? and pflag = ?", new ScalarHandler(), cid,Constant.PRODUCT_UP)).intValue();
	}

	@Override
	/**
	 * 后台展示上架商品
	 */
	public List<Product> findAll() throws Exception {
		String sql = "select * from product where pflag = ? order by pdate desc";
		return qr.query(sql, new BeanListHandler<>(Product.class), Constant.PRODUCT_UP);
	}

	@Override
	/**
	 * 保存商品
	 */
	public void save(Product p) throws Exception {

		String sql="insert into product values(?,?,?,?,?,?,?,?,?,?);";
		qr.update(sql, p.getPid(),p.getPname(),p.getMarket_price(),
				p.getShop_price(),p.getPimage(),p.getPdate(),
				p.getIs_hot(),p.getPdesc(),p.getPflag(),
				p.getCategory().getCid());
	}

}
