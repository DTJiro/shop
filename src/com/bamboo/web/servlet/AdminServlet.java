package com.bamboo.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bamboo.domain.Admin;
import com.bamboo.service.AdminService;
import com.bamboo.service.impl.AdminServiceImpl;
import com.bamboo.web.servlet.base.BaseServlet;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取用户名和密码
			String username = request.getParameter("username");
			String password	= request.getParameter("password");
			
			//2.调用service完成登录 返回值:admin
			AdminService as = new AdminServiceImpl();
			Admin admin=as.login(username,password);
			
			//3.判断admin 根据结果生成提示
			if(admin == null){
				//用户名和密码不匹配
				System.out.println("验证失败！");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println("<script>alert('用户名和密码不匹配！');history.go(-1);</script>");
			}
			else {
				//登录成功 保存用户登录状态
				request.getSession().setAttribute("admin", admin);
				
				//跳转到 index.jsp
				response.sendRedirect(request.getContextPath()+"/admin/home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "用户登录失败");
			return "/jsp/msg.jsp";
		}
		
		return null;
	}

}
