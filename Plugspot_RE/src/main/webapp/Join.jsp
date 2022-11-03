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
PW:<input type = "text" name="password"><br>
<li><input type="button" value="사업자등록번호중복체크" onclick="checkE()"></li>
		<li><span id="resultCheckE"></span></li>
<input type = "submit" value="회원가입" id="joinBtn" disabled="disabled">
</form>
</fieldset>
	
<script>
function checkE() {
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

</script>
</body>
</html>