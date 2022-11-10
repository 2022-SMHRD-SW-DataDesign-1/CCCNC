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

import com.plugspot.model.CityChargeDAO;
import com.plugspot.model.CityChargeDTO;



public class CityChargeStation extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		BigDecimal charge_num = BigDecimal.valueOf(Integer.parseInt(request.getParameter("charge_num")));
		BigDecimal latitude = BigDecimal.valueOf(Integer.parseInt(request.getParameter("latitude")));
		BigDecimal longitude = BigDecimal.valueOf(Integer.parseInt(request.getParameter("longitude")));
		String charge_state_name = request.getParameter("charge_state_name");
		
		
		System.out.println(latitude);
		System.out.println(longitude);
		
		
		 CityChargeDTO dto =new CityChargeDTO(charge_num, charge_state_name, latitude, longitude);
		 ArrayList<CityChargeDTO> station = new CityChargeDAO().station();
		
		 String moveURL = null;
			
			if(station==null) {
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


