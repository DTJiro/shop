package com.bamboo.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bamboo.utils.getConn;

/**
 * Servlet implementation class DeleteCategoryServlet
 */
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cid=new String(request.getParameter("cid").getBytes("ISO-8859-1"),"utf-8");
		System.out.println(cid);
		getConn conn=new getConn();
		conn.insert("delete from category where cid=?", new Object[] {cid});
		response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
