package com.plugspot.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.plugspot.model.lowDAO;
import com.plugspot.model.lowDTO;

public class lowcharge extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		BigDecimal loc_seq = BigDecimal.valueOf(Integer.parseInt(request.getParameter("loc_seq")));
		BigDecimal one_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("one_week_charge")));
		BigDecimal two_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("two_week_charge")));
		BigDecimal tree_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("tree_week_charge")));
		BigDecimal four_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("four_week_charge")));
		BigDecimal five_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("five_week_charge")));
		BigDecimal six_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("six_week_charge")));
		BigDecimal seven_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("seven_week_charge")));
		BigDecimal eight_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("eight_week_charge")));
		BigDecimal nine_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("nine_week_charge")));
		BigDecimal ten_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("ten_week_charge")));
		BigDecimal eleven_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("eleven_week_charge")));
		BigDecimal twelve_week_charge = BigDecimal.valueOf(Integer.parseInt(request.getParameter("twelve_week_charge")));
		String charger = request.getParameter("charger");
	
		lowDTO dto = new lowDTO(loc_seq, one_week_charge, two_week_charge, tree_week_charge, four_week_charge, five_week_charge, six_week_charge, seven_week_charge, eight_week_charge, nine_week_charge, ten_week_charge, eleven_week_charge, twelve_week_charge, charger);
		ArrayList<lowDTO> low = new lowDAO().low();
		
		session.setAttribute("low", low);
	
		PrintWriter out = response.getWriter();
		out.println("CityChargeStaion.jsp");
	
	
	}

}