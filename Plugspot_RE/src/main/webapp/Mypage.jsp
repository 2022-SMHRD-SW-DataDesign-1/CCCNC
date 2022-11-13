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
<style type="text/css">
/*  Header
.header {
	width: 10%;
	margin-top:-1%;
	padding-top: 10px !important;
	height: 10% !important;
	position: fixed;
	background-color: white;
}
.header .inner_header {
	position: relative;
	width: 100%;
	margin: 0 auto;
	line-height: 100%;
*/
left .logo {
	display: inline-block;
	width: 190px;
	margin: 0 auto;
    margin-left: -4.7%;
}
/*
.header .topMenu {
	position: absolute;
	width: 100%;
	border-bottom: 1px solid #D3D3D3;
	margin: 0 auto;
	margin-left: 90%;
	top: 24px !important;
}
.header .topMenu ul {
	position: fixed;
	float: right;
	list-style: none;
	margin-left: 350px;
}
*/
img {
	position: fixed;
	float: left;
	width: 80px;
	height: 35px !important;
	line-height: 35px !important;
	border-right: 1px solid #D3D3D3;
}
/* .header .topMenu li {
	float: left;
	width: 80px;
	height: 35px !important;
	line-height: 35px !important;
	border-right: 1px solid #D3D3D3;
}
.header .topMenu li a {
	display: block;
	color: #686868;
	text-align: center;
	font-family:dotum;
	font-size: 15px;
	margin: 0 auto;
}
/* .header .topMenu li a:hover {
	display: block;
	color: #686868;
	text-align: center;
	font-weight:800;font-size:13px;
	
}  */
/* left */
/* .tap{
	background-color: white;
} */
.v-line {
	border-right: 1px solid #D3D3D3;
	width: 190px;
	height: 86.3%;
	position: absolute;
	text-align: center;
	margin-top: -110px;
	font-family: 한컴 고딕;
	display: block !important;
	color: #686868 !important;
	/* box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23); */
	text-align: center;
	background-color: white;
}
a {
	text-decoration-line: none;
}
body{
background-color:rgb(242,244,255);
}
/* content */
content {
	/* padding: 50px 0 0;
            position: relative; */
	width: 1460px;
	margin-left: 30px;
	padding-left: 138px;
	padding-right: 138px;
	background-color: rgb(249, 251, 252);
	margin-left: 50%;
}
legend {
	margin-top: 3%;
	margin-left: 15%;
	font-family: 한컴 고딕;
	font-size: xx-large;
	width: 100px
}
.img_1 {
	/*margin-top: -1%;
	margin-left: 22%;*/
	box-shadow: 0 10px 20px rgb(0 0 0/ 19%), 0 6px 6px rgb(0 0 0/ 23%);
	float: left;
	margin-top: 1%;
    margin-left: 25%;
	width: 400px;
    height: 500px;
    border: solid 1px rgb(48,151,219);
    background-color: #fff;
    border-radius: 12px;
}
.number1>h4>a {
	width: 39%;
	margin-bottom: -1%;
}
input {
	margin-left: 1%;
	margin-top: -3%;
}
h4 {
	/* color: #636E72; */
	line-height: 140%;
	font-weight: 700;
	/*margin: 30px 0 10px;*/
	font-family: 한컴 고딕;
}
button {
	background-color: rgb(45, 204, 106);
	box-shadow: 0px 4px 0px rgb(45, 204, 106);
	position: relative;
	border: 0;
	padding: 5px 15px;
	display: inline-block;
	text-align: center;
	color: white;
	border-radius: 10px;
	margin: 8px;
	cursor: pointer;
	margin-left: 1%;
	box-shadow: 5px 5px 5px darkgray;
}
/* a {
	text-decoration: none;
} */
.v-line h4:hover {
	font-size: large;
	cursor: pointer;
	display: block font-weight: bold !important;
	font-size: 20px !important;
	text-align: center;
}
.number1 {
	padding: 20px 17px 20px;
	border-radius: 12px;
	box-shadow: 2px 2px 14px 0 rgb(0 164 73/ 8%);
	border: solid 1px rgb(48,151,219);
	background-color: #fff;
	box-sizing: border-box;
	float: left;
	width: 19%;
    height: 270px;
	margin-top: -23%;
    margin-left: 52%;
	font-family: 한컴 고딕;
	box-shadow: 0 10px 20px rgb(0 0 0/ 19%), 0 6px 6px rgb(0 0 0/ 23%);
}
li {
	list-style: none;
}
/* Footer */
/* Footer */
.footer {
	clear: both;
	width: 100%;
	height: 10%;
	font-family: 한컴 고딕;
	font-weight: 50px;
	background-color:white;
}
center {
	width: 1697px;
	height: 707px;
	margin-left: 190px;
    margin-top: -78px;
	background-color:rgb(242,244,255);
}
.info_img {
	style width: 100%;
	height: 100%;
}
.sub_title {
	text-align: left;
	margin-top: 11%;
	font-family: 한컴 고딕;
	margin-left:22%;
}
</style>
</head>
<body>
	<!--  <header class="header">
		<div class="head">
			<!-- <div class="logo">
				<a href="Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
					class="logo"></a>
			</div>
			<!-- <div class="topMenu">
				<div class="clear">
					<li><a href="Main.jsp"><span>HOME</span></a></li>
					<li><a href="Login.jsp"><span>LOGIN</span></a></li>
				</div>
			</div>
		</div>
	</header> -->
	<!-- header 끝 -->
	<left class="tap" > <!-- left태그 -->
	<div class="v-line">
	
	<div class="logo">
				<a href="Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
					class="logo" style="margin-left;"></a>
			</div>
		<h2 style="color: black; font-family: 한컴 고딕; margin-top: 39%;">마이 페이지</h2>
		<h4>
			<a href="Mypage.jsp" style="color: black;">내정보 <a>
		</h4>
		<h4>
			<a href="Mycharge.jsp" style="color: black;"> My충전소 </a>
		</h4>
		<h4>
			<a href="Update.jsp" style="color: black;"> 개인정보수정 </a>
		</h4>
	</div>
	</left>
	<!-- left태그 끝 -->
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	ArrayList<ChargeDTO> list = (ArrayList) session.getAttribute("mystate");
	System.out.print(list);
	%>
	<center>
		<div class="con_title">
			<h1 style="font-family: 한컴 고딕;"></h1>
			<div class="sub_title">
				<h2>< 사업자등록증 ></h2>
			</div>
		</div>
		<div class="content">
			<div class="left_con"
				style="width: 40%; height: 50%; float: left; margin-right: 5%; margin-left: 5%;">
				<div class="img_1">
					<img src="./image<%=info.getFilename()%>" class="info_img">
				</div>
				<!-- 	<div class="update">
					<a href="Update.jsp">
						<button class="re_img">등록증 수정</button>
					</a>
				</div> -->
			</div>
			<div class="number1">
			<table style="border: 2px;">
				<tr> <td>사업자 등록번호</td> <td><%=info.getMember_num()%></td> </tr>
				<tr> <td>비밀번호</td> <td><%=info.getPassword()%></td> </tr>
				<tr> <td>내 충전소 위치</td> </tr>
				<tr> 
				<td>
					<%
					if (list != null) {
					%>
					<%
					for (int i = 0; i < list.size(); i++) {
					%>
					<%=list.get(i).getLATITUDE()%>
				</td> 
				<td> <%=list.get(i).getLONGTITUDE()%>
						<%
					}
					} else {
					System.out.print("출력불가");
					%>
					<%
					}
					%>
				</td>
				</tr>
			</table>
				<!--  <h4 style="text-align: left;">
					사업자 등록 번호:
					 <%=info.getMember_num()%> 
					<br> 비밀 번호 확인 :
					<%=info.getPassword()%>
					<br> 충전소 위치 :
					<%
					if (list != null) {
					%>
					<%
					for (int i = 0; i < list.size(); i++) {
					%>
					<h4>
						My 충전소 :<%=list.get(i).getLATITUDE()%>,
						<%=list.get(i).getLONGTITUDE()%></h4>
					<%
					}
					} else {
					System.out.print("출력불가");
					%>
					<%
					}
					%>
				</h4> -->
			</div>
		</div>
	</center>
<footer class="footer">
		<!-- foot 시작 -->
		<div class="f_logo">
			<img src="./img/FootLogo.png" alt="PlugSpot"
				style="width: 190px; height: 35px;">
		</div>
		<span class="t">|</span> <strong style="color: #686868;">개인정보처리방침</strong>
		<span class="t">|</span> <span class="m mar_l5">고객센터 1234-5678</span>
		<p class="mar_t5">
			사업자번호: 111-222-3333 &nbsp;&nbsp; 대표자: 쿠쿠뉴쿠 &nbsp;&nbsp;주소: 광주광역시 남구
			송암로 60 광주CGI센터 2층<br> Copyright@2022 PlugSpot. All Rights
			Reserved
		</p>
	</footer>
	<!-- foot 끝 -->
</body>
</html>