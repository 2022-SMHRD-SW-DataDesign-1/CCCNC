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

<body style="
    margin-left: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
">
<%
		

		kakaoDAO dao = new kakaoDAO();		
	  	ArrayList<kakaoDTO> list = dao.kakao();
	  	System.out.print(list.get(0).getSATURATION());
	  	int index_list[] ={0,1,2,3,4,5,6,7,8,9,39,57,68,83,97,119,142,159};
	  	ArrayList<kakaoDTO> list2 = new ArrayList();
	  	
	  	for(int i =0;i<list.size();i++){
	  		for(int j=0;j<index_list.length;j++){
		  		if(index_list[j]==(list.get(i).getLoc_seq()).intValue()){
		  			list2.add(list.get(i));
		  		}
	  		}
	  	}
	  	for(int k=0;k<list2.size();k++){
	  		System.out.println(list2.get(k).getSATURATION());
	  	}
	  	
%>	  	
<form action="kakaoService" method="post">
	<p style="margin-top: -30px"></p>
	<div id="map" style="width: 650px; height: 720px;"></div> <!-- 200,240 -->
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
	
	var i, marker;
	<% for(kakaoDTO kvo : list2){ %>
		 <% if((kvo.getSATURATION()).doubleValue()>1.0){%>		  
            i=0;
            var max = [new kakao.maps.LatLng(<%=kvo.getCity_latitude() %>,<%=kvo.getCity_longitude()%>)]
			var imageSrc = 'marker/max.png',  imageSize = new kakao.maps.Size(32, 32); 
			var imageOption = {
					offset : new kakao.maps.Point(9,9)
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
		 
			 <%}else if(kvo.getSATURATION().doubleValue()>0.7&&kvo.getSATURATION().doubleValue()>0.4){%>
	          	i=0;
				var soso = [new kakao.maps.LatLng(<%=kvo.getCity_latitude() %>,<%=kvo.getCity_longitude()%>)]
				var imageSrc = 'marker/soso.png', imageSize = new kakao.maps.Size(40, 40); 
				var imageOption = {
						offset : new kakao.maps.Point(9,9)
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
					i++;8/20
			
		 <%}else{ %>
        
		var min = [new kakao.maps.LatLng(<%=kvo.getCity_latitude() %>,<%=kvo.getCity_longitude()%>)]
		i=0;
		var imageSrc = 'marker/min.png', imageSize = new kakao.maps.Size(40, 40); 
		var imageOption = {
				offset : new kakao.maps.Point(9,9)
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
			i++;
		  
		<%}%> 
		<%}%>
		
	

		
	</script>
	</form>
</body>
</html>