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
		response.sendRedirect("rankService");
		RankDTO ranklist = (RankDTO)session.getAttribute("ranklist");
		System.out.print(ranklist.getDo_city());
	%>
	<fieldset>
        <form class="ranking">
            <table class="info_table02">
                <caption class="title"> 자동차 등록 대수</caption>
                <colgroup>
                    <col class="col01">
                    <col class="col01">
                    <col class="col01">
                    <col class="col01">
                    <col class="col01">
                    <col class="col01">
                    <col class="col02">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" class="th03">순위</th>
                        <th scope="col" class="th01">도시</th>
                        <th scope="col" class="th01">자동차등록수</th>

                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <th scope="row" class="bg"><span class="zone">1</span></th>
                        <td class="bg">제주</td>
                        <td class="bg"></td>

                    </tr>

                    <tr>
                        <th scope="row"><span class="zone">2</span></th>
                        <td>울산</td>
                        <td></td>

                    </tr>

                    <tr>
                        <th scope="row" class="bg"><span class="zone">3</span></th>
                        <td class="bg">인천</td>
                        <td class="bg"></td>

                    </tr>

                    <tr>
                        <th scope="row"><span class="zone">4</span></th>
                        <td>광주</td>
                        <td></td>

                    </tr>

                    <tr>
                        <th scope="row" class="bg"><span class="zone">5</span></th>
                        <td class="bg">부산</td>
                        <td class="bg"></td>

                    </tr>

                    <tr>
                        <th scope="row"><span class="zone">6</span></th>
                        <td>서울</td>
                        <td></td>

                    </tr>

                    <tr>
                        <th scope="row" class="bg"><span class="zone">7</span></th>
                        <td class="bg">대전</td>
                        <td class="bg"></td>

                    </tr>

                    <tr>
                        <th scope="row"><span class="zone">8</span></th>
                        <td>대구</td>
                        <td></td>

                    </tr>

                </tbody>
            </table>
        </form>
    </fieldset>
	
	
	
	
	
	
	
	
	
	
	
	
</body>

</html>