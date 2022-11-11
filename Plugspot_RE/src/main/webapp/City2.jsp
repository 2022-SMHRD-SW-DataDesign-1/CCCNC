<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마커 생성하기</title>

</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>



<body>
	<% String num = request.getParameter("num_data"); %>
	<% System.out.println("여기는 city2 :"+num); %>

	<% double d_num=0;
	if(num==null){
		d_num=33.450701;%>
	<%}else{
		System.out.println("실행");
		d_num=Double.parseDouble(num);
	}
 %>

	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=services,clusterer,drawing"></script>
	<script>
	$(document).ready(function() {
		var num = <%= num %>;
		
		var d_num;
		if(num==null){
			d_num=33.450701;
		}else{
			d_num=Double.parseDouble(num);
			console.log(d_num);
		}
		
		if(<%=d_num%> ==null){ window.location.reload();}
		console.log("hello")
		console.log("test:" +<%=d_num%>);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {center : new kakao.maps.LatLng(<%=d_num%>, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(<%=d_num%>
		, 126.570667);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
		
	});
	</script>
</body>
</html>