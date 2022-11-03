package com.plugspot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.plugspot.model.MemberDAO;
import com.plugspot.model.MemberDTO;

public class UpdateService  {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
				
				 MemberDTO info = (MemberDTO) session.getAttribute("info");
				 
				 String member_num = info.getMember_num();
				 String password = info.getPassword();
				 
				
				MemberDTO dto= new MemberDTO(member_num,password);
				MemberDAO dao = new MemberDAO();
				int row = dao.update(dto);
			
				if(row != 0) {
					
					
					session.setAttribute("info", dto);
					
				    System.out.println("정보수정 완료");
				}
				else {
					System.out.println("정보수정 실패");
				}
		return "Mypage.jsp";
	}

}