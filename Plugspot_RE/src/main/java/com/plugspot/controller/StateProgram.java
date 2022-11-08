package com.plugspot.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		 float latitude = 
		 float longtitude = 
			ChargeDTO dto = new ChargeDTO(member_num,);
			MemberDTO dto2 = (MemberDTO)session.getAttribute("info");
			dto2.setMember_num(member_num);
			
			System.out.println("charge_state_name : "+charge_state_name);
			System.out.println("member_num : "+member_num);
			

			int row = new ChargeDAO().state(dto);
			
			if(row>0) {
				
				System.out.print("업로드 성공");
				session.setAttribute("info",dto2);
			}else {
				
				System.out.println("업로드 실패");
			}
			RequestDispatcher rd = request.getRequestDispatcher("./Mypage.jsp");
			rd.forward(request, response);
		}	
	

	}


	


