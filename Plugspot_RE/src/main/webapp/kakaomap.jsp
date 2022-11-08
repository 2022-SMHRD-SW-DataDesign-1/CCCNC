<%@page import="com.plugspot.model.kakaoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.kakaoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마커 클러스터러 사용하기</title>

</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<body>

	<p style="margin-top: -12px"></p>
	<div id="map" style="width: 200px; height: 240px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=clusterer"></script>
	<script>
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
			level : 14
		
		});
		
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, 
			averageCenter : true, 
			minLevel : 13
		 
		});

		<%
		kakaoDAO dao = new kakaoDAO();
		
	  	ArrayList<kakaoDTO> list = dao.kakao();
	    %>
	    var max = [new kakao.maps.LatLng(<%=list.get(1).getCity_latitude() %>,<%=list.get(1).getCity_longitude()%>)]
		var soso = [new kakao.maps.LatLng(35.841269,128.60173400000002),
			new kakao.maps.LatLng(36.141027445026,127.43021087693),
			 new kakao.maps.LatLng(37.263201,127.028574),
			 new kakao.maps.LatLng(35.841269,128.60173400000002)]
		var min = [new kakao.maps.LatLng(37.5666805, 126.9784147),
			new kakao.maps.LatLng(35.1586689,129.075577),
			 new kakao.maps.LatLng(37.455791,126.705401)]



		
		var i, marker;
		for (i = 0; i < max.length; i++) {
			
			var imageSrc = 'marker/max.png', imageSize = new kakao.maps.Size(
					25, 25); 
			var imageOption = {
				offset : new kakao.maps.Point(18,15)
			};
					
	

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption);
			var marker = new kakao.maps.Marker({
				position : max[i],
				image : markerImage
			
			});
			kakao.maps.event.addListener(marker,'click',function(mouseEvent){
				console.log(marker.latLng);
			});
			marker.setMap(map);
			

		}
		var i, marker;
		for (i = 0; i < soso.length; i++) {
			
			var imageSrc = 'marker/soso.png', imageSize = new kakao.maps.Size(
					20, 20);
			var imageOption = {
				offset : new kakao.maps.Point(18,15)
			};
					
	

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption);
			var marker = new kakao.maps.Marker({
				position : soso[i],
				image : markerImage
			
			});
			kakao.maps.event.addListener(marker,'click',function(mouseEvent){
				console.log(marker.latLng);
			});
			marker.setMap(map);

		}
		var i, marker;
		for (i = 0; i < min.length; i++) {
			
			var imageSrc = 'marker/min.png', imageSize = new kakao.maps.Size(
					15, 15);
			var imageOption = {
				offset : new kakao.maps.Point(18,15)
			};
					
	

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption);
			var marker = new kakao.maps.Marker({
				position : min[i],
				image : markerImage
			
			});
			kakao.maps.event.addListener(marker,'click',function(mouseEvent){
				console.log(marker.latLng);
			});
			marker.setMap(map);

		}
	

		
		
	</script>
	</form>
</body>
</html>