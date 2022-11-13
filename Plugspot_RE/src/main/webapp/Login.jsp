<%@page import="com.plugspot.model.MemberDTO"%>
<%@page import="com.plugspot.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.header {
	width: 100%;
	padding-top: 10px !important;
	height: 10% !important;
	position: relative;
	text-align: center;
}
.header .inner_header {
	position: relative;
	width: 100%;
	margin: 0 auto;
	line-height: 100%;
}
.header .logo {
	display: inline-block;
	width: 400px;
	margin-top: 40px;
}
.header h1.logo a img {
	width: 100%;
	margin-left: 150px;
	text-align: center;
}
.content {
	display: inline-block;
	width: 550px;
	height: 350px;
	/* margin-left: 25%; */
	/* margin-right: 10%; */
	margin-top: 7%;
	margin-bottom: 5%;
	padding-top: 3%;
	border-style: solid;
	border-radius: 10px;
	border-color: lavender;
	box-shadow: 3px 3px antiquewhite;
}
.id, .pw, .Rpw {
	display: block;
	position: relative;
	width: 315px;
	height: 30px;
	border: none;
	background: #fff;
	font-size: 15px;
	border: solid 1px #DADADA;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
}
#id {
	padding-right: 110px;
	font-family: Dotum, '한컴고딕', Helvetica, sans-serif;
}
#pw {
	padding-right: 40px;
	font-family: Dotum, '한컴고딕', Helvetica, sans-serif;
}
.btn_area {
	margin-top: 20px;
}
#btnJoin, #btnLogin {
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
	margin-left: 8%;
	box-shadow: 5px 5px 5px darkgray;
}
.footer {
	clear: both;
	width: 100%;
	/* height: 10%; */
	font-family: 한컴 고딕;
	font-weight: 50px;
	position: relative;
	text-align: center;
}
</style>
</head>
<body>
<script type="text/javascript" src="./js/jquery-3.6.1.min.js"></script>
	
		<header class="header">
			<!-- head 시작 -->
			<div class="inner_header">
				<a href="./Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
					class="logo">
				</a>
			</div>
		</header>
		<!-- head 끝 -->
		<center>
			<div class="content">
				<legend>
					<p id="title">
					<h1>로그인</h1>
					</p>
				</legend>
				<br>
				<table>
					<tr>
						<td>사업자등록번호</td>
						<td><input type="text" name="member_num" id="id" class="id"
							placeholder="사업자번호를 입력하시오."></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="password" id="pw" class="pw"
							placeholder="비밀번호를 입력하시오."></td>
					</tr>
				</table>
				<br>
				<table>
					<tr class="btn_area">
						<td><a href="./Join.jsp"><input type="button"
								id="btnJoin" value="회원가입"></a></td>
						<td><input type="button"
								id="btnLogin" value="로그인" onclick="checkid()"></td>
					</tr>
				</table>
			</div>
			<!-- content 끝-->
			
		</center>
		<script>
			function checkid(){
				let id = document.getElementById("id").value;
				let pw = document.getElementById("pw").value;
				console.log(id);
				console.log(pw);
				
				$.ajax({
					url : 'LoginService',
					data : {'id' : id , 'pw' : pw},
					type : 'get',
					success : function(data) {
						console.log(data);
						if (data == "<checkid>") {
							alert("어서 오십시오.");
							location.replace("Main.jsp");
						} else {
							alert("등록되지 않은 사용자입니다.");
							location.replace("Login.jsp");
						}
					},
					error : function() {
						console.log("통신실패");
					}
					
				});
			}
			</script>
		<footer class="footer">
			<div class="f_logo">
				<img src="./img/FootLogo.png" alt="PlugSpot">
			</div>
			<span class="t">|</span> <span style="color: black;">개인정보처리방침</span>
			<span class="t">|</span> <span class="m mar_l5">고객센터
				010-9313-9935</span>
			<p class="mar_t5">
				사업자번호: 111-222-3333 &nbsp;&nbsp; 대표자: 쿠쿠뉴쿠 &nbsp;&nbsp;주소: 광주광역시 남구
				송암로 60 광주CGI센터2층 <br> Copyright@2022 PlugSpot. All Rights
				Reserved
			</p>
		</footer>
		<!-- foot 끝 -->
	
</body>
</html>