package com.plugspot.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.plugspot.model.ChargeDAO;
import com.plugspot.model.ChargeDTO;
import com.plugspot.model.MemberDTO;
import com.plugspot.model.uploadDAO;




public class StateProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		 MemberDTO info = (MemberDTO) session.getAttribute("info");
			
		 request.setCharacterEncoding("utf-8");
		 String member_num = info.getMember_num();
		 String[] latitude =  request.getParameter("latiList").split(",");
		 String[] longtitude = request.getParameter("longList").split(",");
		 
		 
		
			ChargeDTO dto = null;
			int row = 0;
			for(int i=0; i<latitude.length; i++) {
				 
				 dto = new ChargeDTO(member_num,latitude[i],longtitude[i]);
				 row = new ChargeDAO().state(dto);
				 
				
			}
			
			
			

			
			
			  if(row>0) {
			  
			  System.out.print("업로드 성공"); session.setAttribute("state",dto); }else {
			  
			  System.out.println("업로드 실패"); }
			 
			  
			  PrintWriter out = response.getWriter();
			  out.println("<insertTable>");
			
		}	
	

	}


	


