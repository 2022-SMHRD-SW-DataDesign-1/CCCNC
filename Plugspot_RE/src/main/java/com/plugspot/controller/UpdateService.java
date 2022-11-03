package com.plugspot.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.plugspot.model.MemberDAO;
import com.plugspot.model.MemberDTO;

public class UpdateService extends HttpServlet  {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
				
				 MemberDTO info = (MemberDTO) session.getAttribute("info");
				 
				 String member_num = info.getMember_num();
				 String password = info.getPassword();
				 
				
				MemberDTO dto= new MemberDTO(member_num,password);
				MemberDAO dao = new MemberDAO();
				int row = dao.update(dto);
				
				
				String moveURL = "";
				if(row != 0) {

					session.setAttribute("info", dto);
					moveURL = "Mypage.jsp";
				    System.out.println("정보수정 완료");
				}
				else {
					moveURL = "Mypage.jsp";
					System.out.println("정보수정 실패");
				}
				RequestDispatcher rd = request.getRequestDispatcher(moveURL);
				rd.forward(request, response);
	}

}