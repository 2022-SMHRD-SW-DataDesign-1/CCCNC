<%@page import="com.plugspot.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

MemberDTO info = (MemberDTO)session.getAttribute("info");
			
%>
<h1>로그인 성공 !</h1>
<h1><%= info.getMember_num() %>님 환영합니다 ~!</h1>
<a href="Mypage.jsp"><button>내 정보 이동</button></a>
<a href="LogoutService.jsp"><button>로그아웃</button></a>
</body>
</html>