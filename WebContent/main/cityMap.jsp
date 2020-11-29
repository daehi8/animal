<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 15%;
  height: 350px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 80%;
  border-left: none;
  height: 320px;
}
</style>
</head>
<jsp:include page="/_comm/_head.jsp"></jsp:include>
<%
String city = request.getParameter("city");
if(city == null){
	city = "서울";
}
%>
<body>
<br /><br /><br /><br /><br /><br /><br /><br />
<div class="tab">
  <button class="tablinks" onclick="document.location.href='./cityMap.jsp?city=<%="서울"%>'">서울</button>
  <button class="tablinks" onclick="document.location.href='./cityMap.jsp?city=<%="경기도"%>'">경기</button>
  <button class="tablinks" onclick="document.location.href='./cityMap.jsp?city=<%="부산"%>'">경상</button>
  <button class="tablinks" onclick="document.location.href='./cityMap.jsp?city=<%="전라도"%>'">전라</button>
  <button class="tablinks" onclick="document.location.href='./cityMap.jsp?city=<%="충청도"%>'">충청</button>    
</div>

<%-- 카카오맵 API --%>
<%--<div class="tabcontent">--%>
	<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
        </a>
    </em>
</p>
<div id="map" style="width:75%;height:330px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ac42440b4ed359a0106f6bc279e03ac&libraries=services"></script>
<script>
var city = "<%=city%>";
</script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch(city, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:50px;text-align:center;padding:6px 0;">here</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<%--</div>--%>
<jsp:include page="/_comm/_tail.jsp"></jsp:include>   
</body>
</html> 
