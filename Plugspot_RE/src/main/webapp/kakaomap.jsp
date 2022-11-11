<%@page import="java.math.BigDecimal"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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

<body
	style="margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;">
	<%
	kakaoDAO dao = new kakaoDAO();
	ArrayList<kakaoDTO> list = dao.kakao();
	System.out.print(list.get(0).getSATURATION());
	int index_list[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 39, 57, 68, 83, 97, 119, 142, 159};
	ArrayList<kakaoDTO> list2 = new ArrayList();

	for (int i = 0; i < list.size(); i++) {
		for (int j = 0; j < index_list.length; j++) {
			if (index_list[j] == (list.get(i).getLoc_seq()).intValue()) {
		list2.add(list.get(i));
			}
		}
	}
	for (int k = 0; k < list2.size(); k++) {
		System.out.println(list2.get(k).getSATURATION());
	}
	%>
	<form action="kakaoService" method="post">
		<p style="margin-top: -30px"></p>
		<fieldset style="display:inline">
		<div id="map2" style="width: 650px; height: 650px;"></div>
		</fieldset>
		<fieldset style="display:inline">
		<div id="map" style="width: 650px; height: 720px;"></div>
		</fieldset>
		<!-- 200,240 -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=services,clusterer,drawing"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=clusterer"></script>
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
					
					panTo(this.lt,this.ln)
				});
				
				oveMarker[ovnum].setMap(map);
				i++;
				ovnum++;
			<%} else if (kvo.getSATURATION().doubleValue() > 0.7 && kvo.getSATURATION().doubleValue() > 0.4) {%>
				i = 0;
				var soso = [ new kakao.maps.LatLng(<%=kvo.getCity_latitude()%>,<%=kvo.getCity_longitude()%>) ]
				var imageSrc = 'marker/soso.png', imageSize = new kakao.maps.Size(40, 40);
				var imageOption = {offset : new kakao.maps.Point(9, 9)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
				var marker = new kakao.maps.Marker({position : soso[i],image : markerImage});

				lowMarker[lwnum] = marker;
				lowMarker[lwnum].id =<%=kvo.getLoc_seq()%>;
				lowMarker[lwnum].lt =<%=kvo.getCity_latitude()%>; 
				lowMarker[lwnum].ln =<%=kvo.getCity_longitude()%>; 
				
				kakao.maps.event.addListener(lowMarker[lwnum], 'click', function(
						mouseEvent) {
					console.log(this.id);
					id_num=this.id;
					
					panTo(this.lt,this.ln)
				});
				
				i++;
				lwnum++;
			<%} else {%>
				var min = [ new kakao.maps.LatLng(
			<%=kvo.getCity_latitude()%>,<%=kvo.getCity_longitude()%>) ]
				i = 0;
				var imageSrc = 'marker/min.png', imageSize = new kakao.maps.Size(40, 40);
				var imageOption = {offset : new kakao.maps.Point(9, 9)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption);
				var marker = new kakao.maps.Marker({position : min[i],image : markerImage});
				
				equMarker[eqnum] = marker;
				equMarker[eqnum].id =<%=kvo.getLoc_seq()%>;
				equMarker[eqnum].lt =<%=kvo.getCity_latitude()%>; 
				equMarker[eqnum].ln =<%=kvo.getCity_longitude()%>; 
				
				kakao.maps.event.addListener(equMarker[eqnum], 'click', function(
						mouseEvent) {
					console.log(this.id);
					id_num=this.id;
					
					panTo(this.lt,this.ln)

				});
				
				equMarker[eqnum].setMap(map);
				i++;
				eqnum++;
			<%}%>
				
			<%}%>
			
			
			
		
		var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 11 // 지도의 확대 레벨
		    };

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

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
		    map.panTo(moveLatLon);            
		}  
			
			

	
		</script>
	</form>
</body>
</html>