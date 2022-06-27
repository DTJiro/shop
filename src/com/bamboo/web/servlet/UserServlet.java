package com.bamboo.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.bamboo.constant.Constant;
import com.bamboo.domain.User;
import com.bamboo.service.UserService;
import com.bamboo.service.impl.UserServiceImpl;
import com.bamboo.utils.UUIDUtils;
import com.bamboo.web.servlet.base.BaseServlet;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.InterningXmlVisitor;

/**
 * 用户模块
 */
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.获取用户名和密码
			String username = request.getParameter("username");
			String password	= request.getParameter("password");
			
			//2.调用service完成登录 返回值:user
			UserService us = new UserServiceImpl();
			User user=us.login(username,password);
			
			//3.判断user 根据结果生成提示
			if(user == null){
				//用户名和密码不匹配
				request.setAttribute("msg", "用户名和密码不匹配");;
				return "/jsp/login.jsp";
			}
			
			//登录成功 保存用户登录状态
			request.getSession().setAttribute("user", user);
			
			/////////////////记住用户名//////////////////////
			//判断是否勾选了记住用户名
			if(Constant.SAVE_NAME.equals(request.getParameter("savename"))){
				Cookie c = new Cookie("saveName", URLEncoder.encode(username, "utf-8"));
				
				c.setMaxAge(Integer.MAX_VALUE);
				c.setPath(request.getContextPath()+"/");
				
				response.addCookie(c);
			}
			///////////////////////////////////////
			
			//跳转到 index.jsp
			response.sendRedirect(request.getContextPath());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "用户登录失败");
			return "/jsp/msg.jsp";
		}
		
		return null;
	}
	
	/**
	 * 跳转到登录页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loginUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/login.jsp";
	}
	
	/**
	 * 用户注册
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//1.封装对象
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			
			//2.调用service完成注册
			UserService us=new UserServiceImpl();
			us.register(user);
			
			//3.页面转发 提示信息
			request.setAttribute("msg", "恭喜你,注册成功!");
		}catch (Exception e) {
			e.printStackTrace();
			//转发到 msg.jsp
			request.setAttribute("msg", "用户注册失败!");
			return "/jsp/msg.jsp";
		}
		
		return "/jsp/msg.jsp";
	}
	
	/**
	 * 跳转到注册页面
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String registUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/register.jsp";
	}

}
