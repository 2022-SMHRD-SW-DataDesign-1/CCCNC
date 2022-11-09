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
<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<fieldset style = "display:block">
		<legend>Main</legend>
		<%if (info == null) {%>
			<a href="Login.jsp"><button>로그인</button></a> <a href="Join.jsp"><button>회원가입</button></a>
		<%} else {%>
			<a href="./Update.jsp"><button>개인정보수정</button></a>
		<%if (info.getMember_num().equals("admin")) {%>
			<a href="./Mypage.jsp">내정보보기</a>
		<%}%>
		<a href="LogoutService"><button>로그아웃</button></a>
		<%}%>


	</fieldset>
	


	<%
	ArrayList<RankDTO> ranklist = (ArrayList) session.getAttribute("ranklist");
	if (ranklist == null) {
		response.sendRedirect("rankService");
		System.out.print("rankService");
	} else {
		System.out.print("메인으로 출력테스트" + ranklist.get(0).getDo_city());
	}
	%>
<!-- 포화도 전체 -->

 <fieldset style="display:inline">
<!-----------------------------------------카카오맵포화도--------------------------------->
<iframe src="./kakaomap.jsp" frameborder="1" scrolling="no" style="display:inline;height:50vh;width:600px"></iframe>
<!----------------------------------------포화도표-------------------------------------->
        <table class="info_table02" style="width:600px;">
            <caption class="title" >지역별 충전소 충전기의 상태 현황</caption>
            <thead>
                <tr >
                    <th scope="col" class="th03">지역</th>
                    <th scope="col" class="th01">위도</th>
                    <th scope="col" class="th01">경도</th>
                    <th scope="col" class="th01">포화도</th>

                </tr>
            </thead>
            <tbody>

                <tr>
                    <th scope="row" class="bg"><span class="zone">서울</span></th>
                    <td class="bg">258</td>
                    <td class="bg">455</td>
                    <td class="bg blue">387</td>
                </tr>

                <tr>
                    <th scope="row"><span class="zone">인천</span></th>
                    <td>881</td>
                    <td>2301</td>
                    <td class="blue">2011</td>
                </tr>

                <tr>
                    <th scope="row" class="bg"><span class="zone">대전</span></th>
                    <td class="bg">424</td>
                    <td class="bg">851</td>
                    <td class="bg blue">688</td>

                </tr>

                <tr>
                    <th scope="row"><span class="zone">대구</span></th>
                    <td>371</td>
                    <td>684</td>
                    <td class="blue">561</td>

                </tr>

                <tr>
                    <th scope="row" class="bg"><span class="zone">광주</span></th>
                    <td class="bg">118</td>
                    <td class="bg">254</td>
                    <td class="bg blue">214</td>

                </tr>

                <tr>
                    <th scope="row"><span class="zone">부산</span></th>
                    <td>258</td>
                    <td>682</td>
                    <td class="blue">575</td>

                </tr>

                <tr>
                    <th scope="row" class="bg"><span class="zone">울산</span></th>
                    <td class="bg">142</td>
                    <td class="bg">361</td>
                    <td class="bg blue">301</td>

                </tr>

                <tr>
                    <th scope="row"><span class="zone">제주</span></th>
                    <td>184</td>
                    <td>408</td>
                    <td class="blue">323</td>

                </tr>



            </tbody>
        </table>
    </fieldset>
    <br>

<!------------------------------------------------------------------------------------>


	
<!-----------------------------------------순위---------------------------------------->
	<fieldset>

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
				<tbody>
					<% if(ranklist!=null){%>
					<%for (int i = 0; i < ranklist.size(); i++) {%>
					<tr>
						<th><span class="zone"><%=i + 1%></span></th>
						<td><%=ranklist.get(i).getDo_city()%></td>
						<td><%=ranklist.get(i).getCar_num()%></td>
					</tr>
					<%}}%>
				</tbody>
			</table>
		</form>
	</fieldset> 
<!------------------------------------------------------------------------------------>


</body>

</html>