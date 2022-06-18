<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Search</title>
<style scoped>
.search {
        position:absolute;
        top:80px;
        left:200px;
        width:350px;
        height:300px;
    }
    .test {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    }

    #map {
        position:absolute;
        top:80px;
        left:600px;
        width: 800px;
        height: 600px;
        border: 1px #a8a8a8 solid;
    }
    .has-search .form-control {
	    padding-left: 2.375rem;
	}
	#courseList {
        position:absolute;
        top:300px;
        left:200px;
        width:300px;
        height:250px;
    }
    #page {
    	position:absolute;
        top:275px;
        left:200px;
        width:200px;
        height:50px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">    
</head>
<body>
 <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <!-- navbar-brand의 content 변경 -->
            <a class="navbar-brand" href="#">Fixed navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <!-- dropdown 메뉴 삭제 -->
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
                </ul>
            </div>
        </nav>
            
            <div class="search">
            
		    	<form id="search" onsubmit="searchPlaces(); return false;" method="post">
		        	<search>
		        		<input id="keyword1" type="text" placeholder="장소를 입력하세요.">
					</search>
		        	<input id="plus" type="button" value="+" onclick="add_Place()"/>
		        
					<button type="submit">검색하기</button>
				</form>		
				<c:forEach var="cate" items="${tList}">
					<button class="btn btn-primary" name="taste" onclick="location.href ='/course/detailedSearch.do?taste=${cate.code}&subway=${subway}&x=${x}&y=${y}'">${cate.label}</button>
				</c:forEach>	
			
				<button id="javascript_btn1" type="button">역찾기</button>
				<button type="button" onclick="location.href='/course/search/main'">검색초기화</button>
				<div id="resultsubway"></div>
			  
				<form name="result" method="post" action="<c:url value='/course/search'/>">
					<input type="hidden" name="x" value=0>
					<input type="hidden" name="y" value=0>
					
				</form>    
	   		</div> 
	        
			<div id="map" ></div>        
			<div id="searchResult">
			
            <div id="courseList">
            <div id="page"> 
            <c:if test="${!empty cList}">
            <c:if test="${!cList.first}">
					<div class="previous">
						<a href="/course/search.do?page=${cList.number-1}&subway=${subway}&x=${x}&y=${y}" class="btn btn-outline-dark float-left">&larr; Previous</a>
					</div>
				</c:if>
				<c:if test="${!cList.last}">
					<div class="next">
						<a href="/course/search.do?page=${cList.number+1}&subway=${subway}&x=${x}&y=${y}" class="btn btn-outline-dark float-right">&nbsp;&nbsp;&nbsp;&nbsp;Next &rarr;</a>
					</div>
				</c:if>
            <button type="button" onclick="location.href='/course/detailedSearch.do?page=${cList.number-1}&subway=${subway}&x=${x}&y=${y}&sort=likes'" class="btn btn-outline-dark float-right " >좋아요순</button>
			<button type="button" onclick="location.href='/course/detailedSearch.do?page=${cList.number-1}&subway=${subway}&x=${x}&y=${y}&sort=writtenDate'" class="btn btn-outline-dark float-right" data-bs-toggle="button" >최신순</button>
			<button type="button" onclick="location.href='/course/detailedSearch.do?page=${cList.number-1}&subway=${subway}&x=${x}&y=${y}&sort=writtenDateR'" class="btn btn-outline-dark float-right ">오래된순</button>
            </c:if>
            </div>
            <c:forEach items="${cList.content}" var="cate">
              <div class="accordion accordion-flush" id="accordionFlushExample">
               <div class="accordion-item"> 
                  <h2 class="accordion-header" id="${cate.courseId}"> 
                    <button class="accordion-button collapsed" type="button"  onclick="javascript:panTo('${cate.place1.x}' + ',' + '${cate.place1.y}');displayCourse('${cate.place1.x}' + ',' + '${cate.place1.y}', '${cate.place2.x}' + ',' + '${cate.place2.y}', '${cate.place3.x}' + ',' + '${cate.place3.y}');"data-bs-toggle="collapse" data-bs-target="#flush-collapseOne_${cate.courseId}" aria-expanded="false" aria-controls="flush-collapseOne_${cate.courseId}">
                         ${cate.courseId} |
                         ${cate.courseContents}
                        <i class="bi bi-heart-fill"></i> ${cate.likes}
                    </button>
                  </h2>
                  <div id="flush-collapseOne_${cate.courseId}" class="accordion-collapse collapse" aria-labelledby="${cate.courseId}" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
					<ul class="list-group col-12">
						<c:if test="${!empty cate.place1}">
						<li class="list-group-item list-group-item" onclick="javascript:panTo('${cate.place1.x}' + ',' + '${cate.place1.y}')" data-bs-toggle="modal" data-bs-target="#exampleModal_${cate.courseId}_0" style="background-color:antiquewhite">
							<div class="mx-sm-5 me-auto">
							<div class="fw-bold">${cate.place1.placeName}</div>
							</div>
						</li>
						</c:if>
						<c:if test="${!empty cate.place2}">
						<li class="list-group-item list-group-item" onclick="javascript:panTo('${cate.place2.x}' + ',' + '${cate.place2.y}')" data-bs-toggle="modal" data-bs-target="#exampleModal_${cate.courseId}_1" style="background-color:antiquewhite">
							<div class="mx-sm-5 me-auto">
							<div class="fw-bold">${cate.place2.placeName}</div>
							</div>
						</li>
						</c:if>
						<c:if test="${!empty cate.place3}">
						<li class="list-group-item list-group-item" onclick="javascript:panTo('${cate.place3.x}' + ',' + '${cate.place3.y}')" data-bs-toggle="modal" data-bs-target="#exampleModal_${cate.courseId}_2" style="background-color:antiquewhite">
							<div class="mx-sm-5 me-auto">
							<div class="fw-bold">${cate.place3.placeName}</div>
							</div>
						</li>
						</c:if>
					</ul>
                    </div>
                  <a href="/course/view/${cate.courseId}"><i class="bi bi-info-square"></i></a>
                  </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal_${cate.courseId}_0" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">${cate.place1.placeName}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
					위도 : ${cate.place1.x}
					경도 : ${cate.place1.y}
					근처 대중교통 : ${cate.place1.subway}
					취향 : ${cate.place1.taste}
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="exampleModal_${cate.courseId}_1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">${cate.place2.placeName}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
					위도 : ${cate.place2.x}
					경도 : ${cate.place2.y}
					근처 대중교통 : ${cate.place2.subway}
					취향 : ${cate.place2.taste}
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="exampleModal_${cate.courseId}_2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">${cate.place3.placeName}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
					위도 : ${cate.place3.x}
					경도 : ${cate.place3.y}
					근처 대중교통 : ${cate.place3.subway}
					취향 : ${cate.place3.taste}
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
            <ul class="pager">
				<c:if test="${!cList.first}">
					<li class="previous">
						<a href="/course/detailedSearch.do?size=3&page=${cList.number-1}&taste=${taste}&subway=${subway}&x=${x}&y=${y}">&larr; Newer Posts</a>
					</li>
				</c:if>
				<c:if test="${!cList.last}">
					<li class="next">
						<a href="/course/detailedSearch.do?size=3&page=${cList.number+1}&taste=${taste}&subway=${subway}&x=${x}&y=${y}">Older Posts &rarr;</a>
					</li>
				</c:if>
			</ul>
            </div>  
            <!-- <ul id="placesList"></ul>-->
            
            <p id="result"></p>
         

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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
            var mapContainer;
            var map;
            window.onload = function() {
            	var subX = '${x}';
            	var subY = '${y}';
            	
            	if (subX.length == 0) {
            		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new kakao.maps.LatLng(37.577552,126.976869), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    }; 
                 	// 지도를 생성합니다    
                 	map = new kakao.maps.Map(mapContainer, mapOption); 	
            	} else {
            		console.log(subX);
            		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new kakao.maps.LatLng(parseFloat(subY), parseFloat(subX)), // 지도의 중심좌표
                        level: 4 // 지도의 확대 레벨
                    }; 
                 	// 지도를 생성합니다    
                 	map = new kakao.maps.Map(mapContainer, mapOption); 	
            	}
            }

            function panTo(data) {
                // 이동할 위도 경도 위치를 생성합니다 
               
            	var d0 = data.split(',');
                var moveLatLon = new kakao.maps.LatLng(parseFloat(d0[0]), parseFloat(d0[1]));
                
                // 지도 중심을 부드럽게 이동시킵니다
                // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
                map.panTo(moveLatLon);            
            }        

            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places(); 
            var markers = [];
            var x = 0;
            var y = 0;
            var clickSubwayButton = false;

            document.getElementById("javascript_btn1").addEventListener("click", javascript_onclikc);
            function javascript_onclikc() {
            	if (clickSubwayButton == false) {
            		if (existTwoSearchForm == true) {
            			x /= 2;
            			y /= 2;
            		}
            		//alert(x + ", " + y);
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
                removeMarker();
                var keyword1 = document.getElementById('keyword1').value;
                
                if (existTwoSearchForm == true) {
                	var keyword2 = document.getElementById('keyword2').value;
                }
                
                if (!keyword1.replace(/^\s+|\s+$/g, '')) {
                    alert('키워드를 입력해주세요!');
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
                	markers.push(displayMarker(data[0]));   
                	
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
            
            
            var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
            MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
            OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
            OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
            OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
            OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
            OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
            OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
            SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
            SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
            SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
            SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

        var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
            markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
            overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
            overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
            spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기
        	var cMarker = [];
        	
            // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
            function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

                // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
                var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
                    overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
                    clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
               
                // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
                var Marker = new kakao.maps.Marker({
                    map: map,
                    position: position,
                    image: normalImage
                });

                // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
                Marker.normalImage = normalImage;
                cMarker.push(Marker);
               
            }
            var polyline;
            var linePath = [], selectedMarker = null; // 클릭한 마커를 담을 변수
            function displayCourse(data0, data1, data2) {
            	// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
            	var latlng0; var latlng1; var latlng2;
            	var n = 0;
            	if (data0.length != 1) {
            		var d0 = data0.split(',');
            		latlng0 = new kakao.maps.LatLng(parseFloat(d0[0]), parseFloat(d0[1]));
            		linePath[0] = latlng0;
            	}
            	if (data1.length != 1) {
            		var d1 = data1.split(',');
            		latlng1 = new kakao.maps.LatLng(parseFloat(d1[0]), parseFloat(d1[1]));
            		linePath[1] = latlng1;
            	}
            	if (data2.length != 1) {
            		var d2 = data2.split(',');
            		latlng2 = new kakao.maps.LatLng(parseFloat(d2[0]), parseFloat(d2[1]));
            		linePath[2] = latlng2;
            	}

            	
            	if (polyline != null) {
            		polyline.setMap(null);
            	}
            
            	// 지도에 표시할 선을 생성합니다
            	polyline = new kakao.maps.Polyline({
            	    path: linePath, // 선을 구성하는 좌표배열 입니다
            	    strokeWeight: 5, // 선의 두께 입니다
            	    strokeColor: '#FF0000', // 선의 색깔입니다
            	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            	    strokeStyle: 'solid' // 선의 스타일입니다
            	});

            	
            	// 지도에 선을 표시합니다 
            	polyline.setMap(map);  
            	 if (cMarker != null) {
            		 for ( var i = 0; i < cMarker.length; i++ ) {
            			 cMarker[i].setMap(null);
                     }   
            		 cMarker = []; 
            	 }
            	 for (var i = 0, len = linePath.length; i < len; i++) {
                     var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
                         originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
                         overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
                         normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
                         clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
                         overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
                         
                     // 마커를 생성하고 지도위에 표시합니다
                     addMarker(linePath[i], normalOrigin, overOrigin, clickOrigin, i);
                 }
            }
            var infowindow = new kakao.maps.InfoWindow({zIndex:1});
            // 지도에 마커를 표시하는 함수입니다
            function displayMarker(place) {
                // 마커를 생성하고 지도에 표시합니다
                var subwayM = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(place.y, place.x) 
                });
                
                // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(subwayM, 'click', function() {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                    infowindow.open(map, subwayM);
                });
				var subwayName = place.place_name.split(' ');
                
				var nameEl;
				if (place.category_group_code == 'SW8') {
                nameEl = document.getElementById('resultsubway'), 
                itemStr = '<a href="/course/search.do?size=3&subway=' + subwayName[0] + '&x=' + place.x + '&y=' + place.y + '">' + subwayName[0] +'</a> 주변 코스 입니다.';
                nameEl.innerHTML = itemStr;
				}
                return nameEl;
               
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
            
            

            // MakrerImage 객체를 생성하여 반환하는 함수입니다
            function createMarkerImage(markerSize, offset, spriteOrigin) {
                var markerImage = new kakao.maps.MarkerImage(
                    SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
                    markerSize, // 마커의 크기
                    {
                        offset: offset, // 마커 이미지에서의 기준 좌표
                        spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
                        spriteSize: spriteImageSize // 스프라이트 이미지의 크기
                    }
                );
                
                return markerImage;
            }
            </script>
    </body>
</html>