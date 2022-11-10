package com.plugspot.controller;

import java.io.IOException;
import java.math.BigDecimal;
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
		
		BigDecimal	loc_seq = BigDecimal.valueOf(Integer.parseInt(request.getParameter("loc_seq")));
		BigDecimal city_latitude = BigDecimal.valueOf(Integer.parseInt(request.getParameter("city_latitude")));
		BigDecimal city_longitude = BigDecimal.valueOf(Integer.parseInt(request.getParameter("city_longitude")));
		BigDecimal SATURATION = BigDecimal.valueOf(Integer.parseInt(request.getParameter("SATURATION")));
		
		
		System.out.println(city_latitude);
		System.out.println(city_longitude);
		
		
		 kakaoDTO dto =new kakaoDTO(loc_seq, city_latitude, city_longitude,SATURATION);
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
