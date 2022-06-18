<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>코스 작성</title>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
	<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
	<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<style>
	.error {
		color:red;
	}
</style>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<body>

	<div class="container mt-5">
		<div class="row" style="margin-left: 25%;">
			<form:form modelAttribute="course" name="form" action="../view/${updateCourse.courseId}" method="POST">
				<div class="col-lg-8">
					<!-- Post content-->
					<article>
						<!-- Post header-->
						<header class="mb-4">
							<h1 style="text-align: center;">코스 작성</h1>
							<p></p>
							<!-- Post title-->
							<div class="card-body">
								<div class="input-group">
									<input class="form-control" name="courseName" type="text"
										value="${updateCourse.courseName}" required>
								</div>
							</div>
						</header>						
						<form:input path="writtenDate" type="hidden" id="writtenDate"/>						
						<script>
							var date = new Date().toISOString().substring(0, 10);
							document.getElementById("writtenDate").value=date;
						</script>					
						<div class="upload"></div>
						<h5>코스의 분위기를 선택하세요</h5>
						<div class="selectTaste"
							style="display: inline-block; width: 300px; line-height: 45px;">
							<form:radiobutton path="taste" name="taste" id="act" value="act"/>활동적인
							<form:radiobutton path="taste" name="taste" id="cal" value="cal"/>잔잔한
							<form:radiobutton path="taste" name="taste" id="hea" value="hea"/>힐링
							<form:radiobutton path="taste" name="taste" id="nat" value="nat"/>자연적인<br>
							<form:radiobutton path="taste" name="taste" id="exp" value="exp"/>체험적
							<form:radiobutton path="taste" name="taste" id="ent" value="ent"/>즐거운
							<form:radiobutton path="taste" name="taste" id="ret" value="ret"/>복고풍
						</div>
						<form:errors path="taste" cssClass="error"/>
						<script>
						$("#${updateCourse.taste}").prop('checked',true);
						</script>
						<br><br>						
						<!-- 지도 -->
						<h5>코스 경로에 추가할 장소를 입력하세요.</h5>
						<input class="form-control" id='keyword' style="float:left; width:75%;" onchange='onClickBtn()' placeholder="장소 검색">
						
						<div style="float: right; margin-right: 60px;">
							<input type="button" onclick="onClickBtn();"
								style="border: none; border-radius: 5px; text-align: center; margin-left:10px; width: 80px; height: 34px;"
								value="검색">
						</div>
						<br><br>
						<div id="map"
							style="width: 600px; height: 300px; margin-top: 10px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
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
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
							
							// 장소 검색 객체를 생성합니다
							var ps = new kakao.maps.services.Places();
							var places1 = new kakao.maps.services.Places();
							
							// 키워드로 장소를 검색합니다
							ps.keywordSearch('', placesSearchCB); 
							
							function onClickBtn()  {
								  let name = document.getElementById('keyword').value;
								  ps.keywordSearch(name, placesSearchCB);
								}
							
							// 키워드 검색 완료 시 호출되는 콜백함수 입니다
							function placesSearchCB (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
							
							        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
							        // LatLngBounds 객체에 좌표를 추가합니다
							        var bounds = new kakao.maps.LatLngBounds();
							
							        for (var i=0; i<data.length; i++) {
							            displayMarker(data[i]);    
							            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
							        }
							
							        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
							        map.setBounds(bounds);
							    } 
							}
							
							function onChangeAddress(){
								let address1 = document.getElementById('address1').value;
								ps.keywordSearch(address1, placesSearchCB1);
								

								if(document.getElementById('address2')){
									let address2 = document.getElementById('address2').value;
									ps.keywordSearch(address2, placesSearchCB2);
								}
								
								if(document.getElementById('address3')){
									let address3 = document.getElementById('address3').value;
									ps.keywordSearch(address3, placesSearchCB3);
								}
	
							}        
					        
							// 역 찾기
					        function placesSearchCBSubway1 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {	
									document.getElementById('subway1').value = data[0].place_name;
							    } 
							}
					        
					        function placesSearchCBSubway2 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
										document.getElementById('subway2').value = data[0].place_name;									
							    } 
							}
					        
					        function placesSearchCBSubway3 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
										document.getElementById('subway3').value = data[0].place_name;									
							    } 
							}
			
							// address 입력 시 호출되는 콜백함
							function placesSearchCB1 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
							        document.getElementById('place1CoordX').value = data[0].y;
							        document.getElementById('place1CoordY').value = data[0].x;
							        
							        places1.categorySearch('SW8', placesSearchCBSubway1, {
										location: new kakao.maps.LatLng(data[0].y, data[0].x)
									});
							        
							    } 
							}
							function placesSearchCB2 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
							        document.getElementById('place2CoordX').value = data[0].y;
							        document.getElementById('place2CoordY').value = data[0].x;
							        
							        places1.categorySearch('SW8', placesSearchCBSubway2, {
										location: new kakao.maps.LatLng(data[0].y, data[0].x)
									});
							    } 
							}
							function placesSearchCB3 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
							        document.getElementById('place3CoordX').value = data[0].y;
							        document.getElementById('place3CoordY').value = data[0].x;
							        
							        places1.categorySearch('SW8', placesSearchCBSubway3, {
										location: new kakao.maps.LatLng(data[0].y, data[0].x)
									});
							    } 
							}
							
							 // 지도에 마커를 표시하는 함수입니다
							function displayMarker(place) {
							    
								let coord = new kakao.maps.LatLng(place.y, place.x);
								 
							    // 마커를 생성하고 지도에 표시합니다
							    var marker = new kakao.maps.Marker({
							        map: map,
							        position: coord 
							    });   
							
							    // 마커에 클릭이벤트를 등록합니다
							    kakao.maps.event.addListener(marker, 'click', function() {
							        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
							        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
							        infowindow.open(map, marker);
					        
							        document.getElementById('resultPlaceName').value = place.place_name;
							     		        
							        let lat = place.y;
							    	let lng = place.x;
							    	getAddr(lat, lng);
							    });	   	
							    
							    
							}		
							function getAddr(lat, lng){
								let geocoder = new kakao.maps.services.Geocoder();
								
								let coord = new kakao.maps.LatLng(lat, lng);
								let callback = function(result, status){
									if (status == kakao.maps.services.Status.OK){
										document.getElementById('resultAddress').value = result[0].address.address_name;
										document.getElementById('resultRoadAddress').value = result[0].road_address.address_name;
									}
								};
								geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
							}
							
							function getAddrToInput(lat, lng, num){
								let geocoder = new kakao.maps.services.Geocoder();
								
								let coord = new kakao.maps.LatLng(lat, lng);
								let callback = function(result, status){
									if (status == kakao.maps.services.Status.OK){
										document.getElementById('address'+num).value = result[0].address.address_name;
										document.getElementById('road_address'+num).value = result[0].road_address.address_name;
									}
								};
								geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
							}

							function copy_to_clipboard(a) {    
								  var copyText = document.getElementById(a);
								  copyText.select();
								  copyText.setSelectionRange(0, 99999);
								  document.execCommand("Copy");
								  alert('복사되었습니다.');
							}
							</script>
						
						<br><b>마커를 클릭하면 해당 장소의 이름과 주소가 표시됩니다.
						<br>복사/붙여넣기로 간편하게 아래 폼을 완성해보세요!</b><br>
						<br>					
						<b>장소: </b><input type="text" size="59.5px" style="border:none;" name="resultPlaceName" id="resultPlaceName" readonly><input type="button" style="height:23px;border:none;border-radius:5px;" onclick="copy_to_clipboard('resultPlaceName')" value="복사"><br>
						<b>지번 주소: </b><input type="text" size="54.5px" style="border:none;" name="resultAddress" id="resultAddress" readonly><input type="button" style="height:23px;border:none;border-radius:5px;" onclick="copy_to_clipboard('resultAddress')" value="복사"><br>
						<b>도로명 주소: </b><input type="text" size="52px" style="border:none;" name="resultRoadAddress" id="resultRoadAddress" placeholder="없을 경우 지번주소만 표시됩니다." readonly><input type="button" style="height:23px;border:none;border-radius:5px;" onclick="copy_to_clipboard('resultRoadAddress')" value="복사"><br>
						<br>					
						<!-- 코스 추가 -->
						<h5>최대 3군데의 장소를 추가할 수 있습니다</h5>
						<input type="hidden" id="place" name="place">

						<br>
						<b>1번째 장소</b>
						<input class="form-control" type="text" placeholder="장소" id='placeName1' name="place1.placeName1" style="width: 95%" value="${updateCourse.place1.placeName}"required> 
						<input class="form-control" type="text" placeholder="상세 주소(지번)" id='address1' name="address1" onchange="onChangeAddress()" style="width: 95%" required>
						<input class="form-control" type="text" placeholder="상세 주소(도로명, 없을 경우 생략)" name="road_address1" id='road_address1' style="width: 95%"><br> 											
						<input type="hidden" id="place1CoordX" name="place1.x" value="${updateCourse.place1.x}">
						<input type="hidden" id="place1CoordY" name="place1.y" value="${updateCourse.place1.y}">
						
						<script>
	                        var coordscoords = new kakao.maps.LatLng(${updateCourse.place1.x}, ${updateCourse.place1.y});
	    					var callback1 = function(result1, status1){
	    						if (status1 == kakao.maps.services.Status.OK){
	    							document.getElementById("address1").value = result1[0].address.address_name;
	    							document.getElementById("road_address1").value = result1[0].road_address.address_name;
	    						}
	    					}
	    					geocoder.coord2Address(coordscoords.getLng(), coordscoords.getLat(), callback1);	
    					</script>
						
						<b>2번째 장소</b>
						<input class="form-control" type="text" placeholder="장소" id='placeName2' name="place2.placeName2" style="width: 95%" value="${updateCourse.place2.placeName}"required> 
						<input class="form-control" type="text" placeholder="상세 주소(지번)" id='address2' name="address2" onchange="onChangeAddress()" style="width: 95%" required>
						<input class="form-control" type="text" placeholder="상세 주소(도로명, 없을 경우 생략)" name="road_address2" id='road_address2' style="width: 95%"><br> 					
						<input type="hidden" id="place2CoordX" name="place2.x" value="${updateCourse.place2.x}">
						<input type="hidden" id="place2CoordY" name="place2.y" value="${updateCourse.place2.y}">
						<c:if test="${updateCourse.place2 != null }">
						<script>
							if (${updateCourse.place2 != null}){
	    						var coordscoords2 = new kakao.maps.LatLng(${updateCourse.place2.x}, ${updateCourse.place2.y});
	    						var callback2 = function(result2, status2){
	    							if (status2 == kakao.maps.services.Status.OK){
	    								document.getElementById("address2").value = result2[0].address.address_name;
	    								document.getElementById("road_address2").value = result2[0].road_address.address_name;
	    							
	    							}
	    						};
	    						geocoder.coord2Address(coordscoords2.getLng(), coordscoords2.getLat(), callback2);
	    					}
						</script>
						</c:if>
						<b>3번째 장소</b>
						<input class="form-control" type="text" placeholder="장소" id='placeName3' name="place3.placeName3" style="width: 95%" value="${updateCourse.place3.placeName}"required> 
						<input class="form-control" type="text" placeholder="상세 주소(지번)" id='address3' name="address3" onchange="onChangeAddress()" style="width: 95%" required>
						<input class="form-control" type="text" placeholder="상세 주소(도로명, 없을 경우 생략)" name="road_address3" id='road_address3' style="width: 95%"><br> 					
						<input type="hidden" id="place3CoordX" name="place3.x" value="${updateCourse.place3.x}">
						<input type="hidden" id="place3CoordY" name="place3.y" value="${updateCourse.place3.y}">
						<c:if test="${updateCourse.place3 != null }">
						<script>	    					
	     					if (${updateCourse.place3 != null}){
	    						var coordscoords3 = new kakao.maps.LatLng(${updateCourse.place3.x}, ${updateCourse.place3.y});						
	    						var callback3 = function(result3, status3){
	    							if (status3 == kakao.maps.services.Status.OK){
	    								document.getElementById("address3").value = result3[0].address.address_name;
	    								document.getElementById("road_address3").value = result3[0].road_address.address_name;
	    							}
	    						};
	    						geocoder.coord2Address(coordscoords3.getLng(), coordscoords3.getLat(), callback3);
	    					}
                        </script>
                        </c:if>

                          <!-- Post content-->
                        <h5 id="description">코스에 대한 설명을 입력하세요</h5>
                        <input class="form-control" name="contents" type="text" value="${updateCourse.courseContents }" style="height:300px">
  
                        <br>
                        <button type="submit" style="width:100%; height:40px; border:none; border-radius:5px; text-align: center;">등록하기</button>
                    </article>
                    <br><br><br>
                </div>
                </form:form>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Coursemos 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>




</body>
<input type="button" name="add" value="+" id="add_btn" style="border:none;border-radius:5px; text-align: center; margin-left:300px; height: 30px;">
</html>