<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String inputTitle = request.getParameter("inputTitle");
	String placeName1 = request.getParameter("placeName1");
	String placeName2 = request.getParameter("placeName2") == null ? "": request.getParameter("placeName2");
	String placeName3 = request.getParameter("placeName3") == null ? "": request.getParameter("placeName3");
	String[] placeNameList = {placeName1, placeName2, placeName3};
	
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2") == null ? "": request.getParameter("address2");
	String address3 = request.getParameter("address3") == null ? "": request.getParameter("address3");
	String[] addressList = {address1, address2, address3};
	
	String roadAddress1 = request.getParameter("road_address1"); //서울특별시 성북구 화랑로13길 60
	String roadAddress2 = request.getParameter("road_address2") == null ? "": request.getParameter("road_address2");
	String roadAddress3 = request.getParameter("road_address3") == null ? "": request.getParameter("road_address3");
	String roadAddressList[] = {roadAddress1, roadAddress2, roadAddress3};
	
	String writtenDate = request.getParameter("writtenDate");
	String category = request.getParameter("category");
	String contents = request.getParameter("contents");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>코스 상세페이지</title>
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
					<li class="nav-item"><a class="nav-link active" href="#!">코스 등록</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">제휴 등록</a></li>
				</ul>
			</div>
			<div align="center">
				<button class="navbar-brand" type="button" style="border: none;">
					<img src="../../img/logo.png" style="width: 100px;">
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
					<li class="nav-item"><a class="nav-link" href="#">OOO님 환영합니다!</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">150 Points</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">My page</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page content-->
	<form action="" method="post">
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?c17b5563968f2fffd356919521833ce2&libraries=services"></script>
		
		<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article style="margin-left:25%;">
					<!-- Post header-->
					<header class="mb-4">
						<h2 style="font-weight:bold;text-align:center;" id="courseTitle">『 ${course.courseName} 』</h2>
					</header>
					<div>
					<!-- Post title-->
					<div style="margin-left:500px;">작성일: ${course.writtenDate }</div>
					<br>
					<h5 style="font-weight:bold;">코스의 분위기</h5>
					<!-- <div>활동적인, 즐거운</div> -->
					<div>${course.taste }</div>
					<br>
					<h5 style="font-weight:bold;">코스 경로 살펴보기</h5>
					<br>
					<table>
						<tr>
							<th><div>${place1.placeName }</div></th>
						</tr>
						<tr>
							<td><div id="resultAddress1"></div></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<c:if test="${place2.placeName != null}">
							<tr>
								<th><div>${place2.placeName }</div></th>
							</tr>
							<tr>
								<td><div id="resultAddress2"></div></td>
							</tr>
							<tr>
							<td><br></td>
							</tr>
						</c:if>
						<c:if test="${place3.placeName != null}">
							<tr>
								<th><div>${place3.placeName }</div></th>
							</tr>
							<tr>
								<td><div id="resultAddress3"></div></td>
							</tr>
							<tr>
							<td><br></td>
							</tr>
						</c:if>
						
					</table>
					
					<!-- 지도 -->
					<h5 style="font-weight:bold;">코스 경로 미리보기</h5>
					<!-- 지도를 표시할 div 입니다 -->
					<div id="map" style="width:100%;height:350px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
					<script>
					
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

				    
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					    mapOption = { 
					        center: new kakao.maps.LatLng(${place1.x}, ${place1.y}), // 지도의 중심좌표
					        level: 5 // 지도의 확대 레벨
					};
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
				    
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);     

					var linePath = new Array();
					
					var coords1 = new kakao.maps.LatLng(${place1.x}, ${place1.y});
					linePath[0] = coords1;
					var callback = function(result, status){
						if (status == kakao.maps.services.Status.OK){
							document.getElementById("resultAddress1").innerText = result[0].address.address_name;
							var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords1
					        });
						}
					}
					geocoder.coord2Address(coords1.getLng(), coords1.getLat(), callback);
										
					
					if (${place2 != null}){
						var coords2 = new kakao.maps.LatLng(${place2.x}, ${place2.y});
						linePath[1] = coords2;
						var callback2 = function(result, status){
							if (status == kakao.maps.services.Status.OK){
								document.getElementById("resultAddress2").innerText = result[0].address.address_name;								
								var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords2
						        });
							}
						}
						geocoder.coord2Address(coords2.getLng(), coords2.getLat(), callback2);
					}
					
					if (${place3 != null}){
						var coords3 = new kakao.maps.LatLng(${place3.x}, ${place3.y});
						linePath[2] = coords3;
						var callback3 = function(result, status){
							if (status == kakao.maps.services.Status.OK){
								document.getElementById("resultAddress3").innerText = result[0].address.address_name;
								var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords3
						        });								
							}
						}
						geocoder.coord2Address(coords3.getLng(), coords3.getLat(), callback3);
					}
					
					var polyline = new kakao.maps.Polyline({
						path: linePath,
						strokeWeight: 5,
						strokeColor: '#FF0000',
						strokeOpacity: 0.7,
						strokeStyle: 'solid'
					});
					
					polyline.setMap(map);
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</script>
					<br><br>
					<!-- Post content-->
					<h5 style="font-weight:bold;">코스에 대한 설명</h5>
					<table class="form-control" style="height:200px; border-radius: 5px;">
						<tr>
							<td>${course.courseContents }</td>
						</tr>
					</table>
					<br>
					
					</div>
					<div align="center">

					<a id="kakao-link-btn" href="javascript:kakaoShare();" style="width:15%; height:2px;">
						<img
							src = "https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
							alt="카카오톡 공유"
						/>
					</a>

					<!-- kakao sdk 호출 -->
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					
					<script type="text/javascript">
					  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
					  Kakao.init('76e55c5ff78afa2dcf5a29a283774395');
					
					  // SDK 초기화 여부를 판단합니다.
					  console.log(Kakao.isInitialized());
				
					  function kakaoShare() {
					    Kakao.Link.sendDefault({
					        objectType: 'feed',
					        content: {
					          title: '당신에게 맞는 코스를 찾아보세요!',
					          imageUrl: '',
					          link: {
					            mobileWebUrl: 'http://localhost:8080',
					            webUrl: 'http://localhost:8080',
					          },
					        },
					        buttons: [
					          {
					            title: '자세히보기',
					            link: {
					              mobileWebUrl: 'http://localhost:8080/course/view/${course.courseId}',
					              webUrl: 'http://localhost:8080/course/view/${course.courseId}',
					            },
					          },
					        ],
					    })
					  }
					  				  
					</script>
					
					<%-- <c:if test="${not empty nickname}"> <!-- 로그인 후 뜨는지 확인 --> --%>
						<img class="image" style="width:10%; height:10%;" src="../../img/like1.png" />	
						<img class="scrapImage" style="width:9%; height:9%;" src="../../img/scrap1.png"/>
						<button type="button" onclick="location.href='../view/coupon/get'" style="width:15%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">쿠폰 발급</button>
						<button type="button" style="width:15%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">신고</button>			
					<%-- </c:if> --%>
					<script>
					  var heartImg = document.querySelector(".image");
					  heartImg.addEventListener("click", invertImg);
					  function invertImg(){
						  if (heartImg.getAttribute("src") == "../../img/like1.png")
							  heartImg.setAttribute("src", "../../img/like2.png");
						  else
							  heartImg.setAttribute("src", "../../img/like1.png");
					  }
					  
					  var scrapImg = document.querySelector(".scrapImage");
					  scrapImg.addEventListener("click", invertScrapImg);
					  function invertScrapImg(){
						  if(scrapImg.getAttribute("src") == "../../img/scrap1.png")
							  scrapImg.setAttribute("src", "../../img/scrap2.png");
						  else
							  scrapImg.setAttribute("src", "../../img/scrap1.png");
					  }
					  
					</script>
					<!-- <button type="submit" style="width:20%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#0d6efd; color: white;">스크랩</button> -->
					<c:if test="${memberId eq course.memberId}"> <!-- 로그인 후 뜨는지 확인 -->
						<button type="submit" formaction="list" style="width:15%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">삭제</button>
					</c:if>	
					</div>
				<br>
				<br>
				<br>
				</article>
			</div>
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
				<!-- Categories widget-->
				<div class="card mb-4">
					<div class="card-header">제휴 업체 둘러보기</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">솜솜월드</a></li>
									<li><a href="#!">향수 공방 'scent'</a></li>
									<li><a href="#!">고양이카페 '양갱'</a></li>
								</ul>
							</div>
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">솜솜 시네마</a></li>
									<li><a href="#!">목화 카페</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Side widget-->
				<div class="card mb-4">
					<div class="card-header">Side Widget</div>
					<div class="card-body">You can put anything you want inside
						of these side widgets. They are easy to use, and feature the
						Bootstrap 5 card component!</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Coursemos 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</body>
</html>