<%@page import="com.plugspot.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Header
.header {
	width: 100%;
	padding-top: 10px !important;
	height: 10% !important;
	position: fixed;
}
.header .inner_header {
	position: relative;
	width: 100%;
	margin: 0 auto;
	line-height: 100%;
}*/
left .logo {
	display: inline-block;
	width: 190px;
	
	margin: 0 auto;
}
/*.header .topMenu {
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
}*/
left img {
	position: fixed;
	float: left;
	width: 80px;
	height: 35px !important;
	line-height: 35px !important;
	border-right: 1px solid #D3D3D3;
}
/*.header .topMenu li {
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
.header .topMenu li a:hover {
	display: block;
	color: #686868;
	text-align: center;
	font-weight:800;font-size:13px;
	font-weight: bold !important;
	font-size: 20px !important;
}*/
h4 {
	position: relative;
	color: #003073;
	line-height: 120%;
	font-weight: 700;
	/* padding-left: 19px; */
	margin: 30px 0 10px;
	font-family: 한컴 고딕;
	/* font-size: 15px; */
	/* font-color: #686868 !important; */
	margin-left: 8%;
}
/* left */
.v-line {
	border-right: 2px solid #D3D3D3;
	width: 190px;
	height: 72%;
	position: absolute;
	text-align: center;
	margin-top: 80px;
	font-family: 한컴 고딕;
	display: block !important;
	color: #686868 !important;
	/* box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23); */
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
.update button {
	margin-top: -8%;
	margin-left: 36%;
	float: left;
}
.number1>h6 {
	margin-left: 1%;
	margin-top: 12%;
	margin-bottom: 12%;
}
.number1>h6>a {
	width: 39%;
	margin-bottom: -1%;
}
input {
	margin-left: 1%;
	margin-top: -3%;
}
.btn {
	background-color: rgb(45, 204, 106);
	box-shadow: 0px 4px 0px rgb(45, 204, 106);
	position: relative;
	border: 0;
	padding: 5px 15px;
	display: inline-block;
	text-align: center;
	color: white;
	border-radius: 10px;
	cursor: pointer;
	margin-left: 81%;
	float: left;
    margin-top: -7%;
	box-shadow: 5px 5px 5px darkgray;
}
h6 {
	font-family: 한컴 고딕;
	font-size: medium;
	margin-left: 22%;
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
	border: solid 1px rgba(3, 213, 128, .8);
	background-color: #fff;
	box-sizing: border-box;
	float: left;
	width: 22%;
	height: 100%;
	margin-top: -22%;
    margin-left: 52%;
	font-family: 한컴 고딕;
	box-shadow: 0 10px 20px rgb(0 0 0/ 19%), 0 6px 6px rgb(0 0 0/ 23%);
}
.update{
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
    margin-top: 23%;
	box-shadow: 5px 5px 5px darkgray;
}
#frm{
	margin-left: 40%;
    margin-top: -4%;
}
.update_2{
	margin-top: -6%;
    margin-left: 31%;
    float: left;
}
#1{
    width: 330px;
    float: left;
}
#2{
	float:left;
}
li {
	list-style: none;
}
center {
	width: 1697px;
	height: 697px;
	margin-left: 190px;
    margin-top: -78px;
	background-color:rgb(242,244,255);
}
/* Footer */
.footer {
	clear: both;
	width: 100%;
	height: 10%;
	font-family: 한컴 고딕;
	font-weight: 50px;
	margin-top: 41%;
	margin-top: 7%;
}
a {
	text-decoration-line: none;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
	<!--  <header class="header">
		<div class="head">
			
			<div class="topMenu">
				<div class="clear">
					<li><a href="Main.jsp"><span>HOME</span></a></li>
					<li><a href="Login.jsp"><span>LOGIN</span></a></li>
				</div>
			</div>
		</div>
	</header>-->
	<!-- left태그 -->
	<left class="tap">
	<div class="v-line">
	<div class="logo">
				<a href="Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
					class="logo"></a>
			</div>
		<h2 style="color: black;">마이 페이지</h2>
		<h4>
			<a href="Mypage.jsp" style="color: black;">내정보 <a>
		</h4>
		<h4>
			<a href="Mycharge.jsp" style="color: black;"> My충전소 </a>
		</h4>
		<h4><a href="Update.jsp" style="color: black;"> 개인정보수정 </a>  </h4>
	</div>
	</left>
	<!-- left 끝 -->
	<center>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<content>
	<!-- <legend>내 정보</legend> -->
	<h6> < 사업자등록증 > </h6>
	<div class="img_1">
	<img src="<%=info.getFilename()%>"></div>
	<input class="update" type="submit" value="등록증 등록" >
		<form id="frm" action="UploadService" method="post"enctype="multipart/form-data">
			
			<input id="file" type="submit" name="filename" class="btn1">
				
		</form>
			
			
			<div class="number1">
			<h6>
			사업자 등록 번호:
			<%=info.getMember_num()%><br><br>
			사업자 비밀 번호:
			<%=info.getPassword()%><br><br>
			<form action="UpdateService" method="post">
			<!--   <div id="1">
			비밀번호 수정 :
			<input class="update_2" type="password" name="password">
			</div>
			<div id="2">
			<input type="submit" value="수정" class="btn">
			</div>-->
			</form>
		<br>
				
			충전소  위치 : <!-- <input type="text" name="plugspot"> <a href="Mycharge.jsp">
				<button class="btn2">등록</button></a>  -->
</h6>
	</div>
	</content>
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