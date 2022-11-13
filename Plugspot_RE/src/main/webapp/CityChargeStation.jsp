<%@page import="com.plugspot.model.avgDTO"%>
<%@page import="com.plugspot.model.avgDAO"%>
<%@page import="com.plugspot.model.lowDTO"%>
<%@page import="com.plugspot.model.lowDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.plugspot.model.fastDTO"%>
<%@page import="com.plugspot.model.fastDAO"%>
<%@page import="com.plugspot.model.CityChargeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.CityChargeDAO"%>
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
	width: 200px;
}
/* Header */
.header {
	width: 83%;
	padding-top: 10px !important;
	height: 10% !important;
	position: fixed;
}
.header .inner_header {
	position: relative;
	width: 100%;
	margin: 0 auto;
	line-height: 100%;
}
.header .logo {
	display: inline-block;
	width: 190px;
	margin-top: 0px;
	margin: 0 auto;
}
.header .topMenu {
	position: absolute;
	width: 100%;
	/* border-bottom: 1px solid #D3D3D3; */
	margin: 0 auto;
	margin-left: 90%;
	top: 24px !important;
}
.header .topMenu ul {
	position: fixed;
	float: right;
	list-style: none;
	margin-left: 350px;
}
.header img {
	position: fixed;
	float: left;
	width: 80px;
	height: 35px !important;
	line-height: 35px !important;
	border-right: 1px solid #D3D3D3;
}
.header .topMenu li {
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
	/*font-family:dotum;*/
	font-size: 15px;
	margin: 0 auto;
}
.header .topMenu li a:hover {
	display: block;
	color: #686868;
	text-align: center;
	/*font-weight:800;font-size:13px;*/
	font-weight: bold !important;
	font-size: 20px !important;
}
content {
	float: left;
	width: 1509px;
	height: 100%;
	margin-left: 10%;
	margin-right: 10%;
}
.mapimg1 {
	width: 250px;
}
.mapimg2 {
	height: 189px;
	width: 212px;
}
.select_ct {
	float: left;
	margin-top: 50%;
	margin-left: -4%;
}
#chart-area {
	display: block;
	width: 320px;
    height: 160px;
}
#chart-area2 {
	display: block;
	width: 320px;
    height: 160px;
	margin-top: 23%;
}
#canvas-holder {
	display: block;
	width: 300px;
	height: 150px;
	float: left;
	margin-top: 26%;
}
div {
	display: inline-block;
}
li {
	list-style: none;
}
#city {
	width: 80px;
	height: 40px;
	text-align: center;
	margin-left: 38%;
}
.t1 {
	display: inline;
	border-radius: 5%;
	float: left;
	margin-top: 16%;
	text-align: center;
}
.t2 {
	display: inline;
	border-radius: 5%;
	float: left;
	margin-top: 16%;
	text-align: center;
}
h3 {
	text-align: left;
}
#canvas-holder2 {
	margin-top: 16%;
	float: left;
}
.uichart {
	margin: 10%;
	float: left;
}
#myChart, #myChart2, #myChart3, #myChart4 {
	width: 517px;
	height: 247px;
}
.article {
	float: left;
}
.article2 {
	float: left;
	margin-left: 0%;
	margin-top: -1%;
}
.footer {
	clear: both;
	width: 100%;
	height: 10%;
	font-family: 한컴 고딕;
	font-weight: 50px;
}
</style>
</head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f"></script>

<body>
	<fieldset class="t1" style="display:inline;margin-top: 0px;width: 200px;height: 300px;">
		<h3>서울</h3>
		<div>
	    	<div id="staticMap" style="width: 260px; height: 230px;"></div>
		</div>
	</fieldset>
    <div id="chart-area" style="display:inline"></div>
	<div style="height:100%; width:100%;">
        <canvas id="myChart"></canvas>
        <canvas id="myChart2"></canvas>
    </div>
	
	
	
<%
CityChargeDAO dao = new CityChargeDAO();
ArrayList<CityChargeDTO> station = dao.station();
fastDAO dao2  = new fastDAO();
ArrayList<fastDTO> fast = dao2.fast();
lowDAO dao3 = new lowDAO();
ArrayList<lowDTO> low = dao3.low();
avgDAO dao4 = new avgDAO();
ArrayList<avgDTO> avg = dao4.avg();
avgDAO dao5 = new avgDAO();
ArrayList<avgDTO> avg2 = dao5.lowavg();
%>
<header class="header">
		<!-- head 시작 -->
		<div class="head">
			<div class="logo">
				<a href="Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
					class="logo"></a>
			</div>
			<div class="topMenu">
				<div class="clear">
					<li><a href="Main.jsp"><span>HOME</span></a></li>
					<li><a href="Login.jsp"><span>LOGIN</span></a></li>
				</div>
			</div>
			<!-- topMenu 끝 -->
		</div>
		<!-- head끝  -->
	</header>
	<content>
	<div class="article">

<script>


/* var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(37.514575, 127.04955559999999), // 이미지 지도의 중심좌표
        level: 10, 
        
    };    


var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
 */
var mapContainer = document.getElementById('staticMap'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.514575, 127.04955559999999), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption);

let positions = [];
<% for(CityChargeDTO ccd : station){%> 
	
	positions.push({
	    title: '<%= ccd.getCharge_state_name()%>' , 
	    latlng: new kakao.maps.LatLng(<%= ccd.getLatitude()%>,<%= ccd.getLongitude()%>)
	   
	});
	
 <%}%>


var marker, i; 
for (var i = 0; i < positions.length; i ++) {
	var imageSrc = 'marker/chargelogo.png', imageSize = new kakao.maps.Size(25, 25); 
	var imageOption = {
			offset : new kakao.maps.Point(9,9)
	};										
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
    
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng,
        title : positions[i].title,
        image : markerImage // 마커 이미지 
    });
   // marker.setMap(map)
}
</script>

<!-- 급속평균 -->
 <script>
let avgfastchartList = [];

avgfastchartList.push(<%=avg.get(0).getOne_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getTwo_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getTree_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getFour_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getFive_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getSix_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getSeven_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getEight_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getNine_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getTen_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getEleven_week_charge()%>);
avgfastchartList.push(<%=avg.get(0).getTwelve_week_charge()%>);
</script> 
<!-- 완속평균 -->
<script>
let avglowchartList = [];

avglowchartList.push(<%=avg2.get(0).getOne_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getTwo_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getTree_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getFour_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getFive_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getSix_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getSeven_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getEight_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getNine_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getTen_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getEleven_week_charge()%>);
avglowchartList.push(<%=avg2.get(0).getTwelve_week_charge()%>);
</script>
<!-- 완속 -->
<script>
let seoullowchartList = [];

seoullowchartList.push(<%=low.get(0).getOne_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getTwo_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getTree_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getFour_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getFive_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getSix_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getSeven_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getEight_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getNine_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getTen_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getEleven_week_charge()%>);
seoullowchartList.push(<%=low.get(0).getTwelve_week_charge()%>);
</script>
<script>
let busanlowchartList = [];

busanlowchartList.push(<%=low.get(1).getOne_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getTwo_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getTree_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getFour_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getFive_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getSix_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getSeven_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getEight_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getNine_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getTen_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getEleven_week_charge()%>);
busanlowchartList.push(<%=low.get(1).getTwelve_week_charge()%>);
</script>
<script>
let daegulowchartList = [];

daegulowchartList.push(<%=low.get(2).getOne_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getTwo_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getTree_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getFour_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getFive_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getSix_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getSeven_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getEight_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getNine_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getTen_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getEleven_week_charge()%>);
daegulowchartList.push(<%=low.get(2).getTwelve_week_charge()%>);
</script>
<script>
let incheonlowchartList = [];

incheonlowchartList.push(<%=low.get(3).getOne_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getTwo_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getTree_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getFour_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getFive_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getSix_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getSeven_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getEight_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getNine_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getTen_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getEleven_week_charge()%>);
incheonlowchartList.push(<%=low.get(3).getTwelve_week_charge()%>);
</script>
<script>
let gwangjulowchartList = [];

gwangjulowchartList.push(<%=low.get(4).getOne_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getTwo_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getTree_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getFour_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getFive_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getSix_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getSeven_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getEight_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getNine_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getTen_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getEleven_week_charge()%>);
gwangjulowchartList.push(<%=low.get(4).getTwelve_week_charge()%>);
</script>
<script>
let daejeonlowchartList= [];

daejeonlowchartList.push(<%=low.get(5).getOne_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getTwo_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getTree_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getFour_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getFive_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getSix_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getSeven_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getEight_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getNine_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getTen_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getEleven_week_charge()%>);
daejeonlowchartList.push(<%=low.get(5).getTwelve_week_charge()%>);
</script>
<script>
let ulsanlowchartList = [];

ulsanlowchartList.push(<%=low.get(6).getOne_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getTwo_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getTree_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getFour_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getFive_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getSix_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getSeven_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getEight_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getNine_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getTen_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getEleven_week_charge()%>);
ulsanlowchartList.push(<%=low.get(6).getTwelve_week_charge()%>);
</script>
<script>
let sejeonglowchartList = [];

sejeonglowchartList.push(<%=low.get(7).getOne_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getTwo_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getTree_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getFour_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getFive_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getSix_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getSeven_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getEight_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getNine_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getTen_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getEleven_week_charge()%>);
sejeonglowchartList.push(<%=low.get(7).getTwelve_week_charge()%>);
</script>
<script>
let gyeonggidolowchartList = [];

gyeonggidolowchartList.push(<%=low.get(8).getOne_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getTwo_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getTree_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getFour_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getFive_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getSix_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getSeven_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getEight_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getNine_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getTen_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getEleven_week_charge()%>);
gyeonggidolowchartList.push(<%=low.get(8).getTwelve_week_charge()%>);
</script>
<script>
let GangwondolowchartList = [];

GangwondolowchartList.push(<%=low.get(9).getOne_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getTwo_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getTree_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getFour_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getFive_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getSix_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getSeven_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getEight_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getNine_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getTen_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getEleven_week_charge()%>);
GangwondolowchartList.push(<%=low.get(9).getTwelve_week_charge()%>);
</script>
<script>
let ChungcheongbukdolowchartList =[];

ChungcheongbukdolowchartList.push(<%=low.get(10).getOne_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getTwo_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getTree_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getFour_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getFive_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getSix_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getSeven_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getEight_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getNine_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getTen_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getEleven_week_charge()%>);
ChungcheongbukdolowchartList.push(<%=low.get(10).getTwelve_week_charge()%>);
</script>
<script>
let ChungcheongnamdolowchartList =[];

ChungcheongnamdolowchartList.push(<%=low.get(11).getOne_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getTwo_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getTree_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getFour_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getFive_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getSix_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getSeven_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getEight_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getNine_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getTen_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getEleven_week_charge()%>);
ChungcheongnamdolowchartList.push(<%=low.get(11).getTwelve_week_charge()%>);
</script>
<script>
let JeollabukdolowchartList = [];

JeollabukdolowchartList.push(<%=low.get(12).getOne_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getTwo_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getTree_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getFour_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getFive_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getSix_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getSeven_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getEight_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getNine_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getTen_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getEleven_week_charge()%>);
JeollabukdolowchartList.push(<%=low.get(12).getTwelve_week_charge()%>);
</script>
<script>
let JeollanamdolowchartList = [];

JeollanamdolowchartList.push(<%=low.get(13).getOne_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getTwo_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getTree_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getFour_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getFive_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getSix_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getSeven_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getEight_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getNine_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getTen_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getEleven_week_charge()%>);
JeollanamdolowchartList.push(<%=low.get(13).getTwelve_week_charge()%>);
</script>
<script>
let GyeongsangbukdolowchartList = [];

GyeongsangbukdolowchartList.push(<%=low.get(14).getOne_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getTwo_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getTree_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getFour_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getFive_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getSix_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getSeven_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getEight_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getNine_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getTen_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getEleven_week_charge()%>);
GyeongsangbukdolowchartList.push(<%=low.get(14).getTwelve_week_charge()%>);
</script>
<script>
let GyeongsangnamdolowchartList = [];

GyeongsangnamdolowchartList.push(<%=low.get(15).getOne_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getTwo_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getTree_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getFour_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getFive_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getSix_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getSeven_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getEight_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getNine_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getTen_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getEleven_week_charge()%>);
GyeongsangnamdolowchartList.push(<%=low.get(15).getTwelve_week_charge()%>);

</script>
<script>
let jejulowchartList = [];

jejulowchartList.push(<%=low.get(16).getOne_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getTwo_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getTree_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getFour_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getFive_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getSix_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getSeven_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getEight_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getNine_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getTen_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getEleven_week_charge()%>);
jejulowchartList.push(<%=low.get(16).getTwelve_week_charge()%>);
</script>
<!-- 완속 -->
<script>

        new Chart(document.getElementById('myChart').getContext('2d'), {
            type: 'bar',
            data: {
                labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                datasets: [
                    {
                        label: '전체도시의 평균충전량',
                        type: 'line',
                        data: avglowchartList,
                        backgroundColor: 'rgb(129,229,82)',
                        borderColor: 'rgb(129,229,82)',
                        fill: false,
                        steppedLine: true,
                    },
                    {
                        label: '선택도시의 완속 충전기 누적 충전량',
                        type: 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
                        backgroundColor: 'rgb(118,158,252)',
                        borderColor: 'rgb(118,158,252)',
                        data: seoullowchartList,
                    }
                ]
            },
            options: {
                legend: {
                    labels: {
                        fontColor: 'black' // label color
                    }
                },
                scales: {
                    // y축
                    yAxes: [{
                        stacked: true,
                        ticks: {
                        	min:0,
                        	max:48,
                            fontColor: 'black' // y축 폰트 color
                        },
                        scaleLabel: {
                            display: true,
                            labelString: '평균충전량'
                        }
                    }],
                    // x축
                    xAxes: [{
                        stacked: true,
                        ticks: {
                            fontColor: 'black' // x축 폰트 color
                        },
                        scaleLabel: {
                            display: true,
                            labelString: '서울의 완속 충전기 누적 충전량'
                        }
                    }]
                },
                responsive: false, //반응형 웹페이지
                interaction: {
                    intersect: false,
                    axis: 'x'
                },
                plugins: {
                    title: {
                        display: true,
                        text: (ctx) => 'Step ' + ctx.chart.data.datasets[0].stepped + ' Interpolation',
                    }
                }
            }
        });
    </script>
    <script>
  //서울 급속//
     let seoulfastchartList = [];    
  //BigDecimal[] dataList=new BigDecimal[fast.size()]; 
    //for(int i=0; i<fast.size(); i++){ 
   
       seoulfastchartList.push(<%=fast.get(0).getOne_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getTwo_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getTree_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getFour_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getFive_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getSix_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getSeven_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getEight_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getNine_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getTen_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getEleven_week_charge()%>);
       seoulfastchartList.push(<%=fast.get(0).getTwelve_week_charge()%>);
       </script>
    <script>
    let busanfastchartList = [];
    //부산 급속//
	busanfastchartList.push(<%=fast.get(1).getOne_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getTwo_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getTree_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getFour_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getFive_week_charge()%>); 
    busanfastchartList.push(<%=fast.get(1).getSix_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getSeven_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getEight_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getNine_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getTen_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getEleven_week_charge()%>);
    busanfastchartList.push(<%=fast.get(1).getTwelve_week_charge()%>);

    </script>
    <script>
    let daegufastchartList = [];
    
    daegufastchartList.push(<%=fast.get(2).getOne_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getTwo_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getTree_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getFour_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getFive_week_charge()%>); 
    daegufastchartList.push(<%=fast.get(2).getSix_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getSeven_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getEight_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getNine_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getTen_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getEleven_week_charge()%>);
    daegufastchartList.push(<%=fast.get(2).getTwelve_week_charge()%>);
    </script>
    <script>
    let incheonfastchartList = [];
    
    incheonfastchartList.push(<%=fast.get(3).getOne_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getTwo_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getTree_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getFour_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getFive_week_charge()%>); 
    incheonfastchartList.push(<%=fast.get(3).getSix_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getSeven_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getEight_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getNine_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getTen_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getEleven_week_charge()%>);
    incheonfastchartList.push(<%=fast.get(3).getTwelve_week_charge()%>);
    </script>
    <script>
    let gwangjufastchartList=[];
    
    gwangjufastchartList.push(<%=fast.get(4).getOne_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getTwo_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getTree_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getFour_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getFive_week_charge()%>); 
    gwangjufastchartList.push(<%=fast.get(4).getSix_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getSeven_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getEight_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getNine_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getTen_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getEleven_week_charge()%>);
    gwangjufastchartList.push(<%=fast.get(4).getTwelve_week_charge()%>);
    </script>
    <script>
    let daejeonfastchartList=[];
    
    daejeonfastchartList.push(<%=fast.get(5).getOne_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getTwo_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getTree_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getFour_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getFive_week_charge()%>); 
    daejeonfastchartList.push(<%=fast.get(5).getSix_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getSeven_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getEight_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getNine_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getTen_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getEleven_week_charge()%>);
    daejeonfastchartList.push(<%=fast.get(5).getTwelve_week_charge()%>);
    </script>
    <script>
    let ulsanfastchartList = [];
    
    ulsanfastchartList.push(<%=fast.get(6).getOne_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getTwo_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getTree_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getFour_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getFive_week_charge()%>); 
    ulsanfastchartList.push(<%=fast.get(6).getSix_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getSeven_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getEight_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getNine_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getTen_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getEleven_week_charge()%>);
    ulsanfastchartList.push(<%=fast.get(6).getTwelve_week_charge()%>);
    
    </script>
    
    <script>
    let sejongfastchartList = [];
    
    sejongfastchartList.push(<%=fast.get(7).getOne_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getTwo_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getTree_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getFour_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getFive_week_charge()%>); 
    sejongfastchartList.push(<%=fast.get(7).getSix_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getSeven_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getEight_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getNine_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getTen_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getEleven_week_charge()%>);
    sejongfastchartList.push(<%=fast.get(7).getTwelve_week_charge()%>);
    </script>
    
    <script>
    let gyeonggidofastchartList = [];
    
    gyeonggidofastchartList.push(<%=fast.get(8).getOne_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getTwo_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getTree_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getFour_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getFive_week_charge()%>); 
    gyeonggidofastchartList.push(<%=fast.get(8).getSix_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getSeven_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getEight_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getNine_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getTen_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getEleven_week_charge()%>);
    gyeonggidofastchartList.push(<%=fast.get(8).getTwelve_week_charge()%>);
    </script>
    <script>
     let GangwondofastchartList = [];
     
     GangwondofastchartList.push(<%=fast.get(9).getOne_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getTwo_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getTree_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getFour_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getFive_week_charge()%>); 
    GangwondofastchartList.push(<%=fast.get(9).getSix_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getSeven_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getEight_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getNine_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getTen_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getEleven_week_charge()%>);
    GangwondofastchartList.push(<%=fast.get(9).getTwelve_week_charge()%>);
    </script>
   <script>
    let ChungcheongbukdofastchartList =[];
    
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getOne_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getTwo_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getTree_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getFour_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getFive_week_charge()%>); 
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getSix_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getSeven_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getEight_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getNine_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getTen_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getEleven_week_charge()%>);
    ChungcheongbukdofastchartList.push(<%=fast.get(10).getTwelve_week_charge()%>);
    </script>
    <script>
    let CuhngcheongnamdofastchartList =[];
    
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getOne_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getTwo_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getTree_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getFour_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getFive_week_charge()%>); 
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getSix_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getSeven_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getEight_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getNine_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getTen_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getEleven_week_charge()%>);
    CuhngcheongnamdofastchartList.push(<%=fast.get(11).getTwelve_week_charge()%>);
    </script>
    <script>
    let JeollabukdofastchartList = [];
    
    JeollabukdofastchartList.push(<%=fast.get(12).getOne_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getTwo_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getTree_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getFour_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getFive_week_charge()%>); 
    JeollabukdofastchartList.push(<%=fast.get(12).getSix_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getSeven_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getEight_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getNine_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getTen_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getEleven_week_charge()%>);
    JeollabukdofastchartList.push(<%=fast.get(12).getTwelve_week_charge()%>);
    </script>
    <script>
    let JeollanamdofastchartList = [];
    
    JeollanamdofastchartList.push(<%=fast.get(13).getOne_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getTwo_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getTree_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getFour_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getFive_week_charge()%>); 
    JeollanamdofastchartList.push(<%=fast.get(13).getSix_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getSeven_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getEight_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getNine_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getTen_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getEleven_week_charge()%>);
    JeollanamdofastchartList.push(<%=fast.get(13).getTwelve_week_charge()%>);
    </script>
    <script>
    let GyeongsangbukdofastchartList = [];
    
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getOne_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getTwo_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getTree_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getFour_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getFive_week_charge()%>); 
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getSix_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getSeven_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getEight_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getNine_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getTen_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getEleven_week_charge()%>);
    GyeongsangbukdofastchartList.push(<%=fast.get(14).getTwelve_week_charge()%>);
    </script>
    <script>
    let GyeongsangnamdofastchartList = [];
    
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getOne_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getTwo_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getTree_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getFour_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getFive_week_charge()%>); 
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getSix_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getSeven_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getEight_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getNine_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getTen_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getEleven_week_charge()%>);
    GyeongsangnamdofastchartList.push(<%=fast.get(15).getTwelve_week_charge()%>);
    </script>
    <script>
    let jejufastchartList = []; 
    
    jejufastchartList.push(<%=fast.get(16).getOne_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getTwo_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getTree_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getFour_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getFive_week_charge()%>); 
    jejufastchartList.push(<%=fast.get(16).getSix_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getSeven_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getEight_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getNine_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getTen_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getEleven_week_charge()%>);
    jejufastchartList.push(<%=fast.get(16).getTwelve_week_charge()%>);
    </script>
    <!-- 급속 -->
    <script>
   	
        new Chart(document.getElementById('myChart2').getContext('2d'), {
            type: 'bar',
            
            data: {
            	
                labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                datasets: [
                    {
                        label: '전체도시의 평균충전량',
                        type: 'line',
                        data: avgfastchartList,
                        backgroundColor: 'rgb(129,229,82)',
                        borderColor: 'rgb(129,229,82)',
                        fill: false,
                        steppedLine: true,
                    },
                    {
                        label: '선택도시의 급속 충전기 누적 충전량',
                        type: 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
                        backgroundColor: 'rgb(254,122,112)',
                        borderColor: 'rgb(254,122,112)',
                        data: seoulfastchartList,
                    }
                ]
            },
            options: {
                legend: {
                    labels: {
                        fontColor: 'black' // label color
                    }
                },
                scales: {
                    // y축
                    yAxes: [{
                        stacked: true,
                        ticks: {
                        	min:0,
                        	max:48,
                            fontColor: 'black' // y축 폰트 color
                        },
                        scaleLabel: {
                            display: true,
                            labelString: '평균충전량'
                        }
                    }],
                    // x축
                    xAxes: [{
                        stacked: true,
                        ticks: {
                            fontColor: 'black' // x축 폰트 color
                        },
                        scaleLabel: {
                            display: true,
                            labelString: '서울의 급속 충전기 누적 충전량'
                        }
                    }]
                },
                responsive: false, //반응형 웹페이지
                interaction: {
                    intersect: false,
                    axis: 'x'
                },
                plugins: {
                    title: {
                        display: true,
                        text: (ctx) => 'Step ' + ctx.chart.data.datasets[0].stepped + ' Interpolation',
                    }
                }
            }
        });
    </script>
    
      <script class="uichart">

        const el = document.getElementById('chart-area');
        const data = {
            series: [
                {
                    // name: 'Speed',
                    data: [80],
                },
            ],
        };
        const options = {
            chart: { title: '전국 대비 서울의 총 충전비율(%)', width: 300, height: 300 },
            series: {
                solid: true,
                dataLabels: { visible: true, offsetY: -30, formatter: (value) => `${value}%` },
            },
            theme: {
                circularAxis: {
                    lineWidth: 0,
                    strokeStyle: 'rgba(0, 0, 0, 0)',
                    tick: {
                     	lineWidth: 0,
                        strokeStyle: 'rgba(0, 0, 0, 0)',
                    },
                    label: {
                        color: 'rgba(0, 0, 0, 0)',
                    },
                },
                series: {
                    dataLabels: {
                        fontSize: 25,
                        fontFamily: 'Impact',
                        fontWeight: 100,
                        color: 'grey',
                        textBubble: {
                            visible: false,
                        },
                    },
                },
            },
        };

        const chart_test = toastui.Chart.gaugeChart({ el, data, options });
    </script>
</body>
</html>