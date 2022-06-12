<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>사업자 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
    #map {
        width: 400px;
        height: 400px;
        border: 1px #a8a8a8 solid;
    }
</style>
</head>
<body>
<center><h1>사업자 등록</h1></center>
<div class="container">
<table class="table">    
	<form:form modelAttribute="Company">
	<tr>
		<td class="text-center"><form:label path="companyName">가게명</form:label></td>
		<td><form:input path="companyName" /><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="companyId">사업자등록번호</form:label></td>
		<td><form:input path="companyId" /><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="phone">전화번호</form:label></td>
		<td><form:input path="phone" /><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="address">주소</form:label></td>
		<td><form:input path="address" /><br></td>
	</tr>
	<tr>
		<td colspan="2" class="text-center"><input type="submit" value="접수하기" /></td>
	</tr>
	</form:form>
</table>
</div>


<form onsubmit="searchPlaces(); return false;">
	<input id="keyword1" type="text" placeholder="장소를 입력하세요.">
	<button type="submit">검색하기</button>
</form>
        
<div id="map"></div>

<button id="javascript_btn1" type="button">역 찾기</button>

<form name="result" method="post" action="<c:url value='/company/register' />">
	<input type="hidden" name="x" value=0>
	<input type="hidden" name="y" value=0>
	<input type="hidden" name="subwayName" value=0>
	<input type="button" onClick="alertF()" value="코스찾기">
</form>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
<script>

// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
var markers = [];
var x = 0;
var y = 0;
var subWayX = 0;
var subWayY = 0;
var subWayName = "";
var road_address_name = "";
var clickSubwayButton = false;

function alertF() {
	alert(document.result.x.value);
	alert(document.result.y.value);
	alert(document.result.subwayName.value);
	alert(road_address_name);
}

document.getElementById("javascript_btn1").addEventListener("click", javascript_onclikc);
function javascript_onclikc(){
	if (clickSubwayButton == false) {
		
		alert(x+", "+y);
		document.result.x.value = x;
		document.result.y.value = y;
		ps.categorySearch('SW8', placesSearchCategoryCB, {
	    	location: new kakao.maps.LatLng(y, x)
	    });
		clickSubwayButton = true;
	}
}

// 키워드로 장소를 검색합니다
function searchPlaces() {
	x = 0;
	y = 0;
	subWayX = 0;
	subWayY = 0;
	
	clickSubwayButton = false;
    removeMarker();
    var keyword1 = document.getElementById('keyword1').value;
    
    if (!keyword1.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword1, placesSearchCB);
}   
    
// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
// LatLngBounds 객체에 좌표를 추가합니다
var bounds = new kakao.maps.LatLngBounds();

function placesSearchCategoryCB (data, status, pagination) { //지하철 검색
    if (status === kakao.maps.services.Status.OK) {
    	markers.push(displayMarker(data[0]));
    	
    	// 검색된 장소 위치를 기준으로 이동
        var moveLatLon = new kakao.maps.LatLng(data[0].y, data[0].x);
        subwayName = data[0].place_name
        subWayX = data[0].y;
        subWayY = data[0].x;
        document.result.x.value = subWayX;
		document.result.y.value = subWayY;
		document.result.subwayName.value = subwayName;
        map.panTo(moveLatLon);
    }
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) { //장소검색
    if (status === kakao.maps.services.Status.OK) {

        markers.push(displayMarker(data[0]));        

        y = parseFloat(data[0].y);
        x = parseFloat(data[0].x);
        road_address_name = data[0].road_address_name+" "+data[0].place_name;
        
        var moveLatLon = new kakao.maps.LatLng(data[0].y, data[0].x);
        map.panTo(moveLatLon);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
    
    return marker;
}
    
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {

        kakao.maps.event.removeListener(markers[i], 'click');
        markers[i].setMap(null);
    }   
    markers = [];
}

function placeSubmit() {
	form.submit();
}
</script>
</body>
</html>