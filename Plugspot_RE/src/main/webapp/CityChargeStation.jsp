
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
</head>
<body>
   <div style="height:100vh; width:100vw;">
        <canvas id="myChart"></canvas>
        <canvas id="myChart2"></canvas>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%
CityChargeDAO dao = new CityChargeDAO();
ArrayList<CityChargeDTO> station = dao.station();
fastDAO dao2  = new fastDAO();
ArrayList<fastDTO> fast = dao2.fast();
System.out.println(fast.size());
%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f"></script>
<div id="staticMap" style="width:600px;height:350px;"></div>
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

console.log(positions);

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
<script>
        new Chart(document.getElementById('myChart').getContext('2d'), {
            type: 'bar',
            data: {
                labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                datasets: [
                    {
                        label: '전체도시의 평균충전량',
                        type: 'line',
                        data: [50, 30, 40, 50, 60, 90, 80, 50, 60, 70, 80, 70],
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
                        data: [10, 20, 30, 40, 50, 60, 80, 70, 90, 100, 80, 70]
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
    <!-- 급속 -->
    <script>
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
       
      
    		
   
        new Chart(document.getElementById('myChart2').getContext('2d'), {
            type: 'bar',
            
            data: {
            	
                labels: ['1주', '2주', '3주', '4주', '5주', '6주', '7주', '8주', '9주', '10주', '11주', '12주'],
                datasets: [
                    {
                        label: '전체도시의 평균충전량',
                        type: 'line',
                        data: [50, 30, 40, 50, 60, 90, 80, 50, 60, 70, 80, 70],
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
</body>
</html>