<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type = "text/css">
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
            margin-bottom: 7%;
            padding-top: 3%;
            border-style:solid;
            border-radius: 10px;
            border-color: lavender;
            box-shadow:3px 3px antiquewhite;
        }
        /* center{
            border-style: dashed;
        }
  */
        /* table {
            width:500px ;
            height: 100%;
            background: white;
            font-family: Dotum,'한컴고딕',Helvetica,sans-serif;
            position: relative;
            margin-right: 10%;
        }
       */
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
        #id{
            padding-right: 110px;
            font-family: Dotum,'한컴고딕',Helvetica,sans-serif;
        }
        #pw{
            padding-right: 40px;
            font-family: Dotum,'한컴고딕',Helvetica,sans-serif;
        }
        .btn_area {
            margin-top:20px;
        }
        #btnJoin, #btnLogin {
            width: 100%;
            height: 40px;
            border: 0;
            cursor: pointer;
            color: #fff;
            background-color: rgb(45,204,106);
            font-size: 20px;
            font-weight: 400;
            font-family: 한컴고딕,Helvetica,sans-serif;
        }
        #btnId, #btnPw{
            width: 56px;
            height: 30px;
            border: 0;
            cursor: pointer;
            color: #fff;
            background-color: rgb(45,204,106);
            font-size: 12px;
            font-weight: 400;
            font-family: 한컴고딕,Helvetica,sans-serif;
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
<form action="LoginService" method="post">
    <header class="header">
        <!-- head 시작 -->
        <div class="inner_header">
                <a href="./Main.jsp">
                    <img src="./img/Logo.png" alt="PlugSpot" class="logo">
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
    </header> <!-- head 끝 -->
    <center>
    <div class="content">
        <legend> <p id="title"><h1>로그인</h1></p> </legend>
    <br>
      <table>
        <tr>
            <td>사업자등록번호</td>
            <td><input type="text" name="member_num" id="id" class="id" placeholder="사업자번호를 입력하시오."> </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" id="pw" class="pw" placeholder="비밀번호를 입력하시오."> </td>
        </tr>
    </table>
    <br>
    <table>
        <tr class="btn_area">
            <td><a href="./Join.jsp"><input type="button" id="btnJoin" value="회원가입"></a></td>
            <td><input type="submit" id="btnLogin" value="로그인"></td>
        </tr>
    </table>
    </div> <!-- content 끝-->
</center>
    <footer class="footer">
        <div class="f_logo">
            <img src="./img/FootLogo.png" alt="PlugSpot">
        </div>
        <span class="t">|</span>
        <strong style="color:black;">개인정보처리방침</strong>
        <span class="t">|</span>
        <span class="m mar_l5">고객센터 010-9313-9935</span>
        <p class="mar_t5">사업자번호: 111-222-3333 &nbsp;&nbsp; 대표자: 쿠쿠뉴쿠 &nbsp;&nbsp;주소: 광주광역시 남구 송암로 60 광주CGI센터2층
            <br>
        Copyright@2022 PlugSpot. All Rights Reserved </p>
    </footer> <!-- foot 끝 -->
</form>
</body>
</html>