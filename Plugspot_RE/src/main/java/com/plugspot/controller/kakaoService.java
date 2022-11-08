package com.plugspot.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.plugspot.model.kakaoDAO;
import com.plugspot.model.kakaoDTO;


public class kakaoService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String do_city = request.getParameter("do_city");
		String city_latitude = request.getParameter("city_latitude");
		String city_longitude = request.getParameter("city_longitude");
		
		
		System.out.println(do_city);
		System.out.println(city_latitude);
		System.out.println(city_longitude);
		
		
		 kakaoDTO dto =new kakaoDTO(do_city, city_latitude, city_longitude);
		 ArrayList<kakaoDTO> info = new kakaoDAO().kakao();
		
		 String moveURL = null;
			
			if(info==null) {
				System.out.println("실험 실패");
				moveURL = "Main.jsp";
			}else {
				System.out.println("실험 성공");
				
				HttpSession session = request.getSession();
				session.setAttribute("kakao",info);
				
				moveURL= "Main.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(moveURL);
			rd.forward(request, response);
	}

}
