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
<form id="joinForm" method="post">
ID:<input type = "text" name="member_num" id="inputE"><br>
PW:<input type="password" name="password" id="pw"><br>
비밀번호확인:<input type="password" name="password" id="pw2"><br>
<li><input type="button" value="비밀번호확인"  onclick="checkP()"> </li>
		<li><span id="resultCheckP"></span></li>  
<li><input type="button" value="사업자등록번호중복체크" onclick="checkE()"></li>
		<li><span id="resultCheckE"></span></li>

		
<input type = "submit" value="회원가입" id="joinBtn" disabled="disabled" onclick="checkS()">
</form>
</fieldset>
	
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
					$("#resultCheckE").text("사용 불가해 이자식아.");
					$("#joinBtn").attr("disabled", true);
					idCheck = false;
				} else {
					$("#resultCheckE").text("사용해 이자식아.");
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
			$("#resultCheckP").text("다르다고 했냐 안했냐?");	
			$("#joinBtn").attr("disabled", true);
			pwCheck = false;
		} else{
			$("#resultCheckP").text("이제는 써도될듯?");
			$("#joinBtn").attr("disabled", false);
			pwCheck= true;
		}
	} 
 
	function checkS() {
		if(pwCheck && idCheck){
			$("#joinForm").attr("action","JoinProgram");
		}
		else{
			$("#joinForm").attr("action","Join.jsp");
			alert("가입정보가 일치하지 않습니다.");
		}
	}

	 



</script>
</body>
</html>