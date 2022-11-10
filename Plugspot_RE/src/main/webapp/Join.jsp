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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
<fieldset>
<legend>Join</legend>
<form action="JoinProgram" method="post">
ID:<input type = "text" name="member_num" id="inputE"><br>
PW:<input type="password" name="password" id="pw"><br>
 비밀번호확인:<input type="password" name="password" id="pw2"><br>
<li><input type="button" value="비밀번호확인" onkeydown="checkP()"> <!-- onclick="checkP()" --> </li>
		<li><span id="resultCheckP"></span></li> 
<li><input type="button" value="사업자등록번호중복체크" onclick="checkE()"></li>
		<li><span id="resultCheckE"></span></li>

		
<input type = "submit" value="회원가입" id="joinBtn" disabled="disabled" onclick="checkS()">
</form>
</fieldset>
	
<script>
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
				$("#resultCheckE").text("사용 불가해 이자식아.");
				$("#joinBtn").attr("disabled", true);
			} else {
				$("#resultCheckE").text("사용해 이자식아.");
				$("#joinBtn").attr("disabled", false);
			}
		},
		error : function() {
			console.log("통신실패");
		}
	});
}

/* function checkP(){
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	if(pw != pw2){
	$("#resultCheckP").text("다르다고 했냐 안했냐?");	
	$("#joinBtn").attr("disabled", true);
	} else{
		$("#resultCheckP").text("이제는 써도될듯?");
		$("#joinBtn").attr("disabled", false);
	}
	} 
	 */
 function checkS(){
	let inputE = $('#inputE').val();
	var pw = $("#pw").val();2
	var pw2 = $("#pw2").val();
	$.ajax({
	url : 'idcheck',
	data : {'inputE' : inputE },
	type : 'get',
	dataType :'json',
	success : function(data) {
		console.log(data);
		
		if (data == true && pw == pw2) {
			
			alert('회원가입성공');
			location.href="Login.jsp";
			
		}else{
			alert('회원가입실패');
			location.href="Join.jsp";
		}
	},
	
	});
} 
function checkP() {
	let pw = $("#pw").val();
	let pw2 = $("#pw2").val();
	console.log(pw);
	console.log(pw2);
	$.ajax({
		// 요청서버 url
		url : "pwcheck",
		// 요청할 때 같이 보내줄 데이터
		data : {"pw" : pw,
				"pw2" : pw2},
		// 요청 타입
		type : 'get',
		// 통신 성공 function(넘겨준데이터)
		success : function(data) {
			console.log(typeof data);
			if (data == 'false') {
		$("#resultCheckP").text("같아요~");
		$("#privacyUpdateSubmit").attr("disabled",false);
			} else {
		$("#resultCheckP").text("달라요~");
		$("#privacyUpdateSubmit").attr("disabled",true);
			}
		},
		// 통신 실패
		error : function() {
			console.log("조샀다 !");
		}
	})
}

</script>
</body>
</html>