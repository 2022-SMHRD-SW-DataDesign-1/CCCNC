package com.plugspot.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.plugspot.model.MemberDAO;
import com.plugspot.model.MemberDTO;

public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String member_num = request.getParameter("id");
		String password = request.getParameter("pw");

		System.out.println("member_num :" + member_num);
		System.out.println("password :" + password);

		MemberDTO dto = new MemberDTO(member_num, password);

		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.login(dto);

		PrintWriter out = response.getWriter();
		String moveURL = "";
		if(info==null) {
			System.out.println("로그인 실패");
			moveURL = "Login.jsp";
			out.print("failed");
		}else {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("info",info);
			
			moveURL= "Main.jsp";
			out.print("<checkid>");
		}
		/*
		 * RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		 * rd.forward(request, response);
		 */
	}

}