<%@page import="com.plugspot.model.citySpeedChargerDAO"%>
<%@page import="com.plugspot.model.chargerAvgNumDTO"%>
<%@page import="com.plugspot.model.citySpeedChargerDTO"%>
<%@page import="com.plugspot.model.chargerAvgNumDAO"%>
<%@page import="com.plugspot.model.carnumDTO"%>
<%@page import="com.plugspot.model.carnumDAO"%>
<%@page import="com.plugspot.model.kakaoDTO"%>
<%@page import="com.plugspot.model.kakaoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.RankDTO"%>
<%@page import="java.net.http.HttpClient.Redirect"%>
<%@page import="com.plugspot.model.MemberDTO"%>
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
	text-align: center;
	border: 0px;
}
body{
	margin-top: 0px;
}
/* Header */
.header {
	width: 89.5%;
	padding-top: 10px !important;
	height: 8% !important;
	position: fixed;
	z-index: 999;
    margin-top: 0px;
    background-color: white;
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
/* content */
.content {
	float: left;
	width: 100%;
	height: 1270px;
	margin-left: 8%;
	margin-right: 8%;
	margin-top: 2.5%;
}

.in_content {
	padding: 30px 0 0;
	position: relative;
	top: 300px;
	width: 100% /* margin-left: 30px; */
}

.abs {
	right: 0;
	top: 0;
	font-size: 14px;
	color: #666;
	font-weight: normal;
	float: right;
}

.left_cont {
	float: left;
	width: 700px;
}

.right_cont {
	float: right;
	width: 700px;
}

canvas.barchart2 {
	width: 100%;
	height: 300px;
}

.areMap {
	width: 100%;
}

.title {
	text-align: center;
}
/* Footer */
footer {
	/* clear: both; */
	width: 100%;
	font-family:;
	font-weight: 50px;
	height: 10%; /* footer의 높이 */
	position: absolute;
	left: 0;
	margin-top: 200px;
}

li {
	list-style: none;
}

#li_1 {
	float: left;
	width: 26%;
	heigt: 70%;
	padding-right: 1%;
}

#li_2 {
	float: left;
	width: 39%;
	height: 70%;
	padding-right: 1%;
}

#li_3 {
	float: left;
	width: 14%;
	height: 70%;
	padding-right: 1%;
}

#li_4 {
	float: right;
	width: 100%;
	height: 300px;
	margin-top: 10px;
}

.info_table02 {
	text-align: center;
}

.content .banner {
	/* background: url(./img/banner2.png) no-repeat;*/
	background-position: center;
	text-align: center;
	background-size: cover !important;
}

.banner img {
	width: 79%;
}

td {
	padding-bottom: 5px;
}

.clear li {
	background-color: fff !important;
}

.h5_title1, .h5_title2 {
	position: relative;
	font-size: 18px;
	color: #003073;
	line-height: 120%;
	font-weight: 700;
	padding-left: 19px;
	margin: 30px 0 -32px;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=clusterer"></script>

<body style="height: 1560px;">
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
							value="HOME"></a></li>
					<li><a href="Login.jsp"><input type="button" class="login"
							value="LOGIN"></a></li>
					<%
					} else {
					%>
					<li><a href="Main.jsp"><input type="button" class="home"
							value="HOME"></a></li>
					<li><a href="Mypage.jsp"><input type="button"
							class="mypage" value="MYPAGE"></a></li>
					<li><a href="Main.jsp"><input type="submit" class="logout"
							value="LOGOUT"></a></li>
					<%
					}
					%>
				</form>
			</div>
		</div>
		<!-- topMenu 끝 -->
	</header>

	<div class="content">
		<div class="banner"
			style="position: absolute; top: 100px; left: 0px; width: 100%; z-index: 0; backface-visibility: hidden;">
			<img src="./img/banner.png" alt="배너">
		</div>
		<div class="in_content">
			<%
			ArrayList<RankDTO> ranklist = (ArrayList) session.getAttribute("ranklist");
			if (ranklist == null) {
				response.sendRedirect("rankService");
				System.out.print("rankService");
			} else {
				System.out.println("메인으로 출력테스트" + ranklist.get(0).getDo_city());
			}
			%>
			<!-----------------------------------------카카오맵포화도--------------------------------->
			<form action="kakaoService" method="post">
				<ul>
					<li id="li_0">
					<li id="li_1">
						<div id="city">
							<div id="map2" style="width: 100%; height: 430px;"></div>
						</div>
						<div id="barChart">
							<canvas id="chart" class="barchart2"></canvas>
						</div>
					</li>
					<li id="li_2">
						<div id="nation">
							<div id="map" style="width: 720px; height: 560px;"></div>
						</div>
						<div id="satu">
							<iframe src="./Saturation.jsp" frameborder="0px;" scrolling="yes"
								style="display: block; height: 20%; width: 100%"></iframe>
						</div>
					</li>

					<li id="li_3">
						<div id="rank">
							<div class="ranking">
								<table class="info_table02">
									<!--<caption class="title">전기차 지역별 순위</caption>-->
									<thead>
										<tr style="background-color: #74b9ff; color: #dfe4ea;">
											<th style="width: 52px;">순위</th>
											<th>도시</th>
											<th style="width: 172px;">전기차등록수</th>
										</tr>
									</thead>
									<%
									if (ranklist != null) {
									%>
									<%
									for (int i = 0; i < ranklist.size(); i++) {
									%>
									<tbody style="height: 100%">
										<tr>
											<th><span class="zone"><%=i + 1%></span></th>
											<td style="width: 263px; height: 100%"><%=ranklist.get(i).getDo_city()%></td>
											<td style="width: 170px; height: 100%"><%=ranklist.get(i).getCar_num()%></td>
										</tr>
									</tbody>
									<%
									}
									}
									%>
								</table>
							</div>
						</div>
					</li>
					</li>

					<!-- li_0 끝 -->

					<li id="li_4">
						<div id="content_bottom">
							<div id="lineChart">
								<h5 class="h5_title1"
									style="margin-bottom: 0%; margin-left: 16%;">지역별 충전기 수량</h5>
								<div class="chart-container">
									<canvas id="myChart" class="chart"
										style="width: 40%; height: 300px; float: left; padding-right: 5px; margin-top: 22px;"></canvas>
								</div>
							</div>

							<div id="barChart2">
								<h5 class="h5_title2"
									style="margin-top: -1%; padding-bottom: 2.8%; text-align: center; margin-right: 18%;">지역별
									평균 충전기 수량</h5>
								<div class="chart-container2">

									<canvas id="myChart3" class="bar-chart"
										style="width: 40%; height: 300px; float: left; padding-left: 5px;"> </canvas>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>
	<footer class="footer">
		<div class="foot">
			<!-- foot 시작 -->
			<div class="f_logo">
				<img src="./img/FootLogo.png" alt="PlugSpot"
					style="width: 190px; height: 44px;">
			</div>
			<span class="t">|</span> <span>개인정보처리방침</span> <span class="t">|</span>
			<span class="m mar_l5">고객센터 1234-5678</span>
			<p class="mar_t5" style="margin-top: 0px;">
				사업자번호: 111-222-3333 &nbsp;&nbsp; 대표자: 쿠쿠뉴쿠 &nbsp;&nbsp;주소: 광주광역시 남구
				송암로 60 광주CGI센터 2층<br> Copyright@2022 PlugSpot. All Rights
				Reserved
			</p>
		</div>
	</footer>
	<!----------------------------------------포화도표-------------------------------------->

	<!-----------------------------------------순위---------------------------------------->
	<%
	kakaoDAO dao = new kakaoDAO();
	ArrayList<kakaoDTO> list = dao.kakao();
	System.out.print(list.get(0).getSATURATION());
	int index_list[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 49, 57, 68, 83, 97, 130, 142, 159};
	ArrayList<kakaoDTO> list2 = new ArrayList();

	for (int i = 0; i < list.size(); i++) {
		for (int j = 0; j < index_list.length; j++) {
			if (index_list[j] == (list.get(i).getLoc_seq()).intValue()) {
		list2.add(list.get(i));
		System.out.print(list.get(i).getDo_city());
			}
		}
	}
	for (int k = 0; k < list2.size(); k++) {
		System.out.println(list2.get(k).getSATURATION());
	}
	%>
	<!-- =================================carnum==================================== -->

	<%
	carnumDAO cardao = new carnumDAO();
	ArrayList<carnumDTO> carlist = cardao.carnum();

	chargerAvgNumDAO avdao = new chargerAvgNumDAO();
	ArrayList<chargerAvgNumDTO> avlist = avdao.chargerAvgNum();

	citySpeedChargerDAO citdao = new citySpeedChargerDAO();
	ArrayList<citySpeedChargerDTO> cilist = citdao.citySpeedCharger();
	%>

	<!-- ============================================================================= -->


	<script>
		
                var chart = new Chart('chart', {
                    type: 'horizontalBar',
                    data: {
                        // labels: [],
                        datasets: [
                            {
                                data: [<%=carlist.get(0).getCar_num()%>],
                                backgroundColor: ['rgb(45,204,106)'],
                                label: '차량등록대수'
                            },
                            {
                                data: [<%=carlist.get(0).getDat_possible_car()%>],
                                backgroundColor: ['rgb(48,151,219)'],
                                label: '1일이용가능대수'
                            }
                        ]
                    },
                    options: {
                        legend: {
                            display: true,
                            position: 'bottom',
                            onClick: 'newLegendClickHandler'
                        },
                        responsive: false,
                        scales: {

                            xAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            </script>


	<script>
            var ctx = document.getElementById('myChart3');

            const config2 = {
                type: 'bar',
                data: {
                    labels: [ '<%=avlist.get(0).getDo_city()%>',
                    		  '<%=avlist.get(1).getDo_city()%>',
                    		  '<%=avlist.get(2).getDo_city()%>',
                    		  '<%=avlist.get(3).getDo_city()%>',
                    		  '<%=avlist.get(4).getDo_city()%>',
                    		  '<%=avlist.get(5).getDo_city()%>',
                    		  '<%=avlist.get(6).getDo_city()%>',
                    		  '<%=avlist.get(7).getDo_city()%>',
                    		  '<%=avlist.get(8).getDo_city()%>',
                    		  '<%=avlist.get(9).getDo_city()%>',
                    		  '<%=avlist.get(10).getDo_city()%>',
                    		  '<%=avlist.get(11).getDo_city()%>',
                    		  '<%=avlist.get(12).getDo_city()%>',
                    		  '<%=avlist.get(13).getDo_city()%>',
                    		  '<%=avlist.get(14).getDo_city()%>',
                    		  '<%=avlist.get(15).getDo_city()%>',
                    		  '<%=avlist.get(16).getDo_city()%>',
                    			],
                    datasets: [{
                        label: '완속',
                        backgroundColor: 'rgb(246, 185, 59)',
                        borderColor: 'rgb(246, 185, 59)',
                        data: [<%=avlist.get(0).getSlow()%>,
                        	   <%=avlist.get(1).getSlow()%>,
                        	   <%=avlist.get(2).getSlow()%>,
                        	   <%=avlist.get(3).getSlow()%>,
                        	   <%=avlist.get(4).getSlow()%>,
                        	   <%=avlist.get(5).getSlow()%>,
                        	   <%=avlist.get(6).getSlow()%>,
                        	   <%=avlist.get(7).getSlow()%>,
                        	   <%=avlist.get(8).getSlow()%>,
                        	   <%=avlist.get(9).getSlow()%>,
                        	   <%=avlist.get(10).getSlow()%>,
                        	   <%=avlist.get(11).getSlow()%>,
                        	   <%=avlist.get(12).getSlow()%>,
                        	   <%=avlist.get(13).getSlow()%>,
                        	   <%=avlist.get(14).getSlow()%>,
                        	   <%=avlist.get(15).getSlow()%>,
                        	   <%=avlist.get(16).getSlow()%>],
                    }, {                
                        label: '급속',
                        backgroundColor: 'rgb(45, 152, 218)',
                        borderColor: 'rgb(45, 152, 218)',
                        data: [<%=avlist.get(0).getFast()%>,
	                     	   <%=avlist.get(1).getFast()%>,
	                    	   <%=avlist.get(2).getFast()%>,
	                    	   <%=avlist.get(3).getFast()%>,
	                    	   <%=avlist.get(4).getFast()%>,
	                    	   <%=avlist.get(5).getFast()%>,
	                    	   <%=avlist.get(6).getFast()%>,
	                    	   <%=avlist.get(7).getFast()%>,
	                    	   <%=avlist.get(8).getFast()%>,
	                    	   <%=avlist.get(9).getFast()%>,
	                    	   <%=avlist.get(10).getFast()%>,
	                    	   <%=avlist.get(11).getFast()%>,
	                    	   <%=avlist.get(12).getFast()%>,
	                    	   <%=avlist.get(13).getFast()%>,
	                    	   <%=avlist.get(14).getFast()%>,
	                    	   <%=avlist.get(15).getFast()%>,
	                    	   <%=avlist.get(16).getFast()%>],
                    }]
                },
                options: {
                    legend: {
                        position: 'bottom',
                        fontSize: 10,
                        labels: {
                            fontColor: "black",
                            fontSize: 10
                        }
                    },
                    responsive: false,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'bottom',
                        },
                        title: {
                            display: true,
                            text: '시 별 충전소의 충전기 평균 개수'
                        },
                        scales: {
                            xAxes: [{
                                stacked: true,
                                ticks: {
                                    fontSize: 10,
                                    fontColor: 'black' // x축 폰트 color

                                },
                                scaleLabel: {
                                    display: true,
                                    fontSize: 10,
                                    labelString: ''
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    fontSize: 10,
                                    fontColor: 'black' // x축 폰트 color
                                },
                                scaleLabel: {
                                    display: true,
                                    fontSize: 10,
                                    labelString: '충전기 개수'
                                }
                            }]
                        }
                    }
                },


            };
            var myChart3 = new Chart(ctx, config2);


        </script>
	<script>
            const myChart3 = new Chart(document.getElementById('myChart3'),config);
        </script>

	<fieldset>

		<script>
            var ctx = document.getElementById('myChart');

            var config = {
                type: 'line',
                data: {
                    labels: ['<%=cilist.get(0).getDo_city()%>',
	                    	 '<%=cilist.get(1).getDo_city()%>', 
	                    	 '<%=cilist.get(2).getDo_city()%>', 
	                    	 '<%=cilist.get(3).getDo_city()%>', 
	                    	 '<%=cilist.get(4).getDo_city()%>', 
	                    	 '<%=cilist.get(5).getDo_city()%>', 
	                    	 '<%=cilist.get(6).getDo_city()%>', 
	                    	 '<%=cilist.get(7).getDo_city()%>', 
	                    	 '<%=cilist.get(8).getDo_city()%>', 
	                    	 '<%=cilist.get(9).getDo_city()%>', 
	                    	 '<%=cilist.get(10).getDo_city()%>', 
	                    	 '<%=cilist.get(11).getDo_city()%>', 
	                    	 '<%=cilist.get(12).getDo_city()%>', 
	                    	 '<%=cilist.get(13).getDo_city()%>', 
	                    	 '<%=cilist.get(14).getDo_city()%>',
	                    	 '<%=cilist.get(15).getDo_city()%>',
	                    	 '<%=cilist.get(16).getDo_city()%>', 
                    ],
                    datasets: [{
                        label: '완속',
                        backgroundColor: 'rgb(246, 185, 59)',
                        borderColor: 'rgb(246, 185, 59)',
                        fill: false,
                        lineTension: 0,
                        data: [
                        	 '<%=cilist.get(0).getSlow_charge()%>',
	                    	 '<%=cilist.get(1).getSlow_charge()%>', 
	                    	 '<%=cilist.get(2).getSlow_charge()%>', 
	                    	 '<%=cilist.get(3).getSlow_charge()%>', 
	                    	 '<%=cilist.get(4).getSlow_charge()%>', 
	                    	 '<%=cilist.get(5).getSlow_charge()%>', 
	                    	 '<%=cilist.get(6).getSlow_charge()%>', 
	                    	 '<%=cilist.get(7).getSlow_charge()%>', 
	                    	 '<%=cilist.get(8).getSlow_charge()%>', 
	                    	 '<%=cilist.get(9).getSlow_charge()%>', 
	                    	 '<%=cilist.get(10).getSlow_charge()%>', 
	                    	 '<%=cilist.get(11).getSlow_charge()%>', 
	                    	 '<%=cilist.get(12).getSlow_charge()%>', 
	                    	 '<%=cilist.get(13).getSlow_charge()%>', 
	                    	 '<%=cilist.get(14).getSlow_charge()%>',
	                    	 '<%=cilist.get(15).getSlow_charge()%>',
	                    	 '<%=cilist.get(16).getSlow_charge()%>', 
                        ],
                    }, {
                        label: '급속',
                        backgroundColor: 'rgb(45, 152, 218)',
                        borderColor: 'rgb(45, 152, 218)',
                        fill: false,
                        lineTension: 0,
                        data: [
                        	 '<%=cilist.get(0).getFast_charge()%>',
	                    	 '<%=cilist.get(1).getFast_charge()%>', 
	                    	 '<%=cilist.get(2).getFast_charge()%>', 
	                    	 '<%=cilist.get(3).getFast_charge()%>', 
	                    	 '<%=cilist.get(4).getFast_charge()%>', 
	                    	 '<%=cilist.get(5).getFast_charge()%>', 
	                    	 '<%=cilist.get(6).getFast_charge()%>', 
	                    	 '<%=cilist.get(7).getFast_charge()%>', 
	                    	 '<%=cilist.get(8).getFast_charge()%>', 
	                    	 '<%=cilist.get(9).getFast_charge()%>', 
	                    	 '<%=cilist.get(10).getFast_charge()%>', 
	                    	 '<%=cilist.get(11).getFast_charge()%>', 
	                    	 '<%=cilist.get(12).getFast_charge()%>', 
	                    	 '<%=cilist.get(13).getFast_charge()%>', 
	                    	 '<%=cilist.get(14).getFast_charge()%>',
	                    	 '<%=cilist.get(15).getFast_charge()%>',
	                    	 '<%=cilist.get(16).getFast_charge()%>',
                        ],
                    }]
                },
                options: {
                    legend: {
                        position: 'bottom',    // 라벨 폰트 색상,크기
                        labels: {
                            fontColor: "black",
                            fontSize: 10
                        }
                    },
                    // maintainAspectRatio: false,
                    responsive: false,
                    title: {
                        text: '시 별 급속/완속 충전기 개수'
                    },
                    scales: {
                        xAxes: [{
                            stacked: true,
                            ticks: {
                                fontSize: 10,
                                fontColor: 'black' // x축 폰트 color

                            },
                            scaleLabel: {
                                display: true,
                                fontSize: 10,
                                labelString: ''
                            }
                        }],
                        yAxes: [{
                            ticks: { /* min*0.0001, max*0.0001, */
                                fontSize: 10,
                                fontColor: 'black' // x축 폰트 color
                            },
                            scaleLabel: {
                                display: true,
                                fontSize: 10,
                                labelString: '충전기 개수'
                            }
                        }]
                    },
                }
            };
            var myChart = new Chart(ctx, config);

        </script>
		<script>
            const myChart = new Chart(document.getElementById('myChart'), config);
        </script>






		<script>
			var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
				center : new kakao.maps.LatLng(35.1083, 127.6358), // 지도의 중심좌표 
				level : 13
			});
			var clusterer = new kakao.maps.MarkerClusterer({
				map : map,
				averageCenter : true,
				minLevel : 12
			});
			var oveMarker = new Array();
			var lowMarker = new Array();
			var equMarker = new Array();
			var ovnum = 0;
			var lwnum = 0;
			var eqnum = 0;
			var i, marker;
			var id_num;
			
		<%for (kakaoDTO kvo : list2) {%>	
			<%if ((kvo.getSATURATION()).doubleValue() > 1.0) {%>
				i = 0;
				var max = [ new kakao.maps.LatLng(<%=kvo.getCity_latitude()%>,<%=kvo.getCity_longitude()%>) ]
				var imageSrc = 'marker/max.png', imageSize = new kakao.maps.Size(32, 32);
				var imageOption = {offset : new kakao.maps.Point(9, 9)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
				var marker = new kakao.maps.Marker({position : max[i],image : markerImage});
				
				
				
				oveMarker[ovnum] = marker;
				oveMarker[ovnum].id =<%=kvo.getLoc_seq()%>;
				oveMarker[ovnum].lt =<%=kvo.getCity_latitude()%>; 
				oveMarker[ovnum].ln =<%=kvo.getCity_longitude()%>; 
				
				kakao.maps.event.addListener(oveMarker[ovnum], 'click', function(mouseEvent) {
					console.log(this.id);
					id_num=this.id;
					panTo(this.lt,this.ln);
					updateChartData(this.id);
				});
				
				oveMarker[ovnum].setMap(map);
				i++;
				ovnum++;
				
			<%} else if (kvo.getSATURATION().doubleValue() > 0.7 && kvo.getSATURATION().doubleValue() > 0.3) {%>
				i = 0;
				var soso = [ new kakao.maps.LatLng(<%=kvo.getCity_latitude()%>,<%=kvo.getCity_longitude()%>) ]
				var imageSrc = 'marker/soso.png', imageSize = new kakao.maps.Size(40, 40);
				var imageOption = {offset : new kakao.maps.Point(9, 9)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
				var marker = new kakao.maps.Marker({position : soso[i],image : markerImage});
				console.log("soso33");
				equMarker[eqnum] = marker;
				equMarker[eqnum].id =<%=kvo.getLoc_seq()%>;
				equMarker[eqnum].lt =<%=kvo.getCity_latitude()%>; 
				equMarker[eqnum].ln =<%=kvo.getCity_longitude()%>; 
				
				kakao.maps.event.addListener(equMarker[eqnum], 'click', function(
						mouseEvent) {
					console.log("soso",this.id);
					id_num=this.id;
					panTo(this.lt,this.ln);
					updateChartData(this.id);
				});
				equMarker[eqnum].setMap(map);
				i++;
				eqnum++;
			<%} else {%>
				var min = [ new kakao.maps.LatLng(
			<%=kvo.getCity_latitude()%>,<%=kvo.getCity_longitude()%>) ]
				i = 0;
				var imageSrc = 'marker/min.png', imageSize = new kakao.maps.Size(40, 40);
				var imageOption = {offset : new kakao.maps.Point(9, 9)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
				var marker = new kakao.maps.Marker({position : min[i],image : markerImage});
				
				lowMarker[lwnum] = marker;
				lowMarker[lwnum].id =<%=kvo.getLoc_seq()%>;
				lowMarker[lwnum].lt =<%=kvo.getCity_latitude()%>; 
				lowMarker[lwnum].ln =<%=kvo.getCity_longitude()%>; 
				
				kakao.maps.event.addListener(lowMarker[lwnum], 'click', function(
						mouseEvent) {
					console.log(this.id);
					id_num=this.id;	
					panTo(this.lt,this.ln);
					updateChartData(this.id);
				});
				
				lowMarker[lwnum].setMap(map);
				i++;
				lwnum++;
			<%}%>
				
			<%}%>
			
			
			
			
		var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 11 // 지도의 확대 레벨
		    };

		var map2 = new kakao.maps.Map(mapContainer, mapOption),
					customOverlay = new kakao.maps.CustomOverlay({}),
	    			infowindow = new kakao.maps.InfoWindow({removable: true});
// 지도를 생성합니다

		//마커생성
		<%for (kakaoDTO kvm : list) {%>
			var lat=<%=kvm.getCity_latitude()%>;
			var lon=<%=kvm.getCity_longitude()%>;
			var city="<%=kvm.getSi_city()%>";
			
			/* var imageSrc = 'marker/chargelogo.png', imageSize = new kakao.maps.Size(25, 25);
			var imageOption = {
					offset : new kakao.maps.Point(9,9)
			};										
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption); */
			
			var positions = 
			    {
			        <%-- content: '<div style="background-color:blue"><%=kvm.getSi_city()%></div>', --%>
			        latlng: new kakao.maps.LatLng(lat,lon)
			    };

			
			    // 마커를 생성합니다
			    var marker2 = new kakao.maps.Marker({
			      /*   map: map2, // 마커를 표시할 지도
			        position: positions.latlng // 마커의 위치 */
			        /* image : markerImage */
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			       /*  content: positions.content // 인포윈도우에 표시할 내용 */
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			  /*   kakao.maps.event.addListener(marker2, 'mouseover', makeOverListener(map2, marker2, infowindow));
			    kakao.maps.event.addListener(marker2, 'mouseout', makeOutListener(infowindow)); */
			
			
			
			
			marker2.setMap(map2);
		<%}%>
/* =====================================다각형=====================================	 */		

<%--  $.getJSON("./js/geojson2.geojson",function(geojson){
	
	var data = geojson.features;
	var corrdinates=[];
	var name ='';
	
	$.each(data,function(index,val){
		
		corrdinates = val.geometry.coordinates;
		name = val.properties.CTP_ENG_NM;
		type= val.geometry.type;
		displayArea(corrdinates,name,type);
		
		<% System.out.print("tt");%>
		})
	})	
		
var polygon=[]; 
function displayArea(corrdinates,name,type){
var iland=0;
var pointw=0;
var mpointw=0;
	var path =[];
	var points=[];
	for(iland;iland<corrdinates.length;iland++){
		for(pointw;pointw<corrdinates[iland].length;pointw++){
			if(type==="Polygon"){
				x = corrdinates[iland][pointw][1];
				y = corrdinates[iland][pointw][0];
				points.push(new kakao.maps.LatLng(x,y));
				console.log("pol:"+name+type+x,y,corrdinates.length,corrdinates[iland].length);
			}else{
				for(mpointw;mpointw<corrdinates[iland][pointw].length;mpointw++){
					x = corrdinates[iland][pointw][mpointw][1];
					y = corrdinates[iland][pointw][mpointw][0];
					points.push(new kakao.maps.LatLng(x,y));
					console.log("mul:"+name+type+x,y,corrdinates.length,corrdinates[iland].length,corrdinates[iland][pointw].length);
					
				}
			}
		}
		path.push(points);
	}
	
	

	var polygon = new kakao.maps.Polygon({
		map:map2,
	    path:path, // 그려질 다각형의 좌표 배열입니다
	    strokeWeight: 3, // 선의 두께입니다
	    strokeColor: '#39DE2A', // 선의 색깔입니다
	    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid', // 선의 스타일입니다
	    fillColor: '#A2FF99', // 채우기 색깔입니다
	    fillOpacity: 0.7 // 채우기 불투명도 입니다
	});
	
	//polygon.setMap(map2);
	<% System.out.print("t");%>
} --%>
var circlepath = [
	new kakao.maps.LatLng(37.56157305843904,126.99207721631042),
	new kakao.maps.LatLng(35.185789313392455,129.08892069918528),
	new kakao.maps.LatLng(35.86686578241322,128.60219288119984),
	new kakao.maps.LatLng(37.40422732079655,126.6566913260569),
	new kakao.maps.LatLng(35.176035898372696,126.85741928640157),
	new kakao.maps.LatLng(36.36142188986449,127.38582434405983),
	new kakao.maps.LatLng(35.554648344730886,129.35250218417764),
	new kakao.maps.LatLng(36.48165792763894,127.28929051779492),
	new kakao.maps.LatLng(37.37029773144964,127.48196828397913),
	new kakao.maps.LatLng(37.61730730441426,128.34761940811427),
	new kakao.maps.LatLng(36.819310188820815,127.84000986756371),
	new kakao.maps.LatLng(36.57304323463604,126.85346382442455),
	new kakao.maps.LatLng(35.77017936365488,127.14372195776335),
	new kakao.maps.LatLng(34.93949318524349,126.83961532041668),
	new kakao.maps.LatLng(36.448635749767355,128.81251004222787),
	new kakao.maps.LatLng(35.501933736635756,128.13079422127777),
	new kakao.maps.LatLng(33.378653640994315,126.54541729800057),
	
	]

var index_list=[1, 2, 3, 4, 5, 6, 7, 8, 9, 49, 57, 68, 83, 97, 130, 142, 159];
var circled= new Array();
for(cyi=0;cyi<circlepath.length;cyi++){
	displayArea(circlepath[cyi]);
}
function displayArea(area){
		if(cyi > 7){
		var circle = new kakao.maps.Circle({
		    center : circlepath[cyi],  // 원의 중심좌표 입니다 
		    radius: 50000, // 미터 단위의 원의 반지름입니다 
		    strokeWeight: 5, // 선의 두께입니다 
		    strokeColor: '#59DA50', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'line', // 선의 스타일 입니다
		    fillColor: '#CFE7FF', // 채우기 색깔입니다
		    fillOpacity: 0.5,  // 채우기 불투명도 입니다
		    zIndex : 1
		});
		}else{
		var circle = new kakao.maps.Circle({
		    center : circlepath[cyi],  // 원의 중심좌표 입니다 
		    radius: 8000, // 미터 단위의 원의 반지름입니다 
		    strokeWeight: 5, // 선의 두께입니다 
		    strokeColor: '#75B8FA', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'line', // 선의 스타일 입니다
		    fillColor: '#CFE7FF', // 채우기 색깔입니다
		    fillOpacity: 0.9,  // 채우기 불투명도 입니다  
		    zIndex: 999
		}); 

	}
		circled[cyi]=circle;
		circled[cyi].id=(index_list[cyi]);
		circle.setMap(map2);
		
		
		 // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
	    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
	    kakao.maps.event.addListener(circle, 'mouseover', function(mouseEvent) {
	    	circle.setOptions({fillColor: '#09f'});


	        customOverlay.setPosition(mouseEvent.latLng); 
	        customOverlay.setMap(map2);
	    });

	    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
	    kakao.maps.event.addListener(circle, 'mousemove', function(mouseEvent) {
	        
	        customOverlay.setPosition(mouseEvent.latLng); 
	    });

	    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
	    // 커스텀 오버레이를 지도에서 제거합니다 
	    kakao.maps.event.addListener(circle, 'mouseout', function() {
	    	circle.setOptions({fillColor: '#fff'});
	        customOverlay.setMap(null);
	    }); 

	    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
	    kakao.maps.event.addListener(circle, 'click', function(mouseEvent) {
				location.href = "./CityChargeStation_test.jsp?citydata="+this.id;
				console.log(this.id);
	    });
		
}


/* =====================================함수부=====================================	 */	

		
		function setCenter() {            
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
		    
		    // 지도 중심을 이동 시킵니다
		    map.setCenter(moveLatLon);
		}

		function panTo(lt,ln) {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(lt, ln);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map2.panTo(moveLatLon);            
		}  
			
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}	

 		function updateChartData(id){
			<%for (int funcnu = 0; funcnu < carlist.size(); funcnu++) {%>
			if(id==<%=carlist.get(funcnu).getReg_seq()%>){
				chart.data.datasets[0].data=[<%=carlist.get(funcnu).getCar_num()%>];
				chart.data.datasets[1].data=[<%=carlist.get(funcnu).getDat_possible_car()%>];
				chart.update();
				
				/* myChart3.data.datasets[0].data=[1,2,3,4,5,6,7,8];
				myChart3.data.datasets[1].data=[1,2,3,4,5,6,7,8]; */
				myChart3.update();
			}
		<%}%>
		} 
	</script>
</body>

</html>