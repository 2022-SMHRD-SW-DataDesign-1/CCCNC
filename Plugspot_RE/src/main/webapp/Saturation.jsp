<%@page import="com.plugspot.model.kakaoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.plugspot.model.kakaoDAO"%>
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
		kakaoDAO dao = new kakaoDAO();		
	  	ArrayList<kakaoDTO> list = dao.kakao();
	  	System.out.print(list.get(0).getSATURATION());
	  	int index_list[] ={0,1,2,3,4,5,6,7,8,9,39,57,68,83,97,119,142,159};
	  	ArrayList<kakaoDTO> list2 = new ArrayList();
	  	
	  	for(int i =0;i<list.size();i++){
	  		for(int j=0;j<index_list.length;j++){
		  		if(index_list[j]==list.get(i).getLoc_seq()){
		  			list2.add(list.get(i));
		  		}
	  		}
	  	}
	  	
	  		
	  	
%>	  	

        <table class="info_table02" style="width:600px;text-align:center">
            <caption class="title" >지역별 충전소 충전기의 상태 현황</caption>
            <thead>
                <tr >
                    <th scope="col" class="th03">지역</th>
                    <th scope="col" class="th01">위도</th>
                    <th scope="col" class="th01">경도</th>
                    <th scope="col" class="th01">포화도</th>

                </tr>
            </thead>
            <tbody>
				<%for(int k=0;k<list2.size();k++){ %>
                <tr>
                    <th scope="row" class="bg"><span class="zone"><%=list2.get(k).getDo_city() %></span></th>
                    <td class="bg"><%=list2.get(k).getCity_latitude() %></td>
                    <td class="bg"><%=list2.get(k).getCity_longitude() %></td>
                    <td class="bg blue"><%=list2.get(k).getSATURATION() %></td>
                </tr>
				<%} %>
            </tbody>
        </table>
</body>
</html>