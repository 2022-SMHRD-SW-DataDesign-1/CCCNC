
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
<%
CityChargeDAO dao = new CityChargeDAO();
ArrayList<CityChargeDTO> station = dao.station();


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
</body>
</html>