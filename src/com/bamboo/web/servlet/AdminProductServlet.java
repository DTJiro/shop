package com.bamboo.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bamboo.domain.Product;
import com.bamboo.service.CategoryService;
import com.bamboo.service.ProductService;
import com.bamboo.service.impl.CategoryServiceImpl;
import com.bamboo.service.impl.ProductServiceImpl;
import com.bamboo.web.servlet.base.BaseServlet;

/**
 * 后台商品模块
 */
public class AdminProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 跳转到添加的页面上
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			//调用categoryservice 查询所有分类
			CategoryService cs = new CategoryServiceImpl();
			
			request.setAttribute("list", cs.findList());
		} catch (Exception e) {
		}
		return "/admin/product/add.jsp";
	}
	
	/**
	 * 展示已上架商品列表
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.调用service 查询以上架商品
			ProductService ps =  new ProductServiceImpl();
			List<Product> list = ps.findAll();
			
			//2.将返回值放入request中,请求转发
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return "/admin/product/list.jsp";
	}

}
