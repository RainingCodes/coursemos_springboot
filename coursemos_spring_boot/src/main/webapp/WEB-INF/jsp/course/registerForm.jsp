<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>코스 작성</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<div>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="#!">코스
							등록</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">제휴
							등록</a></li>
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
			<form action="view" method="post">
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
									<input class="form-control" type="text" v-model="inputTitle"
										placeholder="코스 이름을 입력하세요">
								</div>
								<!-- <div v-if="!titleValid">유효하지 않은 제목입니다.</div> -->
							</div>
						</header>

						<!-- Preview image figure-->
						<img class="img-fluid rounded" id="preview-image"
							src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" /> <br>
						<br>
						<br>
						<h5>코스를 대표하는 이미지를 업로드하세요</h5>
						<input type="file" id="real-input" class="image_inputType_file"
							accept="../img/*"> <br>
						<br>
						<br>
						<div class="upload"></div>
						<h5>코스의 분위기를 선택하세요</h5>
						<div class="selectTaste"
							style="display: inline-block; width: 300px; line-height: 45px;">
							<!-- <input type="checkbox" name="category" v-for="item in taste"><span v-html="item"></span> -->
							<input type="checkbox" name="category" value="active">활동적인
							<input type="checkbox" name="category" value="calm">잔잔한
							<input type="checkbox" name="category" value="healing">힐링
							<input type="checkbox" name="category" value="nature">자연적인<br>
							<input type="checkbox" name="category" value="official">공식적인
							<input type="checkbox" name="category" value="experience">체험적
							<input type="checkbox" name="category" value="entertaining">즐거운
							<input type="checkbox" name="category" value="retro">복고풍
						</div>
						<br><br>						
						<!-- 지도 -->
						<input class="form-control" id='keyword' style="float:left; width:75%;" onchange='onClickBtn()' placeholder="장소 검색">
						<script>
						function onClickBtn()  {
						  let name = document.getElementById('keyword').value;
						  ps.keywordSearch(name, placesSearchCB);
						}
						</script>
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
							
							// 키워드로 장소를 검색합니다
							ps.keywordSearch('', placesSearchCB); 
							
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
					        
							        document.getElementById('placeName').value = place.place_name;
							        
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
										document.getElementById('address').value = result[0].address.address_name;
										document.getElementById('road_address').value = result[0].road_address.address_name;
									}
								};
								geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
							}
							
							
							 
							</script>
						<br>
										
						<!-- 코스 추가 -->
						<h5>코스 경로에 추가할 장소를 입력하세요 <input type="button" name="add" onclick="addPlace()" value="+" id="add_btn" style="border: none; border-radius: 5px; text-align: center; margin-left: 30%; height: 30px;"></h5>
						<input class="form-control" type="text" placeholder="장소" id='placeName' style="width: 95%"><br> 
						<input class="form-control" type="text" placeholder="상세 주소(지번)" id='address' style="width: 95%">
						<input class="form-control" type="text" placeholder="상세 주소(도로명, 없을 경우 지번주소만 표시됩니다.)" id='road_address' style="width: 95%"><br> 

						<input class="form-control" type="text"
							placeholder="소요 비용(원)" style="width: 95%"><br>
						<input class="form-control" type="text" placeholder="소요 시간(분)" style="width: 95%"><br>					
                        <!-- Post content-->
                        <h5>코스에 대한 설명을 입력하세요</h5>
                        <input class="form-control" type="text" style="height:300px"><br>
                        <button type="submit" style="width:100%; height:40px; border:none; border-radius:5px; text-align: center;">등록하기</button>
                    </article>
                    <br><br><br>
                </div>
                </form>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <!--<div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                            </div>
                        </div>
                    </div> -->
					<!-- 위젯-->
                    <!-- <div class="card mb-4">
                        <div class="card-header">Side Widget</div>
                        <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                    </div> -->
                </div>
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
		<script>
	    /* new Vue({
	    	el: '.selectTaste',
	    	data : {
	    		taste: ['활동적인', '잔잔한', '힐링', '자연적인', '공식적인', '체험적', '즐거운', '복고풍']
	    	}
	    }) */
	   
	    	export default {
 			data() {
   				return {
     				inputTitle: null,
     				courseInfo: '',
     				checked: []
   				};
 			},
 			computed: {
     			titleValid(){
        			return /^[A-Za-zㄱ-ㅎ]+$/.test(this.inputTitle)
			    }
			 }
			}
	    </script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</body>
<input type="button" name="add" value="+" id="add_btn" style="border:none;border-radius:5px; text-align: center; margin-left:300px; height: 30px;">
<script>
    	function getImageFiles(e) {
    	  const files = e.currentTarget.files;
   		  console.log(typeof files, files);
    	}

    	const realUpload = document.querySelector('.real-input');
    	const upload = document.querySelector('.upload');

    	upload.addEventListener('click', () => realUpload.click());
    	realUpload.addEventListener('change', getImageFiles);
</script>

</html>