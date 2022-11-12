<%@page import="com.plugspot.model.kakaoDTO"%>
<%@page import="com.plugspot.model.kakaoDAO"%>
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
<style type="text/css">
fieldset {
	display: inline;
	text-align: center;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
<script type="text/javascript">
	
</script>
<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<fieldset style="display: block">
		<legend>Main</legend>
		<%
		if (info == null) {
		%>
		<a href="Login.jsp"><button>로그인</button></a> <a href="Join.jsp"><button>회원가입</button></a>
		<%
		} else {
		%>
		<a href="./Update.jsp"><button>개인정보수정</button></a>
		<%
		if (info.getMember_num().equals("admin")) {
		%>
		<a href="./Mypage.jsp">내정보보기</a>
		<%
		}
		%>
		<a href="LogoutService"><button>로그아웃</button></a>
		<%
		}
		%>


	</fieldset>



	<%
	ArrayList<RankDTO> ranklist = (ArrayList) session.getAttribute("ranklist");
	if (ranklist == null) {
		response.sendRedirect("rankService");
		System.out.print("rankService");
	} else {
		System.out.println("메인으로 출력테스트" + ranklist.get(0).getDo_city());
	}
	%>
	<fieldset style="display: block; height: 750px;">
	
<!-- 포화도 전체 -->
	<fieldset style="display: inline; width: 1800px; height: 1800px; border-width: 0px">
<!-----------------------------------------카카오맵포화도--------------------------------->

 <iframe src="./kakaomap.jsp" frameborder="1" scrolling="no" style="display:block;height:80%;width:100%"></iframe> 
			
<!----------------------------------------포화도표-------------------------------------->
<iframe src="./Saturation.jsp" frameborder="1" scrolling="yes" style="display: block; height: 20%; width: 100%">
</iframe>
</fieldset>

<!------------------------------------------------------------------------------------>

<!-----------------------------------------순위---------------------------------------->
		<fieldset style="height: 720px;">

			<form class="ranking">
				<table class="info_table02">
					<caption class="title">자동차 등록 대수</caption>
					<thead>
						<tr>
							<th scope="col" class="th03">순위</th>
							<th scope="col" class="th01">도시</th>
							<th scope="col" class="th01">자동차등록수</th>
						</tr>
					</thead>
					<%
					if (ranklist != null) {
					%>
					<%
					for (int i = 0; i < ranklist.size(); i++) {
					%>
					<tbody style="height: 100%">
						<tr>
							<th><span class="zone"><%=i + 1%></span></th>
							<td style="width: 150px; height: 100%"><%=ranklist.get(i).getDo_city()%></td>
							<td style="width: 150px; height: 100%"><%=ranklist.get(i).getCar_num()%></td>
						</tr>
					</tbody>
					<%
					}
					}
					%>
				</table>
			</form>
		</fieldset>
		<!------------------------------------------------------------------------------------>

	</fieldset>
	<iframe src="./Chargenum.jsp" frameborder="1" scrolling="no"
		style="display: inline; height: 350px; width: 450px"></iframe>
	

	
	
</body>

</html>