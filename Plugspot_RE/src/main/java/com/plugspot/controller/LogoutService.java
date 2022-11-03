package com.plugspot.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LogoutService {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		session.removeAttribute("info");
		

		return "./Main";
	}

}