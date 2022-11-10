package com.plugspot.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class pwcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		
		boolean pwcheck;
		
		if(pw.equals(pw2)) {
			pwcheck = true;
		}else {
			pwcheck = false;
		}
		
		PrintWriter out = response.getWriter();
		out.print(pwcheck);
		
		
		
	}

	}

