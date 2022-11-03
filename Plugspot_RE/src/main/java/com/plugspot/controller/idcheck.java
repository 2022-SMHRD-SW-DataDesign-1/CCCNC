package com.plugspot.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plugspot.model.MemberDAO;

public class idcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String inputE = request.getParameter("inputE");
		
		MemberDAO dao = new MemberDAO();
		boolean idcheck = dao.idCheck(inputE);
		
		PrintWriter out = response.getWriter();
		out.print(idcheck);
		
		
		
	}
	

	}


