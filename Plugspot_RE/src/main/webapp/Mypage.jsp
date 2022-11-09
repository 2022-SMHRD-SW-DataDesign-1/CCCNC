<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.ChargeDTO"%>
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
ArrayList<ChargeDTO> list = (ArrayList) session.getAttribute("mystate");
System.out.print(list);
%>

<fieldset>

	<legend>내 정보</legend>
			사업자 등록 번호:<%= info.getMember_num()%>
			사업자 비밀 번호:<%= info.getPassword() %>
			<a href = "Update.jsp"><button>비밀번호 수정</button></a>
			사업자등록증 : <img src="./image/<%=info.getFilename() %>">
			<a href = "Update.jsp"><button>등록증 수정</button></a>
			<a href = "Mycharge.jsp"><button>충전소 위치 등록</button></a>
			
			<% if(list!=null){ %>
			<% for(int i =0; i<list.size(); i++){ %>
			   My 충전소 : <p><%=list.get(i).getLATITUDE()%> : <%=list.get(i).getLONGTITUDE() %>
			            <%}}else{System.out.print("출력불가");%>
			               <%} %>
			               
			               
			
			
			
			</p>
			
</fieldset>




</body>
</html>