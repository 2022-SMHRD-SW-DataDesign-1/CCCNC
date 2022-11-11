<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>중심좌표 변경 이벤트 등록하기</title>
</head>
<body>

<div id="map" style="width: 650px; height: 650px;"></div>
<div id="clickLatlng"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f867e2332325dabbf2acc1f5355d06f&libraries=services"></script>
<script> 
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = {  
        center: new kakao.maps.LatLng(38.00994423, 126.9531742), // 지도의 중심좌표 
        level: 6 // 지도의 확대 레벨 (레벨 클수록 축소)
    }; 

    var map = new kakao.maps.Map(mapContainer, mapOption);  // 지도를 생성합니다 


    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('경기도 연천군', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
    } 
    });    

    // 지도를 클릭한 위치에 표출할 마커입니다
    var marker = new kakao.maps.Marker({ 
        // 지도 중심좌표에 마커를 생성합니다 
        position: map.getCenter() 
    }); 
    // 지도에 마커를 표시합니다
    marker.setMap(map);

    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        

        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 

        // 마커 위치를 클릭한 위치로 옮깁니다
        var marker = new kakao.maps.Marker({
        map: map,
        position: latlng
   		 });
        marker.setMap(map);

        var message = 'new kakao.maps.LatLng('+latlng.getLat()+','+latlng.getLng()+'),';

        var resultDiv = document.getElementById('clickLatlng'); 
        resultDiv.innerHTML = 'var polygonPath = [';
        createDiv(message)
        console.log(latlng.getLat()+','+latlng.getLng())

    });
    
    function createDiv(message) {
    	  // 1. <div> element 만들기
    	  const newDiv = document.createElement('div');
    	  
    	  // 2. <div>에 들어갈 text node 만들기
    	  const newText = document.createTextNode(message);
    	  
    	  // 3. <div>에 text node 붙이기
    	  newDiv.appendChild(newText);
    	  
    	  // 4. <body>에 1에서 만든 <div> element 붙이기
    	  document.body.appendChild(newDiv);
    	} 
    
    

    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    
    
    
    
</script>

</body>
</html>