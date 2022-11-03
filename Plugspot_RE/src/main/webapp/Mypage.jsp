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
<% MemberDTO info = (MemberDTO)session.getAttribute("info");  %>
<fieldset>
<legend>내 정보</legend>
<form action="UpdateService.jsp" method="post">
사업자 등록 번호:<%= info.getMember_num()%>
변경할 패스워드:<input type="password" name="password" placeholder="PW를 입력하세요">
		<li><span id="update"></span></li>
<input type = "submit" value="수정">
</form>
</fieldset>
</body>
</html>