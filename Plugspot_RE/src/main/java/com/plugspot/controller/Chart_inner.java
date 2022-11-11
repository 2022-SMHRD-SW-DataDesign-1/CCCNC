package com.plugspot.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;


public class Chart_inner extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num_data = request.getParameter("id_num");
		System.out.println("inner"+num_data);
		
		request.setAttribute("num_data", num_data);		
				
		RequestDispatcher rd = request.getRequestDispatcher("./Main.jsp");
		rd.forward(request, response);		
	}

}
