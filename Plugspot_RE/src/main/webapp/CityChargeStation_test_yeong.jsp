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

<meta charset="utf-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script
	src="https://pandameister.github.io/chartjs-chart-radial-gauge/docs/js/Chart.RadialGauge.umd.js"></script>
<!-- <script src="https://pandameister.github.io/-chart-radial-gauge/dochartjscs/samples/utils.js"></script> -->


<title>Document</title>
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


<body>
	<%CityChargeDAO dao = new CityChargeDAO();
	ArrayList<CityChargeDTO> station = dao.station();
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

		<fieldset class="t1" style="border:0px;">
			<h3>서울</h3>
			<div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ce79007cc7dd52019d1824cc7d87f18"></script>
				<div id="staticMap" style="width: 260px; height: 230px;"></div>
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

			</div>

		</fieldset>

		<!-- guage chart---------------------------------------------------------- -->
		<div id="canvas-holder" style="width: 40%">
			<canvas id="chart-area"></canvas>
		</div>
		<!-- <button id="randomizeData">Randomize Data</button> -->

		<script>
                var randomScalingFactor = function () {
                    return Math.round(Math.random() * 100);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                };
        
                Chart.defaults.global.defaultFontFamily = "Verdana";
        
                var ctx = document.getElementById("chart-area").getContext("2d");
                var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
                gradientStroke.addColorStop(0, "rgb(45,204,106");  //차트색깔
                //gradientStroke.addColorStop(1, "#f49080");  //차트색깔
        
                var config = {
                    type: "radialGauge",
                    data: {
                        labels: ["Metrics"],
                        datasets: [
                            {
                                data: [50],
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
                            text: "전국 대비 서울의 총 충전비율"
                        },
                        centerPercentage: 80
                    }
                };
        
                 
                    var ctx = document.getElementById("chart-area").getContext("2d");
                    window.myRadialGauge = new Chart(ctx, config);
                
            </script>

		<br>

		<!-- 완속 -->

		<div>
			<canvas id="myChart"></canvas>
			<canvas id="myChart2"></canvas>
		</div>

		<script class="bar1">

                new Chart(document.getElementById('myChart').getContext('2d'), {

                    type: 'bar',

                    data: {
                        labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                        datasets: [
                            {
                                label: '전체도시의 평균충전량',
                                type: 'line',
                                data: [13.6, 25.4, 21.5, 23.8, 35.8, 34.1, 30.8, 16.5, 14.2, 16.4, 26.4, 25.9],
                                backgroundColor: 'rgb(45,204,106)',
                                borderColor: 'rgb(45,204,106)',
                                fill: false,
                                steppedLine: true,
                            },
                            {
                                label: '선택도시의 완속 충전기 누적 충전량',
                                type: 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
                                data: [19.8, 17.5, 47.2, 26.5, 23.4, 13.5, 26.5, 14.5, 42.6, 23.5, 14.2, 36.4],
                                backgroundColor: 'rgb(240, 183, 49)',
                                borderColor: 'rgb(240, 183, 49)'
                            }
                        ]
                    },
                    options: {
                        legend: {
                            labels: {
                                fontColor: 'black', // label color

                            }
                        },
                        scales: {
                            // y축
                            yAxes: [{
                                stacked: true,
                                ticks: {
                                	min:0,
                                	max:50,
                                    fontColor: 'black', // y축 폰트 color
                                    fontSize: 8
                                },
                                scaleLabel: {
                                    display: true,
                                    labelString: '평균충전량',
                                }
                            }],
                            // x축
                            xAxes: [{
                                stacked: true,
                                ticks: {
                                    fontColor: 'black', // x축 폰트 color
                                    fontSize: 8
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


		<!-- 급속 -->
		<script class="bar2">
                new Chart(document.getElementById('myChart2').getContext('2d'), {

                    type: 'bar',

                    data: {
                        labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                        datasets: [
                            {
                                label: '전체도시의 평균충전량',
                                type: 'line',
                                data: [13.5, 15.8, 35.1, 42.5, 16.5, 26.9, 36.9, 38.4, 47.6, 34.5, 26.4, 12.8],
                                backgroundColor: 'rgb(45,204,106)',
                                borderColor: 'rgb(45,204,106)',
                                fill: false,
                                steppedLine: true,
                            },
                            {
                                label: '선택도시의 급속 충전기 누적 충전량',
                                type: 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
                                data: [25.4, 39.5, 30.2, 15.6, 14.3, 28.6, 16.9, 35.4, 16.9, 28.9, 27.4, 36],
                                backgroundColor: 'rgb(52, 172, 224)',
                                borderColor: 'rgb(52, 172, 224)'
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
                                	max:50,
                                    fontColor: 'black', // y축 폰트 color
                                    fontSize: 8

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
                                    fontColor: 'black', // x축 폰트 color
                                    fontSize: 8
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

	</div>
	<br>
	<div class="select_ct">
		<h4>* 급속/완속 충전량 비교할 지역을 선택하세요 .</h4>
		<select name="city" id="city">
			<option value="서울">서울</option>
			<option value="인천">인천</option>
			<option value="대전">대전</option>
			<option value="대구">대구</option>
			<option value="광주">광주</option>
			<option value="부산">부산</option>
			<option value="울산">울산</option>
			<option value="제주">제주</option>
		</select>
	</div>


	<!-- article2 ------------------------------------------------------------------------------------------------ -->
	<div class="article2">
		<fieldset class="t2">
			<h3>대전</h3>
			<div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ce79007cc7dd52019d1824cc7d87f18"></script>
				<div id="staticMap2" style="width: 260px; height: 230px;"></div>
				<script>
/* var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
    staticMapOption = {
        center: new kakao.maps.LatLng(37.514575, 127.04955559999999), // 이미지 지도의 중심좌표
        level: 10,
    };
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
 */
var mapContainer2 = document.getElementById('staticMap2'), // 지도를 표시할 div
mapOption2 = {
    center: new kakao.maps.LatLng(37.514575, 127.04955559999999), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};
var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
let positions2 = [];
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
			</div>
		</fieldset>

		<div id="canvas-holder2" style="width: 40%">
			<canvas id="chart-area2"></canvas>
		</div>

		<script>
                var randomScalingFactor = function () {
                    return Math.round(Math.random() * 100);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                };
        
        
                var ctx = document.getElementById("chart-area2").getContext("2d");
                var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
                gradientStroke.addColorStop(0, "rgb(45,204,106");
        
                var config2 = {
                    type: "radialGauge",
                    data: {
                        labels: ["Metrics"],
                        datasets: [
                            {
                                data: [40],
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
                            text: "전국 대비 대전의 총 충전비율"
                        },
                        centerPercentage: 80
                    }
                };
        
                 
                    var ctx2 = document.getElementById("chart-area2").getContext("2d");
                    window.myRadialGauge2 = new Chart(ctx2, config2);
                 

            </script>


		<br>

		<!-- 완속 -->

		<div>
			<canvas id="myChart3"></canvas>
			<canvas id="myChart4"></canvas>
		</div>
		<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->

		<script class="bar3">

                new Chart(document.getElementById('myChart3').getContext('2d'), {

                    // The type of chart we want to create
                    type: 'bar',


                    // The data for our dataset
                    data: {
                        labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                        datasets: [
                            {
                                label: '전체도시의 평균충전량',
                                type: 'line',
                                data: [42.1, 24.5, 13.6, 15.51, 16.34, 12.4, 26.8, 34.6, 28.9, 36.7, 16.5, 15.4],
                                backgroundColor: 'rgb(45,204,106)',
                                borderColor: 'rgb(45,204,106)',
                                fill: false,
                                steppedLine: true,
                            },
                            {
                                label: '선택도시의 완속 충전기 누적 충전량',
                                type: 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
                                data: [12.4, 28.9, 34.6, 13.6, 29.5, 27.9, 35.6, 27.9, 25.1, 26.1, 35.64, 22.56],
                                backgroundColor: 'rgb(240, 183, 49)',
                                borderColor: 'rgb(240, 183, 49)'
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
                                	max:50,
                                    fontColor: 'black', // y축 폰트 color
                                    fontSize: 8
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
                                    fontColor: 'black', // x축 폰트 color
                                    fontSize: 8
                                },
                                scaleLabel: {

                                    display: true,
                                    labelString: '대전의 완속 충전기 누적 충전량'
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




		<!-- 급속 -->
		<script class="bar4">
                new Chart(document.getElementById('myChart4').getContext('2d'), {

                    // The type of chart we want to create
                    type: 'bar',


                    // The data for our dataset
                    data: {
                        labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                        datasets: [
                            {
                                label: '전체도시의 평균충전량',
                                type: 'line',
                                data: [31.5, 30.6, 12.65, 24.9, 34.8, 23.4, 33.5, 46.5, 42.1, 26.5, 26.9, 13.5],
                                backgroundColor: 'rgb(45,204,106)',
                                borderColor: 'rgb(45,204,106)',
                                fill: false,
                                steppedLine: true,
                            },
                            {
                                label: '선택도시의 급속 충전기 누적 충전량',
                                type: 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
                                backgroundColor: 'rgb(52, 172, 224)',
                                borderColor: 'rgb(52, 172, 224)',
                                data: [23.6, 12.4, 24.5, 36.7, 39.5, 26.8, 13.5, 19.5, 38.4, 18.3, 12.5, 28.9]

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
                            		max:50,
                                    fontColor: 'black', // y축 폰트 color
                                    fontSize: 8
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
                                    fontColor: 'black', // x축 폰트 color
                                    fontSize: 8
                                },
                                scaleLabel: {
                                    display: true,
                                    labelString: '대전의 급속 충전기 누적 충전량'
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

	</div>
	</content>

	<footer class="footer">
		<!-- foot 시작 -->
		<div class="f_logo">
			<img src="./img/FootLogo.png" alt="PlugSpot"
				style="width: 190px; height: 35px;">
		</div>
		<span class="t">|</span> <span style="color: black;">개인정보처리방침</span>
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