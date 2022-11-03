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
	<fieldset>
	<legend>login</legend>
		<form action="LoginService" method="post">
			ID :<input type = "text" name="member_num"><br>
			PW:<input type = "password" name="password"><br>
			<input type ="submit" value="로그인">
		</form>
	</fieldset>
</body>
</html>