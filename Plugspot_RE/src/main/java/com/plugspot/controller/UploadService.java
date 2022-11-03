package com.plugspot.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.plugspot.model.uploadDAO;
import com.plugspot.model.uploadDTO;


public class UploadService  extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String savePath = request.getServletContext().getRealPath("image");		
		System.out.println(savePath);
		
	
		int maxSize = 10*1024*1024;
		
	
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
	
		uploadDTO dto = new uploadDTO();
		
		int row = new uploadDAO().upload(dto);
		String moveURL="";
		if(row>0) {
			moveURL = "Mypage.jsp";
			System.out.print("업로드 성공");
		}else {
			moveURL = "Mypage.jsp";
			System.out.println("업로드 실패");
		}
		RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		rd.forward(request, response);
	}	
}
