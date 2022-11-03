<%@page import="com.plugspot.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body>
<% MemberDTO info = (MemberDTO)session.getAttribute("info");  %>

<fieldset>
	<legend>내 정보</legend>
		<form id="frm" action="UploadService" method="post" enctype="multipart/form-data">
			사업자 등록 번호:<%= info.getMember_num()%>
			사업자등록증 등록:<input id="file" type="file" name="filename" style="float: right;">
		<input type = "submit" value="등록증 등록">
</form>

<form>
변경할 패스워드:<input type="password" name="password" placeholder="PW를 입력하세요">
<input type="submit" value="비밀번호수정">
</form>
</fieldset>
<script>
function uploadFunction() {
      var formData=new FormData();     
      formData.append("filename",$('#file')[0].files[0]);
      alert(formData);
	 $.ajax({
	   type:"POST",
	   enctype: 'multipart/form-data',
	   processData:false,
	   contentType:false,
	   url:"UploadService",
	   data:formData,
	   success:function(data){
	   console.log("success") 
	   }
	   });  
}
</script>
</body>
</html>