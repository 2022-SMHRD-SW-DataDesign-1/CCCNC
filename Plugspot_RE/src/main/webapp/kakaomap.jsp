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
		System.out.print(list.get(i).getDo_city());
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
					
					panTo(this.lt,this.ln)
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
					panTo(this.lt,this.ln)
					
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

		var map2 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//마커생성
		<%for (kakaoDTO kvm  : list){%>
			var lat=<%= kvm.getCity_latitude()%>;
			var lon=<%= kvm.getCity_longitude()%>;
			var city="<%= kvm.getSi_city()%>";
			
			/* var imageSrc = 'marker/chargelogo.png', imageSize = new kakao.maps.Size(25, 25);
			var imageOption = {
					offset : new kakao.maps.Point(9,9)
			};										
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imageOption); */
			
			var positions = 
			    {
			        content: '<div style="background-color:blue"><%= kvm.getSi_city()%></div>',
			        latlng: new kakao.maps.LatLng(lat,lon)
			    };

			
			    // 마커를 생성합니다
			    var marker2 = new kakao.maps.Marker({
			        map: map2, // 마커를 표시할 지도
			        position: positions.latlng // 마커의 위치
			        /* image : markerImage */
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions.content // 인포윈도우에 표시할 내용
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker2, 'mouseover', makeOverListener(map2, marker2, infowindow));
			    kakao.maps.event.addListener(marker2, 'mouseout', makeOutListener(infowindow));
			
			
			
			
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
	new kakao.maps.LatLng(33.37368259997763,126.56723592747852),
	new kakao.maps.LatLng(34.82822927263921,126.79483725356336),
	new kakao.maps.LatLng(35.26603633642619,128.14416640575502),
	new kakao.maps.LatLng(35.80633969541898,127.31350765087842),
	new kakao.maps.LatLng(36.507922190697386,126.79049370065155),
	new kakao.maps.LatLng(36.463394521871166,128.72124873945748),
	new kakao.maps.LatLng(36.87981252723434,127.6911328100001),
	new kakao.maps.LatLng(37.742108501142305,128.28575767007206),
	new kakao.maps.LatLng(37.37925027545884,127.44133385694842),
	new kakao.maps.LatLng(37.55998597988157,127.01937645416145),
	new kakao.maps.LatLng(37.39339338582987,126.64928744697255),
	new kakao.maps.LatLng(36.637081706167294,127.22524127172532),
	new kakao.maps.LatLng(36.359765620447625,127.40698537056107),
	new kakao.maps.LatLng(35.90673966145805,128.60702834725345),
	new kakao.maps.LatLng(35.58086978386315,129.34598950536966),
	new kakao.maps.LatLng(35.160783429376885,129.10913024617778),
	new kakao.maps.LatLng(35.14214950781724,126.86147269256132),
	
	]

for(cyi=0;cyi<circlepath.length;cyi++){
		if(cyi < 8){
		var circle = new kakao.maps.Circle({
		    center : circlepath[cyi],  // 원의 중심좌표 입니다 
		    radius: 50000, // 미터 단위의 원의 반지름입니다 
		    strokeWeight: 5, // 선의 두께입니다 
		    strokeColor: '#59DA50', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'line', // 선의 스타일 입니다
		    fillColor: '#59DA50', // 채우기 색깔입니다
		    fillOpacity: 0.2  // 채우기 불투명도 입니다
		   
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
		    fillOpacity: 0.9  // 채우기 불투명도 입니다  
		    
		}); 
	}
		circle.setMap(map2);
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

	
		</script>
	</form>
</body>
</html>