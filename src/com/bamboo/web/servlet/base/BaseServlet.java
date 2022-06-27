package com.bamboo.web.servlet.base;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String mName = request.getParameter("method");
			if(mName == null || mName.trim().length()==0){
				mName = "index";
			}
			Method method = this.getClass().getMethod(mName, HttpServletRequest.class,HttpServletResponse.class);
			String path=(String) method.invoke(this, request,response);
			if(path != null){
				request.getRequestDispatcher(path).forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	public String index(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println("亲,不要捣乱哟~");
		return null;
	}

}
