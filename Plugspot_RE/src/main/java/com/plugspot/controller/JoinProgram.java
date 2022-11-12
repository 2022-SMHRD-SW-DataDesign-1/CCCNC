package com.plugspot.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plugspot.model.MemberDAO;
import com.plugspot.model.MemberDTO;



public class JoinProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[JoinProgram]");
		
	
		
		request.setCharacterEncoding("UTF-8");
		
        String member_num = request.getParameter("member_num");
        String password = request.getParameter("password");
        
        
        System.out.println("member_num :"+member_num);
        System.out.println("password :"+password);
        
        
        MemberDTO dto = new MemberDTO(member_num,password);
        
        
        MemberDAO dao = new MemberDAO();
        int row = dao.join(dto);
        
       
        if(row > 0) {
        	System.out.println("회원가입 성공");
        	response.sendRedirect("./Main.jsp");
        }else {
        	System.out.println("회원가입 실패");
        	response.sendRedirect("./Join.jsp");
        }
	}

}
