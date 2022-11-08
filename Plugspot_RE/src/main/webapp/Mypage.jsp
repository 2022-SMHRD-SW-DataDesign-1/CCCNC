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

<fieldset>

	<legend>내 정보</legend>
			사업자 등록 번호:<%= info.getMember_num()%>
			사업자 비밀 번호:<%= info.getPassword() %>
			<a href = "Update.jsp"><button>비밀번호 수정</button></a>
			사업자등록증 : <img src="./image/<%=info.getFilename() %>">
			<a href = "Update.jsp"><button>등록증 수정</button></a>
			<a href = "Mycharge.jsp"><button>충전소 위치 등록</button></a>
			
</fieldset>
<script>
var openWin;
function openChild(){
	window.name="insertTable";
	openWin = window.open("")
	
}


</script>
</body>
</html>