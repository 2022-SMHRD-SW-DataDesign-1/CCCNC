<%@page import="com.plugspot.model.MemberDTO"%>
<%@page import="com.plugspot.model.chargePercentDTO"%>
<%@page import="com.plugspot.model.chargePercentDAO"%>
<%@page import="com.plugspot.model.kakaoDTO"%>
<%@page import="com.plugspot.model.kakaoDAO"%>
<%@page import="com.plugspot.model.carnumDTO"%>
<%@page import="com.plugspot.model.carnumDAO"%>
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
body{
	margin:0;
}
.t11{
	display: inline;
	width: 31%;
	float:left;
	margin-top: 3%;
	margin-left: 9%;
	border:0;
}

.t22 {
	display: inline;
	width: 31%;
	float:left;
	margin-top: 3%;
    margin-left: 5%;
    border:0;
}
/* Header */
.header {
	width: 80.5%;
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
	margin-left: 81%;
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

.home, .login, .logout, .mypage {
	background-color: white;
	border: 0px;
	float: left;
	width: 80px;
	height: 35px !important;
	line-height: 35px !important;
	border-right: 1px solid #D3D3D3;
	text-align: center;
	margin: 0 auto;
	color: #686868;
}

.logout, .mypage {
	width: 100px;
}

.home:hover {
	display: block;
	color: #686868;
	text-align: center;
	font-size: 20px !important;
	cursor: pointer;
}

.login:hover {
	display: block;
	color: #686868;
	text-align: center;
	font-size: 20px !important;
	cursor: pointer;
}

.logout:hover {
	display: block;
	color: #686868;
	text-align: center;
	font-size: 20px !important;
	cursor: pointer;
}

.mypage:hover {
	display: block;
	color: #686868;
	text-align: center;
	font-size: 20px !important;
	cursor: pointer;
}
/* content {
	float: left;
	width: 1509px;
	height: 100%;
	margin-left: 10%;
	margin-right: 10%;
} */
content{
    float: left;
    width: 100%;
    height: 1200px;
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
	width: 300px;
    height: 150px;
    margin-top: -25%;
}
#chart-area2 {
	display: block;
	width: 300px;
    height: 150px;
	margin-top: 1%;
}
/* select {
	background-color: rgb(4,220,87);
	
} */
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
	float:left;
	margin-left: 4%;
    margin-top: 25%;
}
.t1 {
	display: inline;
	border-radius: 5%;
	float: left;
	margin-top: 16%;
	text-align: center;
	border: 0;
}
.t2 {
	display: inline;
	border-radius: 5%;
	float: left;
	margin-top: 16%;
	text-align: center;
	border: 0;
}
h3 {
	text-align: left;
	margin-left: 12%;
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
	width: 553px;
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
	position : absolute;
	bottom : 0;
}
</style>
</head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="https://pandameister.github.io/chartjs-chart-radial-gauge/docs/js/Chart.RadialGauge.umd.js"></script>
<body>

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

kakaoDAO citydao = new kakaoDAO();
ArrayList<kakaoDTO> citylist = citydao.kakao();
int citydata = Integer.parseInt(request.getParameter("citydata"));
BigDecimal inCenterLatitude=null;
BigDecimal inCenterLongitude=null;
String inCenterName="";

for(int i=0;i<citylist.size();i++){
	if(citylist.get(i).getLoc_seq().intValue()==(citydata)){
		inCenterLatitude = citylist.get(i).getCity_latitude();
		inCenterLongitude = citylist.get(i).getCity_longitude();
		inCenterName = citylist.get(i).getDo_city();
	}
}

chargePercentDAO percentdao = new chargePercentDAO();
ArrayList<chargePercentDTO> pt_list=percentdao.chargePercent();

String inPercentName="";
BigDecimal inPercent=null;
for(int i=0;i<pt_list.size();i++){
	if(pt_list.get(i).getLoc_seq().intValue()==(citydata)){
		inPercentName = pt_list.get(i).getDo_city();
		inPercent = pt_list.get(i).getPercent();
	}
}
%>
	<header class="header">
		<div class="head">
			<div class="logo">
				<a href="Main.jsp"> <img src="./img/Logo.png" alt="PlugSpot"
					class="logo"></a>
			</div>
		</div>
		<!-- head 끝  -->
		<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		%>
		<div class="topMenu">
			<div class="clear">
				<form action="LogoutService" method="post">
					<%
					if (info == null) {
					%>
					<li><a href="Main.jsp"><input type="button" class="home"
							value="HOME"></a>
					<a href="Login.jsp"><input type="button" class="login"
							value="LOGIN"></a></li>
					<%
					} else {
					%>
					<li><a href="Main.jsp"><input type="button" class="home"
							value="HOME"></a>
					<a href="Mypage.jsp"><input type="button"
							class="mypage" value="MYPAGE"></a>
					<a href="Main.jsp"><input type="submit" class="logout"
							value="LOGOUT"></a></li>
					<%
					}
					%>
				</form>
			</div>
		</div>
		<!-- topMenu 끝 -->
	</header>

	
<!-- ============================================================================================ -->
<fieldset class="t11">
	<fieldset class="t1" style="display:inline;margin-top: 0px;width: 200px;height: 300px;">
		<h3><%=inCenterName %></h3>
		<div>
	    	<div id="staticMap" style="width: 260px; height: 230px; box-shadow: 0 10px 20px rgb(0 0 0 / 19%), 0 6px 6px rgb(0 0 0 / 23%); margin-left: 9%;"></div>
		</div>
	</fieldset>
	
    <div id="canvas-holder" style="width: 40%">
    	<canvas id="chart-area"></canvas>
    </div>
	
	<div style="height:100%; width:100%;">
	       <canvas id="myChart"></canvas>
	       <canvas id="myChart2"></canvas>
	</div>
</fieldset>

<select id="city" name="city" onchange="changeCitySelect()"  border-radius: 30px;">
	<% 
	int index_list[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 49, 57, 68, 83, 97, 130, 142, 159};
	
	for(int j=0;j<index_list.length;j++){	
		for(int i=0;i<citylist.size();i++){ 
		%>
		<%if(citylist.get(i).getLoc_seq().intValue()==index_list[j]){ %>
		<option value=<%=citylist.get(i).getLoc_seq()%>> <%=citylist.get(i).getDo_city() %>
	<%}}} %>	
</select>

<fieldset class="t22">
	<fieldset class="t1" style="display:inline;margin-top: 0px;width: 200px;height: 300px;">
		<h3 id=selectTitle>서울시</h3>
		<div >
	    	<div id="staticMap2" style="width: 260px; height: 230px; box-shadow: 0 10px 20px rgb(0 0 0 / 19%), 0 6px 6px rgb(0 0 0 / 23%); margin-left: 9%;""></div>
		</div>
	</fieldset>
	
	<div id="canvas-holder2" style="width: 40%">
		<canvas id="chart-area2"></canvas>
	</div>
	
	<div style="height:100%; width:100%;">
	       <canvas id="myChart3"></canvas>
	       <canvas id="myChart4"></canvas>
	</div>
</fieldset>
<footer class="footer">
		<div class="foot" style="margin-top:2%; margin-left:0.5%;">
			<!-- foot 시작 -->
			<div class="f_logo">
				<img src="./img/FootLogo.png" alt="PlugSpot" style=" width: 190px; height: 44px;">
			</div>
			<span class="t">|</span> <span>개인정보처리방침</span >
			<span class="t">|</span> <span class="m mar_l5">고객센터 1234-5678</span>
			<p class="mar_t5">
				사업자번호: 111-222-3333 &nbsp;&nbsp; 대표자: 쿠쿠뉴쿠 &nbsp;&nbsp;주소: 광주광역시 남구
				송암로 60 광주CGI센터 2층<br> Copyright@2022 PlugSpot. All Rights
				Reserved
			</p>
		</div>
	</footer>




<script> //1. 지도용
var mapContainer = document.getElementById('staticMap'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(<%=inCenterLatitude%>, <%=inCenterLongitude%>), // 지도의 중심좌표
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
    marker.setMap(map)
}
</script>

<script> //2. 지도용
var mapContainer2 = document.getElementById('staticMap2'), // 지도를 표시할 div  
mapOption2 = { 
    center: new kakao.maps.LatLng(<%=citylist.get(0).getCity_latitude()%>, <%=citylist.get(0).getCity_longitude()%>), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};

var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
let positions2 = [];
<% for(CityChargeDTO ccd : station){%> 
	positions2.push({
	    title: '<%= ccd.getCharge_state_name()%>' , 
	    latlng: new kakao.maps.LatLng(<%= ccd.getLatitude()%>,<%= ccd.getLongitude()%>)
	});
<%}%>

var marker2, i2; 
for (var i2 = 0; i2 < positions2.length; i2 ++) {
	var imageSrc2 = 'marker/chargelogo.png', imageSize2 = new kakao.maps.Size(25, 25); 
	var imageOption2 = {
			offset : new kakao.maps.Point(9,9)
	};										
	var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2,imageOption2);
    
    var marker2 = new kakao.maps.Marker({
        map: map2, // 마커를 표시할 지도
        position: positions2[i2].latlng,
        title : positions2[i2].title,
        image : markerImage2 // 마커 이미지 
    });
    marker.setMap(map2)
}
</script>




 <script>//1. 게이지그래프용

 Chart.defaults.global.defaultFontFamily = "Verdana";
 var ctx = document.getElementById("chart-area").getContext("2d");
 var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
 gradientStroke.addColorStop(0, "rgb(45,204,106");  //차트색깔
 //gradientStroke.addColorStop(1, "#F49080");  //차트색깔
 var config = {
     type: "radialGauge",
     data: {
         labels: ["Metrics"],
         datasets: [
             {
                 data: [<%=inPercent%>],
                 backgroundColor: [gradientStroke],
                 borderWidth: 0,
                 label: "Score"
             }
         ]
     },
     options: {
         responsive: false,
         legend: {},
         title: {
             display: true,
             text: "전국 대비 <%=inPercentName%>의 총 충전비율"
         },
         centerPercentage: 80
     }
 };
     var ctx = document.getElementById("chart-area").getContext("2d");
     window.myRadialGauge = new Chart(ctx, config);
</script>


 <script>
    var ctx = document.getElementById("chart-area2").getContext("2d");
    var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
    gradientStroke.addColorStop(0, "rgb(45,204,106");
    var config2 = {
        type: "radialGauge",
        data: {
            labels: ["Metrics"],
            datasets: [
                {
                    data: [<%=pt_list.get(0).getPercent()%>],
                    backgroundColor: [gradientStroke],
                    borderWidth: 0,
                    label: "Score"
                }
            ]
        },
        options: {
            responsive: false,
            legend: {},
            title: {
                display: true,
                text: "전국 대비 해당도시의 총 충전비율"
            },
            centerPercentage: 80
        }
    };
        var ctx2 = document.getElementById("chart-area2").getContext("2d");
        window.myRadialGauge2 = new Chart(ctx2, config2);
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

<% 

ArrayList<BigDecimal> inFastList = new ArrayList<BigDecimal>();
ArrayList<BigDecimal> inSlowList = new ArrayList<BigDecimal>();
for(int i=0;i<index_list.length;i++){
	if(citydata==index_list[i]){
		inFastList.add(fast.get(i).getOne_week_charge());
		inFastList.add(fast.get(i).getTwo_week_charge());
		inFastList.add(fast.get(i).getTree_week_charge());
		inFastList.add(fast.get(i).getFour_week_charge());
		inFastList.add(fast.get(i).getFive_week_charge());
		inFastList.add(fast.get(i).getSix_week_charge());
		inFastList.add(fast.get(i).getSeven_week_charge());
		inFastList.add(fast.get(i).getEight_week_charge());
		inFastList.add(fast.get(i).getNine_week_charge());
		inFastList.add(fast.get(i).getTen_week_charge());
		inFastList.add(fast.get(i).getEleven_week_charge());
		inFastList.add(fast.get(i).getTwelve_week_charge());
		
		inSlowList.add(low.get(i).getOne_week_charge());
		inSlowList.add(low.get(i).getTwo_week_charge());
		inSlowList.add(low.get(i).getTree_week_charge());
		inSlowList.add(low.get(i).getFour_week_charge());
		inSlowList.add(low.get(i).getFive_week_charge());
		inSlowList.add(low.get(i).getSix_week_charge());
		inSlowList.add(low.get(i).getSeven_week_charge());
		inSlowList.add(low.get(i).getEight_week_charge());
		inSlowList.add(low.get(i).getNine_week_charge());
		inSlowList.add(low.get(i).getTen_week_charge());
		inSlowList.add(low.get(i).getEleven_week_charge());
		inSlowList.add(low.get(i).getTwelve_week_charge());
	}
}	
%>


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
                        backgroundColor: 'rgb(246,185,59)',
                        borderColor: 'rgb(246,185,59)',
                        data: <%=inSlowList%>,
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
                            labelString: '<%=inPercentName%>의 완속 충전기 누적 충전량'
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
                        backgroundColor: 'rgb(45,152,218)',
                        borderColor: 'rgb(45,152,218)',
                        data: <%=inFastList%>,
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
                            labelString: '<%=inPercentName%>의 급속 충전기 누적 충전량'
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

    var myChart3 = new Chart(document.getElementById('myChart3').getContext('2d'), {
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
                        backgroundColor: 'rgb(246,185,59)',
                        borderColor: 'rgb(246,185,59)',
                        data: <%=inSlowList%>,
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
                            labelString: '해당도시의 완속 충전기 누적 충전량'
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
 
    </script>
    <!-- 급속 -->
    <script>
   	
        var myChart4 = new Chart(document.getElementById('myChart4').getContext('2d'), {
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
                        backgroundColor: 'rgb(45,152,218)',
                        borderColor: 'rgb(45,152,218)',
                        data: <%=inFastList%>,
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
                            labelString: '해당도시의 급속 충전기 누적 충전량'
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
    <!-- 셀렉트 선택시 이벤트 -->
<script>
var setPercentName="서울시";
var setPercent=0;
	function changeCitySelect(){
		var citySelect = document.getElementById("city");
		
		var selectValue = citySelect.options[citySelect.selectedIndex].value;
		console.log(selectValue);
		var Lat=0;
		var Lng=0;
		<%for(int i=0;i<citylist.size();i++){%>
			if(selectValue==<%=citylist.get(i).getLoc_seq()%>){
				Lat=<%=citylist.get(i).getCity_latitude()%>
				Lng=<%=citylist.get(i).getCity_longitude()%>
				document.getElementById("selectTitle").innerHTML='<%=citylist.get(i).getDo_city()%>'
			}
		<% }%>
		
		
		var moveLatLon = new kakao.maps.LatLng(Lat,Lng);
		map2.setCenter(moveLatLon);
		
		//게이지 차트용

		<%
		for(int i=0;i<pt_list.size();i++){%>
			if(selectValue==<%=pt_list.get(i).getLoc_seq().intValue()%>){
				setPercentName = '<%=pt_list.get(i).getDo_city()%>';
				setPercent = <%=pt_list.get(i).getPercent()%>;
			}
		<%}%>
		console.log(setPercent,setPercentName);
		
		
		config2.data.datasets.forEach(function(dataset) {
			  dataset.data = dataset.data.map(function() {
			   return setPercent;
			  });
			 });
		console.log(ctx2);
		
		window.myRadialGauge2.update();
		
		
		
		//바차트용
<%-- <%		ArrayList<BigDecimal> setFastList = new ArrayList<BigDecimal>();
		ArrayList<BigDecimal> setSlowList = new ArrayList<BigDecimal>();%> --%>
		
		var setFastList=[];
		var setSlowList=[];
		<%for(int i=0;i<index_list.length;i++){%>
			if(selectValue==<%=index_list[i]%>){
				console.log(selectValue,<%=index_list[i]%>);
			  	setFastList.push(<%=(fast.get(i).getOne_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getTwo_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getTree_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getFour_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getFive_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getSix_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getSeven_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getEight_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getNine_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getTen_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getEleven_week_charge())%>);
				setFastList.push(<%=(fast.get(i).getTwelve_week_charge())%>);
				
				setSlowList.push(<%=(low.get(i).getOne_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getTwo_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getTree_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getFour_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getFive_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getSix_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getSeven_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getEight_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getNine_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getTen_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getEleven_week_charge())%>);
				setSlowList.push(<%=(low.get(i).getTwelve_week_charge())%>);
				
				console.log(selectValue,setFastList);
				console.log(selectValue,setSlowList);

			}
		<%}%>
		
		myChart3.data.datasets[1].data=setSlowList; 
		myChart4.data.datasets[1].data=setFastList; 
 		myChart3.update();
		myChart4.update();
		
		
		
	}
</script>

</body>
</html>