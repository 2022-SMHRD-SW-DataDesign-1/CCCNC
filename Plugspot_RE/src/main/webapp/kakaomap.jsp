<%@page import="com.plugspot.model.kakaoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.kakaoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		kakaoDAO dao = new kakaoDAO();		
	  	ArrayList<kakaoDTO> list = dao.kakao();
%>	  	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마커 클러스터러 사용하기</title>

</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<body>
<form>
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
	
	var i, marker;
	<% for(kakaoDTO kvo : list){ %>
 		
		if(kvo.getLoc_seq()=="1"){ 
            i=0;
            var max = [new kakao.maps.LatLng(<%=kvo.getCity_latitude() %>,<%=kvo.getCity_longitude()%>)]
			var imageSrc = 'marker/max.png', imageSize = new kakao.maps.Size(25, 25); 
			var imageOption = {
					offset : new kakao.maps.Point(18,15)
			};										
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
			var marker = new kakao.maps.Marker({							
				        position : max[i],
						image : markerImage
						
				});
			marker.id=<%=kvo.getLoc_seq()%>;				
				kakao.maps.event.addListener(marker,'click',function(mouseEvent){
				          console.log(marker.id);	
				});
				marker.setMap(map);
				i++;
						
				<% }else if(kvo.getLoc_seq()=="1"){ %>
	            i=0;
				var max = [new kakao.maps.LatLng(<%=kvo.getCity_latitude() %>,<%=kvo.getCity_longitude()%>)]
				var imageSrc = 'marker/soso.png', imageSize = new kakao.maps.Size(20, 20); 
				var imageOption = {
						offset : new kakao.maps.Point(18,15)
				};										
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
				var marker = new kakao.maps.Marker({							
					        position : soso[i],
							image : markerImage
							
					});
					marker.id=<%=kvo.getLoc_seq()%>;				
					kakao.maps.event.addListener(marker,'click',function(mouseEvent){
					          console.log(marker.id);	
					});
					marker.setMap(map);
					i++;//if
			
		<%}else{ %>
        i=0;
		var max = [new kakao.maps.LatLng(<%=kvo.getCity_latitude() %>,<%=kvo.getCity_longitude()%>)]
		var imageSrc = 'marker/min.png', imageSize = new kakao.maps.Size(15, 15); 
		var imageOption = {
				offset : new kakao.maps.Point(18,15)
		};										
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
		var marker = new kakao.maps.Marker({							
			        position : min[i],
					image : markerImage
					
			});
			marker.id=<%=kvo.getLoc_seq()%>;				
			kakao.maps.event.addListener(marker,'click',function(mouseEvent){
			          console.log(marker.id);	
			});
			marker.setMap(map);
			i++;//if %>//for
		}
	

		
	</script>
	
</body>
</html>