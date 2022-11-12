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
	.footer {
		clear: both;
		width: 100%;
		/* height: 10%; */
		font-family: 한컴 고딕;
		font-weight: 50px;
		position: relative;
		text-align: center;
	}
	#inputE, #pw, #pw2 {
		display: block;
		position: relative;
		width: 100%;
		height: 30px;
		border: none;
		background: #fff;
		font-size: 15px;
		border: solid 1px #DADADA;
		padding: 10px 14px 10px 14px;
		box-sizing: border-box;
	}
	#inputE {
		padding-right: 110px;
		font-family: Dotum, '한컴고딕', Helvetica, sans-serif;
	}
	#pw, #pw2 {
		padding-right: 40px;
		font-family: Dotum, '한컴고딕', Helvetica, sans-serif;
	}
	/* .btn_area {
		margin: 20%
	}
	 */
	/* #btnJoin, #btnLogin {
		width: 100%;
		height: 50px;
		border: 0;
		cursor: pointer;
		color: #fff;
		background-color: rgb(45, 204, 106);
		font-size: 20px;
		font-weight: 400;
		font-family: 한컴고딕, Helvetica, sans-serif;
	}
	 */
	#btnId, #btnRpw, #joinBtn {
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
	li{
	list-style: none;
	}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
	<header class="header">
		<!-- head 시작 -->
		<div class="inner_header">
			<a href="Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
				class="logo">
			</a>
			<!-- topMenu -->
			<!-- <div class="topMenu">
                <ul class="clear">
                    <li><a href="https://evc.kepco.co.kr"><span>HOME</span></a></li>
                    <li><a href="https://naver.com"><span>LOGIN</span></a></li>
                </ul>
            </div> -->
			<!-- topMenu 끝 -->
		</div>
	</header>
	<!-- head 끝 -->
	<center>
		<div class="content">
			<legend>
				<p>
				<h1>회원가입</h1>
				</p>
			</legend>
			<form action="JoinProgram" method="post">
				<table>
					<tr>
						<td>사업자등록번호</td>
						<td><input type="text" name="member_num" id="inputE"></td>
						<td><input type="button" id="btnId" class="button" value="중복확인" onclick="checkE()"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="password" id="pw"></td>
					</tr>
					<tr>
						<td>비밀번호 재확인</td>
						<td><input type="password" name="password" id="pw2"></td>
						<td><input type="button" id="btnRpw" value="확인" onkeydown="checkP()" onclick="checkP()"><li><span id="resultCheckP"></span></li></td>
					</tr>
					</table>
					<div>
						<input type="submit" id="joinBtn" value="회원가입" disabled="disabled" onclick="checkS()"  >
						<li><span id="resultCheckE"></span></li>
					</div>
				
				</form>
			
		</div> 	<!-- content 끝 -->
	
	</center>
	
	<!-- <fieldset>
		<legend>Join</legend>
		<form action="JoinProgram" method="post">
			ID:<input type="text" name="member_num" id="inputE"><br>
			<li><input type="button" value="사업자등록번호중복체크" onclick="checkE()"></li>
			PW:<input type="password" name="password" id="pw"><br>
			비밀번호확인:<input type="password" name="password" id="pw2"><br>
			<li><input type="button" value="비밀번호확인" onkeydown="checkP()" onclick="checkP()"> </li>
			<li><span id="resultCheckP"></span></li>
			
			<li><span id="resultCheckE"></span></li> <input type="submit"
				value="회원가입" id="joinBtn" disabled="disabled" onclick="checkS()">
		</form>
	</fieldset> -->
	<footer class="footer">
		<div class="f_logo">
			<img src="./img/FootLogo.png" alt="PlugSpot">
		</div>
		<span class="t">|</span> <strong style="color: black;">개인정보처리방침</strong>
		<span class="t">|</span> <span class="m mar_l5">고객센터
			010-9313-9935</span>
		<p class="mar_t5">
			사업자번호: 111-222-3333 &nbsp;&nbsp; 대표자: 쿠쿠뉴쿠 &nbsp;&nbsp;주소: 광주광역시 남구
			송암로 60 광주CGI센터2층 <br> Copyright@2022 PlugSpot. All Rights
			Reserved
		</p>
	</footer>
	<!-- foot 끝 -->
	<script>
	let pwCheck = false;
	let idCheck = false;
	
	function checkE(){
		let inputE = $('#inputE').val();
		console.log(inputE);
		
		$.ajax({
			url : 'idcheck',
			data : {'inputE' : inputE },
			type : 'get',
			dataType :'json',
			success : function(data) {
				console.log(data);
				if (data == true) {
					 /* $("#resultCheckE").text("사용 불가해 이자식아."); */
					alert("사용 불가능한 아이디입니다.");
					$("#joinBtn").attr("disabled", true);
					idCheck = false;
				} else {
					 /* $("#resultCheckE").text("사용해 이자식아."); */
					alert("사용 가능한 아이디입니다.");
					$("#joinBtn").attr("disabled", false);
					idCheck = true;
				}
			},
			error : function() {
				console.log("통신실패");
			}
			
		});
	}
	
	function checkP(){
		var pw = $("#pw").val();
		var pw2 = $("#pw2").val();
		if(pw != pw2){
			/* $("#resultCheckP").text("다르다고 했냐 안했냐?");	 */
			alert("비밀번호가 불일치합니다.");
			$("#joinBtn").attr("disabled", true);
			pwCheck = false;
		} else{
			/* $("#resultCheckP").text("이제는 써도될듯?"); */
			alert("비밀번호가 일치합니다.");
			$("#joinBtn").attr("disabled", false);
			pwCheck= true;
		}
	}
	function checkS() {
		if(pwCheck && idCheck){
			 $("#joinBtn").attr("action","Main.jsp");
			alert("회원가입 완료.");
		}
		else{
			 $("#joinBtn").attr("action","Join.jsp");
			alert("가입정보가 일치하지 않습니다.");
		}
	}
	</script>
</body>
</html>