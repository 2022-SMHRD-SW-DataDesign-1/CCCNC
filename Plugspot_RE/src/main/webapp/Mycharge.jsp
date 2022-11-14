<%@page import="com.plugspot.model.ChargeDAO"%>
<%@page import="com.plugspot.model.ChargeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	width: 189px;
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
}*/
left img {
	position: fixed;
	float: left;
	width: 80px;
	height: 35px !important;
	line-height: 35px !important;
	/*border-right: 1px solid #D3D3D3;*/
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
content {
	/* padding: 50px 0 0;
            position: relative; */
	width: 1460px;
	margin-left: 30px;
	padding-left: 138px;
	padding-right: 138px;
	background-color: rgb(249, 251, 252);
}

#content_map {
	width: 50%;
	height: 30%;
	float: left;
	margin-top: 8%;
	margin-left: 11%;
}

#map {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	background-color: #fff;
	border-radius: 12px;
	border: solid 1px rgb(48, 151, 219);
}

#content_msg {
	width: 30%;
	float: left;
	margin-top: 200px;
}

h4 {
	position: relative;
	color: #74b9ff;
	line-height: 140%;
	font-weight: 700;
	/* padding-left: 19px; */
	/* margin: 30px 0 10px; */
	font-family: 한컴 고딕;
	/* font-size: 15px; */
	/* font-color: #686868 !important; */
	/* margin-left: 8%; */
	/* width:417px; */
}
/* left */
.v-line {
	border-right: 1px solid #D3D3D3;
	width: 190px;
	height: 84%;
	position: absolute;
	text-align: center;
	/* margin-top: 80px; */
	font-family: 한컴 고딕;
	display: block !important;
	color: #686868 !important;
	/* box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23); */
	background-color: white;
}

.in_tab h4 {
	width: 160px;
	height: 20px;
}

a {
	text-decoration: none;
}

.v-line h4:hover {
	font-size: large;
	cursor: pointer;
	display: block font-weight: bold !important;
	font-size: 20px !important;
	text-align: center;
}

#info {
	padding: 20px 17px 20px;
	border-radius: 12px;
	box-shadow: 2px 2px 14px 0 rgb(0 164 73/ 8%);
	background-color: #fff;
	box-sizing: border-box;
	float: left;
	width: 60%;
	height: 100%;
	
	font-family: 한컴 고딕;
	box-shadow: 0 10px 20px rgb(0 0 0/ 19%), 0 6px 6px rgb(0 0 0/ 23%);
	border: solid 1px rgb(48, 151, 219);
}

li {
	list-style: none;
}

center {
	width: 1912px;
	height: 770px;
	/* 	margin-left: 190px;
    margin-top: -78px; */
	background-color: rgb(242, 244, 255);
}

.btns {
	float: right;
	margin-top: 60px;
}

button {
	background-color: #74b9ff;
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
	
	box-shadow: 5px 5px 5px darkgray;
}

button.spot {
	margin-left: 3%;
	margin-top: 10%;
}

.myphoto img {
	border: 0;
	width: 80px;
	aspect-ratio: auto 56/56;
	height: 80px;
	/* margin-bottom:5%; */
	float: left;
	box-shadow: 0 3px 6px 0 rgb(29 34 53/ 8%);
	border-radius: 50%;
	vertical-align: top;
	margin-left: 4%;
}

.info_num {
	float: left;
	width: 200px;
	/* margin-left:5%;
	margin-top:8%; */
	margin-top: 20px;
}

.info_num h4 {
	/* 	position: relative; */
	color: rgb(48,151,219);
	line-height: 140%;
	font-weight: 700;
	margin: 30px 0 10px;
	font-family: 한컴 고딕;

	/* width:417px; */
}

#content_msg h4 {
	margin-left: -27%;
	width: 417px;
}

legend {
	text-align: left;
	font-weight: bold;
	font-family: 한컴 고딕;
}
/* Footer */
footer {
	clear: both;
	width: 100%;
	height: 15%;
	font-family: 한컴 고딕;
	font-weight: 50px;
	position: absolute;
	bottom: 0;
}
</style>
</head>
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
		
	</header>
	<!-- head 끝 -->


	<!-- left태그 -->
	<left class="tap">

	<div class="v-line">
		<div class="logo">
			<a href="Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
				class="logo"></a>
		</div>
		<h2 style="color: black; font-family: 한컴 고딕; margin-top: 39%;">마이
			페이지</h2>
		<div class="in_tap">
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
	</div>
	</left>
	<center>
		<div class="content">
			<div id="in_content">
				<div id="content_map">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f"></script>
					<script type="text/javascript" src="./js/jquery-3.6.1.min.js"></script>
					<div id="map" style="width: 688px; height: 600px;"></div>
				</div>
				<!-- content_map 끝 -->
				<div id="content_msg">
					<span>
						<h4>* 지도에서 원하는 지역을 클릭하거나 아래 버튼을 클릭하시오.</h4>
					</span> <span id="clickLatlng" style="display: none;"></span>
					<div id="info">
						<legend>My충전소</legend>
						<br>
						<div class="myphoto">
							<img src="./img/프로필이미지사진.png" width="80" height="80"
								alt="내 프로필 이미지">
						</div>
						<div class="info_num">
							<%
							MemberDTO info = (MemberDTO) session.getAttribute("info");
							%>
							<span style="font-weight:bold">사업자등록번호</span>
						<br> 
						<span class="3"><%=info.getMember_num()%></span>
							
								
							
						</div>
						<li>
							<div class="btns">
								<button onclick="seoul()" name="서울">서울</button>
								<button onclick="busan()" name="부산">부산</button>
								<button onclick="daegu()" name="대구">대구</button>
								<br>
								<button onclick="incheon()" name="인천">인천</button>
								<button onclick="gwangju()" name="광주">광주</button>
								<button onclick="daejeon()" name="대전">대전</button>
								<br>
								<button onclick="ulsan()" name="울산">울산</button>
								<button onclick="sejong()" name="세종">세종</button>
								<button onclick="gyeonggi()" name="경기">경기</button>
							</div>
						</li>

						<script>
							var mapContainer = document.getElementById('map'), mapOption = {
								center : new kakao.maps.LatLng(37.56638,
										126.977902),
								level : 10
							};
							var map = new kakao.maps.Map(mapContainer,
									mapOption);
							var marker = new kakao.maps.Marker({
								position : map.getCenter()
							});
							marker.setMap(map);
							var lat;
							var lng;
							let latList = [];
							let lngList = [];
							kakao.maps.event.addListener(map, 'click',
									function(mouseEvent) {
										var latlng = mouseEvent.latLng;
										marker.setPosition(latlng);
										lat = latlng.getLat();
										lng = latlng.getLng();
										latList.push(lat);
										lngList.push(lng);
										var message = '클릭한 위치의 위도는 ' + lat
												+ ' 이고, ';
										message += '경도는 ' + lng + ' 입니다';
										console.log(latList);
										console.log(lngList);
										var resultDiv = document
												.getElementById('clickLatlng');
										resultDiv.innerHTML = message;
									});
							kakao.maps.event.addListener(map, 'click',
									function(mouseEvent) {
										addMarker(mouseEvent.latLng);
									});
							var markers = [];
							function addMarker(position) {
								var marker = new kakao.maps.Marker({
									position : position
								});
								marker.setMap(map);
								markers.push(marker);
							}
							function setMarkers(map) {
								for (var i = 0; i < markers.length; i++) {
									marker[i].setMap(map);
								}
							}
							function seoul() {
								var moveLatLon = new kakao.maps.LatLng(
										37.56638, 126.977902);
								map.panTo(moveLatLon);
							}
							function busan() {
								var moveLatLon = new kakao.maps.LatLng(
										35.179572, 129.075577);
								map.panTo(moveLatLon);
							}
							function daegu() {
								var moveLatLon = new kakao.maps.LatLng(
										35.841269, 128.60173400000002);
								map.panTo(moveLatLon);
							}
							function incheon() {
								var moveLatLon = new kakao.maps.LatLng(
										37.455791, 126.705401);
								map.panTo(moveLatLon);
							}
							function gwangju() {
								var moveLatLon = new kakao.maps.LatLng(
										35.160015, 126.851329);
								map.panTo(moveLatLon);
							}
							function daejeon() {
								var moveLatLon = new kakao.maps.LatLng(
										36.349637, 127.383316);
								map.panTo(moveLatLon);
							}
							function ulsan() {
								var moveLatLon = new kakao.maps.LatLng(
										35.538756, 129.311327);
								map.panTo(moveLatLon);
							}
							function sejong() {
								var moveLatLon = new kakao.maps.LatLng(
										36.480862, 127.29075700000001);
								map.panTo(moveLatLon);
							}
							function gyeonggi() {
								var moveLatLon = new kakao.maps.LatLng(
										37.263201, 127.028574);
								map.panTo(moveLatLon);
							}
						</script>
					</div>
					<button class="spot" onclick="insertTable()">위치등록</button>
					<script type="text/javascript">
						function insertTable() {
							$.ajax({
								url : 'StateProgram',
								data : {
									'latiList' : latList.toString(),
									'longList' : lngList.toString(),
									'data_test' : "data_test"
								},
								type : 'post',
								success : function(data) {
									console.log(data);
									alert("주소등록에 성공하셨습니다");
									location.href = "Mypage.jsp";
								}
							});
						}
					</script>
				</div>
				<!-- content_msg 끝 -->
			</div>
			<!-- in_content 끝 -->
		</div>
		<!-- content 끝 -->

	</center>
	<footer class="footer">

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

