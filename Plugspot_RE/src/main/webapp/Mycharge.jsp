<%@page import="com.plugspot.model.ChargeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f"></script>
<script type="text/javascript" src="./js/jquery-3.6.1.min.js"></script>
<div id="map" style="width:100%;height:350px;"></div>
<p><em>지도를 클릭해주세요!</em></p> 
<div id="clickLatlng"></div>


<fieldset>
<legend> 내 충전소 정보</legend>
<%

MemberDTO info = (MemberDTO)session.getAttribute("info");
			
%>
사업자등록번호:<%=info.getMember_num()%>
<P>
<button onclick="seoul()" name="서울">서울</button>
<button onclick="busan()" name="부산">부산</button>
<button onclick="daegu()" name="대구">대구</button>
<button onclick="incheon()" name="인천">인천</button>
<button onclick="gwangju()" name="광주">광주</button>
<button onclick="daejeon()" name="대전">대전</button>
<button onclick="ulsan()" name="울산">울산</button>
<button onclick="sejong()" name="세종">세종</button>
<button onclick="gyeonggi()" name="경기도">경기도</button>
</P>

<script>
var mapContainer = document.getElementById('map'), 
    mapOption = { 
        center: new kakao.maps.LatLng(37.56638, 126.977902), 
        level: 10 
    };

var map = new kakao.maps.Map(mapContainer, mapOption); 


var marker = new kakao.maps.Marker({ 
    
    position: map.getCenter() 
}); 

marker.setMap(map);

var lat;
var lng; 

let latList = [];
let lngList = [];



kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
   
    var latlng = mouseEvent.latLng; 
    
    
    marker.setPosition(latlng);
    
    
    lat = latlng.getLat();
    lng = latlng.getLng(); 
    
    latList.push(lat);
    lngList.push(lng);
    
    var message = '클릭한 위치의 위도는 ' + lat + ' 이고, ';
    message += '경도는 ' + lng + ' 입니다';
    
    console.log(latList);
    console.log(lngList);
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
    
});
	kakao.maps.event.addListener(map,'click',function(mouseEvent){
		addMarker(mouseEvent.latLng);
	});
	var markers=[];
	function addMarker(position){
		var marker = new kakao.maps.Marker({
			position: position
		});
		marker.setMap(map);
		markers.push(marker);
	}
	
	function setMarkers(map){
		for(var i=0; i<markers.length; i++) {
			marker[i].setMap(map);
		}
	}
	
	 function seoul(){
		 var moveLatLon = new kakao.maps.LatLng(37.56638, 126.977902);
		 map.panTo(moveLatLon);
	 }
	 function busan(){
		 var moveLatLon = new kakao.maps.LatLng(35.179572, 129.075577);
		 map.panTo(moveLatLon);
	 }
	 function daegu(){
		 var moveLatLon = new kakao.maps.LatLng(35.841269, 128.60173400000002);
		 map.panTo(moveLatLon);
	 }
	 function incheon(){
		 var moveLatLon = new kakao.maps.LatLng(37.455791, 126.705401);
		 map.panTo(moveLatLon);
	 }
	 function gwangju(){
		 var moveLatLon = new kakao.maps.LatLng(35.160015, 126.851329);
		 map.panTo(moveLatLon);
	 }
	 function daejeon(){
		 var moveLatLon = new kakao.maps.LatLng(36.349637,127.383316);
		 map.panTo(moveLatLon);
	 }
	 function ulsan(){
		 var moveLatLon = new kakao.maps.LatLng(35.538756,129.311327);
		 map.panTo(moveLatLon);
	 }
	 function sejong(){
		 var moveLatLon = new kakao.maps.LatLng(36.480862,127.29075700000001);
		 map.panTo(moveLatLon);
	 }
	 function gyeonggi(){
		 var moveLatLon = new kakao.maps.LatLng(37.263201,127.028574);
		 map.panTo(moveLatLon);
	 }
	 
</script>






</fieldset>
<button onclick="insertTable()" >위치등록</button>

<script type="text/javascript">
function insertTable() {

	$.ajax({
		url : 'StateProgram',
		data : {'latiList':latList.toString(),
				'longList':lngList.toString(),
				'data_test' : "data_test"},
		type : 'post',
		success : function(data){
			console.log(data);
			alert("주소등록에 성공하셨습니다");
		}
	}); 	
}
</script>



</body>
</html>