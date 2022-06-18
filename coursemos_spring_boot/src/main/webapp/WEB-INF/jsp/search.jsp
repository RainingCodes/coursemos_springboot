<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
   <%@ include file="header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
   <%@ include file="header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchNMap</title>
<style>
	 #map {
   		margin: 0;
        width: 500px;
        height: 500px;
        border: 1px #a8a8a8 solid;
    }
	body {
		text-align : center;
	}
</style>
</head>
<body>
	<div class="search">
    	<form id="search" onsubmit="searchPlaces();">
        	<search>
        		<input id="keyword1" type="text" placeholder="장소를 입력하세요.">
			</search>
        	<input id="plus" type="button" value="+" onclick="add_Place()"/>
        </form>
    </div> 
        
     <div>
		<div id="map"></div>        
	</div>
<form onsubmit="searchPlaces(); return false;">
	<button class="btn btn-outline-primary" type="submit">검색하기</button>
</form>

<button class="btn btn-outline-primary" id="javascript_btn1" type="button">역 찾기</button>

<form name="form" method="get" action="<c:url value='/course/search.do'/>">
	<input type="hidden" name="subway" value=0>
	<input type="hidden" name="x" value=0>
	<input type="hidden" name="y" value=0>
	<input class="btn btn-outline-primary"  type="button" onClick="submitForm()" value="코스찾기">
</form>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
<script>

var existTwoSearchForm = false;

const add_Place = () => {
	const search = document.getElementById("search");
	const search2 = document.createElement('search2');
	search2.innerHTML = "<input id='keyword2' type='text' placeholder='장소를 입력하세요.' ><input type='button' value='-' onclick='remove(this)'>";
	search.appendChild(search2);
	document.getElementById('plus').remove();
	existTwoSearchForm = true;
}
	        
const remove = (obj) => {
	document.getElementById('search').removeChild(obj.parentNode);
	const search = document.getElementById("search");
	var newPlus = document.createElement('input');
	newPlus.setAttribute("id", "plus");
	newPlus.setAttribute("type", "button");
	newPlus.setAttribute("value", "+");
	newPlus.setAttribute("onclick", "add_Place()");
	search.appendChild(newPlus);
	existTwoSearchForm = false;
}	

function submitForm() {	
	if (clickSearch == false) {
		alert('역 검색 먼저 진행해 주세요.');
		return;	
	}
	if (clickSubwayButton == false) {
		alert('역 찾기 먼저 진행해 주세요.');
		return;
	}
	form.submit();
}

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
var clickSearch = false;
var clickSubwayButton = false;

document.getElementById("javascript_btn1").addEventListener("click", javascript_onclikc);
function javascript_onclikc(){
	if (clickSearch == false) {
		alert('역 검색 먼저 진행해 주세요.');
		return;
	}
	if (clickSubwayButton == false) {
		if (existTwoSearchForm == true) {
			x /= 2;
			y /= 2;
		}
		
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

	clickSearch = true;
	clickSubwayButton = false;
    removeMarker();
    var keyword1 = document.getElementById('keyword1').value;
    
    if (existTwoSearchForm == true) {
    	var keyword2 = document.getElementById('keyword2').value;
    }
    
    if (!keyword1.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        clickSearch = false;
        return false;
    }
    
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword1, placesSearchCB);
    if (existTwoSearchForm == true) {
    	ps.keywordSearch(keyword2, placesSearchCB);
    }
    
}   
    
// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
// LatLngBounds 객체에 좌표를 추가합니다
var bounds = new kakao.maps.LatLngBounds();

function placesSearchCategoryCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	alert('역을 찾았습니다!');
    	markers.push(displayMarker(data[0]));  
    	var tmp = data[0].place_name;
    	var tmpSplit = tmp.split(' ');
        subwayName = tmpSplit[0];
        document.form.x.value = x;
        document.form.y.value = y;
		document.form.subway.value = subwayName;
    	
    	bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
        map.setBounds(bounds);
    }
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        markers.push(displayMarker(data[0]));        

        y += parseFloat(data[0].y);
        x += parseFloat(data[0].x);
        
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
        map.setBounds(bounds);
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