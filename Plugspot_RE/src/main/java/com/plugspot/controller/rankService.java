package com.plugspot.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.plugspot.model.RankDAO;
import com.plugspot.model.RankDTO;


public class rankService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[rankService]");
		
		ArrayList<RankDTO> ranklist = new RankDAO().rank();

		System.out.println(ranklist.get(0).getDo_city());
		
		if(ranklist==null) {
			System.out.println("rank출력실패");
		}else {
			System.out.println("rank출력");
			HttpSession session = request.getSession();
			session.setAttribute("ranklist",ranklist);

		}
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
		rd.forward(request, response);
	}

}
