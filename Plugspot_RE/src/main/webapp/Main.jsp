<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.RankDTO"%>
<%@page import="java.net.http.HttpClient.Redirect"%>
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
	
	<%
	ArrayList<RankDTO> ranklist = (ArrayList)session.getAttribute("ranklist");
	if(ranklist==null){
		response.sendRedirect("rankService");
	}else{
	System.out.print("메인으로 출력테스트"+ ranklist.get(0).getDo_city()); 
	}
	%>
<!-----------------------------------------순위---------------------------------------->	
	<fieldset>
        <form class="ranking">
            <table class="info_table02">
                <caption class="title"> 자동차 등록 대수</caption>
                <thead>
                    <tr>
                        <th scope="col" class="th03">순위</th>
                        <th scope="col" class="th01">도시</th>
                        <th scope="col" class="th01">자동차등록수</th>
                    </tr>
                </thead>
                <tbody>
					<% for(int i=0;i<ranklist.size();i++){ %>
                    <tr>
                        <th><span class="zone"><%=i+1%></span></th>
                        <td><%= ranklist.get(i).getDo_city()%></td>
                        <td><%= ranklist.get(i).getCar_num()%></td>
                    </tr>
					<%} %>
                </tbody>
            </table>
        </form>
    </fieldset>
<!------------------------------------------------------------------------------------>		
	
	
	
	
	
	
	
	
	
	
	
</body>

</html>