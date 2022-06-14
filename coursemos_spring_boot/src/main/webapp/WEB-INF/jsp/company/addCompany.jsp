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
  	.error {
		color:red;
		font-size:15px;
		font-weight:bold;
	}
</style>
</head>
<body>
<center><h1>사업자 등록</h1></center>
<div class="container">
<table class="table">    
	<form:form modelAttribute="Company">
	<tr>
		<td class="text-center"><b>지도에서<br>위치찾기</b></td>
		<td>
			<input id="keyword1" type="text" placeholder="장소를 입력하세요.">
			<button onclick="searchPlaces(); return false;" type="button">위치 찾기</button>
			<button id="javascript_btn1" type="button">주소 불러오기</button>
			<div id="map"></div>
		</td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="companyId">사업자등록번호</form:label></td>
		<td><form:input path="companyId" /> <form:errors path="companyId" cssClass="error"/><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="place.placeName">가게명</form:label></td>
		<td><form:input path="place.placeName" size="35" placeholder="주소 찾기 시 자동 추가됩니다"/> <form:errors path="place.placeName" cssClass="error"/><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="phone">전화번호</form:label></td>
		<td><form:input path="phone"  size="35" placeholder="주소 찾기 시 값이 존재하면 자동 추가됩니다"/> <form:errors path="phone" cssClass="error"/><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="address">주소</form:label></td>
		<td><form:input path="address"  size="50" placeholder="주소 찾기 시 자동 추가됩니다"/> <form:errors path="address" cssClass="error"/><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="place.taste">장소 분위기 선택하기</form:label></td>
		<td><form:radiobuttons path="place.taste" items="${tasteCodes}" itemLabel="label" itemValue="code" /> <form:errors path="place.taste" cssClass="error"/></td>
	</tr>
	<tr>
		<td colspan="2" class="text-center"><input type="submit" value="접수하기" /></td>
	</tr>
	<form:hidden path="place.x" />
	<form:hidden path="place.y" />
	<form:hidden path="place.subway" />
	</form:form>
</table>
</div>

<!-- test용
<form name="result" method="post" action="<c:url value='/company/register' />">
	<input type="button" onClick="alertF()" value="코스찾기">
</form>  -->

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
var isSearch = false;

var ps = new kakao.maps.services.Places(); 
var markers = [];
var x = 0;
var y = 0;
var phone = "";
var subWayName = "";
var road_address_name = "";
var placeName = "";
var clickSubwayButton = false;

function alertF() {
	alert(document.getElementById("address").value);
	alert(document.getElementById("place.x").value);
	alert(document.getElementById("place.y").value);
	alert(document.getElementById("place.subway").value);
}

document.getElementById("javascript_btn1").addEventListener("click", javascript_onclikc);
function javascript_onclikc(){
	
	if (isSearch == false) {
		alert("위치 찾기를 먼저 진행해주세요!");
		return;
	}
	if (clickSubwayButton == false) {
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
	isSearch = true;
	
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
    	//markers.push(displayMarker(data[0]));
    	
    	// 검색된 장소 위치를 기준으로 이동
       	//var moveLatLon = new kakao.maps.LatLng(data[0].y, data[0].x);
    	var tmp = data[0].place_name;
    	var tmpSplit = tmp.split(' ');
        subwayName = tmpSplit[0];
        
        document.getElementById("place.subway").value = subwayName;
        document.getElementById("place.x").value = y;
        document.getElementById("place.y").value = x;
        document.getElementById("place.placeName").value = placeName;
        document.getElementById("address").value = road_address_name+" "+placeName;
        document.getElementById("company.phone").value = phone;
    }
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) { //장소검색
    if (status === kakao.maps.services.Status.OK) {

        markers.push(displayMarker(data[0]));        

        y = parseFloat(data[0].y);
        x = parseFloat(data[0].x);
        placeName = data[0].place_name;
        road_address_name = data[0].road_address_name;
        phone = data[0].phone;
        
               
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