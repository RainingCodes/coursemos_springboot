<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>코스 작성</title>
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
<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<div>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="#!">코스 등록</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">제휴 등록</a></li>
				</ul>
			</div>
			<div align="center">
				<button class="navbar-brand" type="button" style="border: none;">
					<img src="../img/logo.png" style="width: 100px;">
				</button>
				<!-- <a class="navbar-brand" href="#!">코스모스</a> -->
			</div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#">OOO님
							환영합니다!</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">150
							Points</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">My
							page</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page content-->
	<div class="container mt-5">
		<div class="row" style="margin-left: 25%;">
			<form:form modelAttribute="course" name="form" action="view" method="POST">
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
									<form:input path="courseName" class="form-control" name="inputTitle" type="text"
										placeholder="코스 이름을 입력하세요"/>
									<form:errors path="courseName" cssClass="error"/>
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
							<form:radiobutton path="taste" name="taste" value="act" onclick='getTaste(event)'/>활동적인
							<form:radiobutton path="taste" name="taste" value="cal" onclick='getTaste(event)'/>잔잔한
							<form:radiobutton path="taste" name="taste" value="hea" onclick='getTaste(event)'/>힐링
							<form:radiobutton path="taste" name="taste" value="nat" onclick='getTaste(event)'/>자연적인<br>
							<form:radiobutton path="taste" name="taste" value="exp" onclick='getTaste(event)'/>체험적
							<form:radiobutton path="taste" name="taste" value="ent" onclick='getTaste(event)'/>즐거운
							<form:radiobutton path="taste" name="taste" value="ret" onclick='getTaste(event)'/>복고풍
							<br><form:errors path="taste" cssClass="error"/>
						</div>	
						<br><br>						
						<!-- 지도 -->
						<h5>코스 경로에 추가할 장소를 입력하세요.</h5>
						<input class="form-control" id='keyword' style="float:left; width:75%;" onchange='onClickBtn()' placeholder="장소 검색">
	
						<div style="float: right; margin-right: 60px;">
							<input type="button" onclick="onClickBtn()"
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
					        
					        function placesSearchCBSubway (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
									//alert(data[0].place_name);		
									document.getElementById('subway1').value = data[0].place_name;
									
									if (document.getElementById('subway2')){
										document.getElementById('subway2').value = data[0].place_name;									
									}
									if (document.getElementById('subway3')){
										document.getElementById('subway3').value = data[0].place_name;									
									}
							    } 
							}
							
			
							// submit할 address 입력 시 호출되는 콜백함수 입니다
							function placesSearchCB1 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
							        document.getElementById('place1CoordX').value = data[0].y;
							        document.getElementById('place1CoordY').value = data[0].x;
							        
							        places1.categorySearch('SW8', placesSearchCBSubway, { //첫번째 장소 기준으로 역 찾기
										location: new kakao.maps.LatLng(data[0].y, data[0].x)
									});
							        
							    } 
							}
							function placesSearchCB2 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
							        document.getElementById('place2CoordX').value = data[0].y;
							        document.getElementById('place2CoordY').value = data[0].x;
							        
							    } 
							}
							function placesSearchCB3 (data, status, pagination) {
							    if (status === kakao.maps.services.Status.OK) {
							        document.getElementById('place3CoordX').value = data[0].y;
							        document.getElementById('place3CoordY').value = data[0].x;
							        
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
							
							function copy_to_clipboard(a) {    
								  var copyText = document.getElementById(a);
								  copyText.select();
								  copyText.setSelectionRange(0, 99999);
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
						<h5>최대 3군데의 장소를 추가할 수 있습니다 <input type="button" name="add" value="+" id="add_btn" style="border: none; border-radius: 5px; text-align: center; margin-left: 30%; height: 30px;"></h5>
						<input type="hidden" id="place" name="place">
						<br>
						<b>1번째 장소</b>
						<form:input path="place1.placeName" class="form-control" type="text" placeholder="장소" id='placeName1' name="place1.placeName" style="width: 95%"/>
						<form:errors path="place1.placeName" cssClass="error"/>
						<!-- 지번주소를 입력하면 자동으로 x, y, subway 생성되는데 double형에 대한 required 처리가 어려워서 subway로 대체하여 validate 처리 -->
						<input class="form-control" type="text" placeholder="상세 주소(지번)" id='address1' name="address1" onchange="onChangeAddress()" style="width: 95%" >
						<form:input path="place1.subway" type="hidden" id="subway1" name="place1.subway"/>
						<form:errors path="place1.subway" cssClass="error"/>
						<input class="form-control" type="text" placeholder="상세 주소(도로명, 없을 경우 생략)" name="road_address1" id='road_address1' style="width: 95%"><br> 									
                        <input type="hidden" id="place1CoordX" name="place1.x">
						<input type="hidden" id="place1CoordY" name="place1.y">
						<script>
						
						var cnt = 1; 
						$(document).ready(function () {
							  $(document).on("click", "input[name='add']", function () {
								  if(cnt > 3)
									  alert("최대 입력 값을 초과했습니다.");
								  else {
									  cnt++;
									  if(cnt == 2){
										  $("#description").before('<hr style="width: 95%"><b>2번째 장소</b>'+ '<br><p><input class="form-control" type="text" placeholder="장소" name="place2.placeName" style="width: 95%" required><input class="form-control" type="text" placeholder="상세 주소(지번)" id="address2" onchange="onChangeAddress()" style="width: 95%" required><input class="form-control" type="text" placeholder="상세 주소(도로명, 없을 경우 지번주소만 표시됩니다.)" name="road_address" style="width: 95%"><br></p>');
										  $("#description").before('<input type="hidden" id="place2Taste" name="place2.taste" />');
										  $("#description").before('<input type="hidden" id="place2CoordX" name="place2.x">');
										  $("#description").before('<input type="hidden" id="place2CoordY" name="place2.y"> ');
										  $("#description").before('<input type="hidden" id="subway2" name="place2.subway">');
									  }
									  if (cnt ==3){
										  $("#description").before('<hr style="width: 95%"><b>3번째 장소</b>'+ '<br><p><input class="form-control" type="text" placeholder="장소" name="place3.placeName" style="width: 95%" required><input class="form-control" type="text" placeholder="상세 주소(지번)" id="address3" onchange="onChangeAddress()" style="width: 95%" required><input class="form-control" type="text" placeholder="상세 주소(도로명, 없을 경우 지번주소만 표시됩니다.)" name="road_address" style="width: 95%"><br></p>');
										  $("#description").before('<input type="hidden" id="place3Taste" name="place3.taste" /> ');
										  $("#description").before('<input type="hidden" id="place3CoordX" name="place3.x">');
										  $("#description").before('<input type="hidden" id="place3CoordY" name="place3.y"> ');
										  $("#description").before('<input type="hidden" id="subway3" name="place3.subway"/> ');
									  }
									}
								});
							});
						
						</script>
						
						
                        <!-- Post content-->
                        <h5 id="description">코스에 대한 설명을 입력하세요</h5>
                        <form:input path="courseContents" class="form-control" name="contents" type="text" style="height:300px"/>
                        <form:errors path="courseContents" cssClass="error"/>
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