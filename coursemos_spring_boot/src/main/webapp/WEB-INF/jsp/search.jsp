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
        top:150px;
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
        <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <!-- <form id="search" onsubmit="searchPlaces(); return false;"> --> 
	            <form id="search" method="POST">
	                <input class="form-control" type="text" id="keyword" placeholder="장소를 입력하세요.">
	                <button type="submit">검색하기</button> 
	                <br>
	                <input id="plus" type="button" onclick="add_Place()" value="+"/>
	            </form>
	            <c:forEach var="cate" items="${tList}">
	            	<button type="button" class="btn btn-primary">${cate}</button>
	            </c:forEach>
			</div>
        </div>
        <div id="searchResult"></div>
        </div>   
        <div id="map"></div>
        
        <div id="courseList">
        <c:forEach var="cate" items="${cList}">
          <div class="accordion accordion-flush" id="accordionFlushExample">
           <div class="accordion-item">
              <h2 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                    ${cate.courseId}
                  <i class="bi bi-heart-fill"></i>${cate.courseContents}
                </button>
              </h2>
              <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                  <button class="list-group-item d-flex justify-content-between align-items-start" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:antiquewhite">
                    <div class="mx-sm-5 me-auto">
                      <div class="fw-bold">Subheading</div>
                      Cras justo odio
                    </div>
                    <i class="bi bi-heart-fill"></i>14
                  </button>
                  <button class="list-group-item d-flex justify-content-between align-items-start" style="background-color:rgb(255, 253, 121)"> 
                    <div class="mx-sm-5 me-auto">
                      <div class="fw-bold">Subheading</div>
                      Cras justo odio
                    </div>
                    <i class="bi bi-heart-fill"></i>14
                  </button>
                  <button class="list-group-item d-flex justify-content-between align-items-start" style="background-color:rgb(253, 242, 86)">
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
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                ${cate.taste}
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
        
        <ul id="placesList"></ul>
        <div id="pagination"></div>
        <p id="result"></p>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <script>
        	
            const add_Place = () => {
                const search = document.getElementById("search");
                const search2 = document.createElement('search2');
                search2.innerHTML = "<input id='search2' class='form-control' type='text' placeholder='장소를 입력하세요.' ><input type='button' value='-' onclick='remove(this)'>";
                search.appendChild(search2);
                document.getElementById('plus').remove();
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
            }
        
         // 마커를 담을 배열입니다
            var markers = [];

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.566825, 126.9786567), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 
            
         	// 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();  
            
            // 원
            var circle;
            
         	// 주소 - 좌표 변환 객체를 생성합니다. 
            var geocoder = new kakao.maps.services.Geocoder();

            // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({zIndex:1});
            
            // 키워드로 장소를 검색합니다
            searchPlaces();
            
            var markerMap = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
         	infowindow1 = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

         // 지도에 클릭 이벤트를 등록합니다
         // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
         kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        	        if (status === kakao.maps.services.Status.OK) {
        	        	var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
        	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
        	            
        	            var content = '<div class="bAddr">' +
        	                            '<span class="title">법정동 주소정보</span>' + 
        	                            detailAddr + 
        	                        '</div>';
        	            
        	            
			             // 클릭한 위도, 경도 정보를 가져옵니다 
			             var latlng = mouseEvent.latLng;
			             
			             if (circle) {
			         		circle.setMap(null);
			         	}
			             circle = new kakao.maps.Circle({
			                 center : new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()),  // 원의 중심좌표 입니다 
			                 radius: 200, // 미터 단위의 원의 반지름입니다 
			                 strokeWeight: 5, // 선의 두께입니다 
			                 strokeColor: '#75B8FA', // 선의 색깔입니다
			                 strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			                 strokeStyle: 'dashed', // 선의 스타일 입니다
			                 fillColor: '#CFE7FF', // 채우기 색깔입니다
			                 fillOpacity: 0.7  // 채우기 불투명도 입니다   
			             }); 
			         	
			         	// 지도에 원을 표시합니다 
			             circle.setMap(map); 
         	
			          // 마커를 클릭한 위치에 표시합니다 
			             markerMap.setPosition(mouseEvent.latLng);
			             markerMap.setMap(map);

			             // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
			             infowindow1.setContent(content);
			             infowindow1.open(map, markerMap);
			             
			             var keyword = detailAddr;
			          // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			          ps.keywordSearch( detailAddr, placesSearchCB); 
			          
			          var detailAddr = !!result[0].road_address ? result[0].road_address.address_name : '';
      	            detailAddr += result[0].address.address_name;
			          
			          var msg = "추천하는 위치는 \"" + result[0].address.address_name + "\"입니다.";
			          
			          var resultDiv = document.getElementById('searchResult');
			          resultDiv.innerHTML = msg;
        	     }
        	 });
         }); 
         
         


            // 키워드 검색을 요청하는 함수입니다
            function searchPlaces() {

            	if (circle) {
            		circle.setMap(null);
            	}
                var keyword = document.getElementById('keyword').value;

                if (!keyword.replace(/^\s+|\s+$/g, '')) {
                    alert('키워드를 입력해주세요!');
                    return false;
                }

                // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                ps.keywordSearch( keyword, placesSearchCB); 
            }

            // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    // 정상적으로 검색이 완료됐으면
                    // 검색 목록과 마커를 표출합니다
                    displayPlaces(data);

                    // 페이지 번호를 표출합니다
                    displayPagination(pagination);

                } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                    alert('검색 결과가 존재하지 않습니다.');
                    return;

                } else if (status === kakao.maps.services.Status.ERROR) {

                    alert('검색 결과 중 오류가 발생했습니다.');
                    return;

                }
            }

            // 검색 결과 목록과 마커를 표출하는 함수입니다
            function displayPlaces(places) {

                var listEl = document.getElementById('placesList'), 
                menuEl = document.getElementById('menu_wrap'),
                fragment = document.createDocumentFragment(), 
                bounds = new kakao.maps.LatLngBounds(), 
                listStr = '';
                
                // 검색 결과 목록에 추가된 항목들을 제거합니다
                removeAllChildNods(listEl);

                // 지도에 표시되고 있는 마커를 제거합니다
                removeMarker();
                
                for ( var i=0; i<places.length; i++ ) {

                    // 마커를 생성하고 지도에 표시합니다
                    var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                        marker = addMarker(placePosition, i), 
                        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    bounds.extend(placePosition);

                    // 마커와 검색결과 항목에 mouseover 했을때
                    // 해당 장소에 인포윈도우에 장소명을 표시합니다
                    // mouseout 했을 때는 인포윈도우를 닫습니다
                   
                    (function(marker, title) {
                        kakao.maps.event.addListener(marker, 'mouseover', function() {
                            displayInfowindow(marker, title);
                        });

                        kakao.maps.event.addListener(marker, 'mouseout', function() {
                            infowindow.close();
                        });

                        itemEl.onmouseover =  function () {
                            displayInfowindow(marker, title);
                        };

                        itemEl.onmouseout =  function () {
                            infowindow.close();
                        };
                    })(marker, places[i].place_name);

                    fragment.appendChild(itemEl);
                }

                // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                listEl.appendChild(fragment);
                menuEl.scrollTop = 0;

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
                
				var latlng = map.getCenter();
            	
            	circle = new kakao.maps.Circle({
                    center : new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()),  // 원의 중심좌표 입니다 
                    radius: 200, // 미터 단위의 원의 반지름입니다 
                    strokeWeight: 5, // 선의 두께입니다 
                    strokeColor: '#75B8FA', // 선의 색깔입니다
                    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'dashed', // 선의 스타일 입니다
                    fillColor: '#CFE7FF', // 채우기 색깔입니다
                    fillOpacity: 0.7  // 채우기 불투명도 입니다   
                }); 
            	
            	// 지도에 원을 표시합니다 
                circle.setMap(map); 
            	

            }

            // 검색결과 항목을 Element로 반환하는 함수입니다
            function getListItem(index, places) {

                var el = document.createElement('li'),
                itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                            '<div class="info">' +
                            '   <h5>' + places.place_name + '</h5>';

                if (places.road_address_name) {
                    itemStr += '    <span>' + places.road_address_name + '</span>' +
                                '   <span class="jibun gray">' +  places.address_name  + '</span>';
                } else {
                    itemStr += '    <span>' +  places.address_name  + '</span>'; 
                }
                             
                  itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                            '</div>';           

                el.innerHTML = itemStr;
                el.className = 'item';

                return el;
            }

            // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
            function addMarker(position, idx, title) {
                var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                    imgOptions =  {
                        spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                        spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                    },
                    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                        marker = new kakao.maps.Marker({
                        position: position, // 마커의 위치
                        image: markerImage 
                    });

                marker.setMap(map); // 지도 위에 마커를 표출합니다
                markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                return marker;
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
                for ( var i = 0; i < markers.length; i++ ) {
                    markers[i].setMap(null);
                }   
                markers = [];
            }

            // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
            function displayPagination(pagination) {
                var paginationEl = document.getElementById('pagination'),
                    fragment = document.createDocumentFragment(),
                    i; 

                // 기존에 추가된 페이지번호를 삭제합니다
                while (paginationEl.hasChildNodes()) {
                    paginationEl.removeChild (paginationEl.lastChild);
                }

                for (i=1; i<=pagination.last; i++) {
                    var el = document.createElement('a');
                    el.href = "#";
                    el.innerHTML = i;

                    if (i===pagination.current) {
                        el.className = 'on';
                    } else {
                        el.onclick = (function(i) {
                            return function() {
                                pagination.gotoPage(i);
                            }
                        })(i);
                    }

                    fragment.appendChild(el);
                }
                paginationEl.appendChild(fragment);
            }

            // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
            // 인포윈도우에 장소명을 표시합니다
            function displayInfowindow(marker, title) {
                var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

                infowindow.setContent(content);
                infowindow.open(map, marker);
            }

             // 검색결과 목록의 자식 Element를 제거하는 함수입니다
            function removeAllChildNods(el) {   
                while (el.hasChildNodes()) {
                    el.removeChild (el.lastChild);
                }
            }

            function searchAddrFromCoords(coords, callback) {
                // 좌표로 행정동 주소 정보를 요청합니다
                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
            }

            function searchDetailAddrFromCoords(coords, callback) {
                // 좌표로 법정동 상세 주소 정보를 요청합니다
                geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            }
            </script>
    </body>
</html>