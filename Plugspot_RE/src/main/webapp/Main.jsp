<%@page import="com.plugspot.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type = "text/css">
fieldset {
display: inline;
text-align:center;

}


</style>
</head>
<body>
<% 

MemberDTO info = (MemberDTO)session.getAttribute("info"); 


%>
	<fieldset>
	<legend>Main</legend>
	<% if(info==null){ %>
		<a href="Login.jsp"><button>로그인</button></a> 
		<a href = "Join.jsp"><button>회원가입</button></a><% }else{%> <a href="./Update.jsp"><button>개인정보수정</button></a>
		<%if(info.getMember_num().equals("admin")){ %> <a href="./Mypage.jsp">내정보보기</a>
		 <%} %> <a href="LogoutService"><button>로그아웃</button></a> <%} %> 
		
		
	</fieldset>
</body>

</html>