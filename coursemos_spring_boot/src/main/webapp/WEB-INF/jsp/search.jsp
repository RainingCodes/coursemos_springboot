<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<style scoped>
.search {
        position:absolute;
        top:80px;
        left:200px;
        width:350px;
        height:500px;
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
            
		    	<form id="search" onsubmit="searchPlaces();">
		        	<search>
		        		<input id="keyword1" type="text" placeholder="장소를 입력하세요.">
					</search>
		        	<input id="plus" type="button" value="+" onclick="add_Place()"/>
		        </form>
		        <form onsubmit="searchPlaces(); return false;" method="post">
					<button type="submit">검색하기</button>
					<c:forEach var="cate" items="${tList}">
		    	    	<button type="button" class="btn btn-primary">${cate.name}</button>
		    	    </c:forEach>
				</form>
			
				<button id="javascript_btn1" type="button">역 찾기</button>
			
				<form name="result" method="post" action="<c:url value='/course/search'/>">
					<input type="hidden" name="x" value=0>
					<input type="hidden" name="y" value=0>
					<input type="submit" value="코스찾기">
				</form>
	   		</div> 
	        
			<div id="map"></div>        
			<div id="searchResult"></div>
         
            <div id="courseList">
            <c:forEach var="cate" items="${cList}">
              <div class="accordion accordion-flush" id="accordionFlushExample">
               <div class="accordion-item"> 
                  <h2 class="accordion-header" id="${cate.courseId}"> 
                    <button class="accordion-button collapsed" type="button" onclick="displayCourse('37.577552,126.976869','37.551245,126.988216','37.522470,126.939713')" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne_${cate.courseId}" aria-expanded="false" aria-controls="flush-collapseOne_${cate.courseId}">
                        ${cate.courseId}
                      <i class="bi bi-heart-fill"></i>${cate.courseContents}
                    </button>
                  </h2>
                  <div id="flush-collapseOne_${cate.courseId}" class="accordion-collapse collapse" aria-labelledby="${cate.courseId}" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                      <button class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="modal" data-bs-target="#exampleModal_${cate.courseId}_0" style="background-color:antiquewhite">
                        <div class="mx-sm-5 me-auto">
                          <div class="fw-bold">Subheading</div>
                          Cras justo odio
                        </div>
                        <i class="bi bi-heart-fill"></i>14
                      </button>
                      <button class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="modal" data-bs-target="#exampleModal_${cate.courseId}_1" style="background-color:antiquewhite">
                        <div class="mx-sm-5 me-auto">
                          <div class="fw-bold">Subheading</div>
                          Cras justo odio
                        </div>
                        <i class="bi bi-heart-fill"></i>14
                      </button>
                      <button class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="modal" data-bs-target="#exampleModal_${cate.courseId}_2" style="background-color:antiquewhite">
                        <div class="mx-sm-5 me-auto">
                          <div class="fw-bold">Subheading</div>
                          Cras justo odio
                        </div>
                        <i class="bi bi-heart-fill"></i>14
                      </button>
                    </div>
                  </div>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal_${cate.courseId}_0" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    ${cate.taste} |
                    ${cate.courseContents}
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="exampleModal_${cate.courseId}_1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    ${cate.taste} |
                   
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="exampleModal_${cate.courseId}_2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    ${cate.courseContents}
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
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
            
            //const url = 'https://api.odcloud.kr/api/15097002/v1/uddi:fb5d5e53-c0e6-446e-967c-94aea2dd4a2d?page=1&perPage=10&serviceKey=JII1QyQevHCT6KwLF5oLNwVmQrzSuKpTCt4pQSECQZFZtQ7Mg7k8uk38UCRIkewT1FpfCH%2Fy%2BKQ1eyVQRK4ZFw%3D%3D';
            const url = 'http://openapi.seoul.go.kr:8088/6243537573636e7338366274636b76/xml/culturalSpaceInfo/30/30';
            var xhr = new XMLHttpRequest();
            xhr.open('GET', url);
            xhr.onreadystatechange = function () {
            if (this.readyState == xhr.DONE) { // <== 정상적으로 준비되었을때
		            if(xhr.status == 200||xhr.status == 201){ // <== 호출 상태가 정상적일때
		            	makeMarker(xhr);
		            }
	            }
            };
            xhr.send('')
			function makeMarker(xml) {
            	var xmlData = xhr.responseXML;
                var x = xmlData.getElementsByTagName("X_COORD")[0].firstChild.nodeValue;
				var y = xmlData.getElementsByTagName("Y_COORD")[0].firstChild.nodeValue;
				var c = xmlData.getElementsByTagName("FAC_NAME")[0].firstChild.nodeValue;
            	var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: new kakao.maps.LatLng(x, y) // 마커의 위치
                });

                // 마커에 표시할 인포윈도우를 생성합니다 
                var infowindow = new kakao.maps.InfoWindow({
    					content: c // 인포윈도우에 표시할 내용
              
                });
                
                // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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

	            
	            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.577552,126.976869), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                }; 

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 

            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places(); 
            var markers = [];
            var x = 0;
            var y = 0;
            var clickSubwayButton = false;

            document.getElementById("javascript_btn1").addEventListener("click", javascript_onclikc);
            function javascript_onclikc(){
            	if (clickSubwayButton == false) {
            		if (existTwoSearchForm == true) {
            			x /= 2;
            			y /= 2;
            		}
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

            function displayCourse(data0, data1, data2) {
            	// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
            	var d0 = data0.split(',');
            	var d1 = data1.split(',');
            	var d2 = data2.split(',');
            	
            	var linePath = [
            	    new kakao.maps.LatLng(parseFloat(d0[0]), parseFloat(d0[1])),
            	    new kakao.maps.LatLng(parseFloat(d1[0]), parseFloat(d1[1])),
            	    new kakao.maps.LatLng(parseFloat(d2[0]), parseFloat(d2[1])) 
            	];

            	// 지도에 표시할 선을 생성합니다
            	var polyline = new kakao.maps.Polyline({
            	    path: linePath, // 선을 구성하는 좌표배열 입니다
            	    strokeWeight: 5, // 선의 두께 입니다
            	    strokeColor: '#FF0000', // 선의 색깔입니다
            	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            	    strokeStyle: 'solid' // 선의 스타일입니다
            	});

            	// 지도에 선을 표시합니다 
            	polyline.setMap(map);  
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