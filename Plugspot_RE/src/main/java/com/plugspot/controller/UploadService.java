package com.plugspot.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.net.http.HttpConnectTimeoutException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.plugspot.model.MemberDTO;
import com.plugspot.model.uploadDAO;
import com.plugspot.model.uploadDTO;


public class UploadService  extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String savePath = request.getServletContext().getRealPath("image");		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String member_num = info.getMember_num();
		System.out.println(savePath);
		
	
		int maxSize = 10*400*500; // 10*1024*1024에서  수정
		
	
		String encoding = "UTF-8";
		

		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
	
		
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		String filename = multi.getOriginalFileName("filename");
        System.out.println(filename);
		try {
			filename = URLEncoder.encode(filename, "UTF-8");
		} catch (UnsupportedEncodingException e) {
		
			e.printStackTrace();
		}
		
		
	
		System.out.println("filename : "+filename);
		System.out.println("member_num : "+member_num);
	
		uploadDTO dto = new uploadDTO(member_num,filename);
		MemberDTO dto2 = (MemberDTO)session.getAttribute("info");
		dto2.setFilename(filename);
		dto2.setMember_num(member_num);
		
		int row = new uploadDAO().upload(dto);
		String moveURL="";
		if(row>0) {
			moveURL = "Mypage.jsp";
			System.out.print("업로드 성공");
			session.setAttribute("info",dto2);
		}else {
			moveURL = "Update.jsp";
			System.out.println("업로드 실패");
		}
		RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		rd.forward(request, response);
	}	
}
