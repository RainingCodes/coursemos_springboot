<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>코스 상세페이지</title>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
	<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
	<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script>
function showPopup(id){
	
	var width = 1200;
	var height = 350;

	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY= (window.screen.height / 2) - (height / 2);
	var link = "/report/course/"+id;

	openWin = window.open(link,"신고 페이지","height=" + height  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);  
}
</script>
</head>
<body>
<!-- Responsive navbar-->
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
					<div style="margin-left:500px;">작성일: <fmt:formatDate value="${course.writtenDate}" pattern="yyyy-MM-dd"/></div>
					<input type="hidden" name="courseId" value='${course.courseId }'>
					<br>
					<h5 style="font-weight:bold;">코스의 분위기</h5>
					<!-- <div>활동적인, 즐거운</div> -->
					<div>
					<c:choose>
						<c:when test="${course.taste eq 'act'}">활동적인</c:when>
						<c:when test="${course.taste eq 'hea'}">힐링되는</c:when>
						<c:when test="${course.taste eq 'nat'}">자연적인</c:when>
						<c:when test="${course.taste eq 'exp'}">체험적인</c:when>
						<c:when test="${course.taste eq 'ent'}">즐거운</c:when>
						<c:when test="${course.taste eq 'ret'}">복고풍</c:when>
						<c:when test="${course.taste eq 'cal'}">잔잔한</c:when>
					</c:choose>
					</div>
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
							<tr>
								<th><div>${place2.placeName }</div></th>
							</tr>
							<tr>
								<td><div id="resultAddress2"></div></td>
							</tr>
							<tr>
							<td><br></td>
							</tr>
							<tr>
								<th><div>${place3.placeName }</div></th>
							</tr>
							<tr>
								<td><div id="resultAddress3"></div></td>
							</tr>
							<tr>
							<td><br></td>
							</tr>	
					</table>
					
					<!-- 지도 -->
					<h5 style="font-weight:bold;">코스 경로 미리보기</h5>
					<!-- 지도를 표시할 div 입니다 -->
					<div id="map" style="width:100%;height:350px; margin: 20px 20px 20px 0px">
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
					</div>
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
					        level: 6 // 지도의 확대 레벨
						};
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
				    
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);     

					var linePath = new Array();
					
					var bounds = new kakao.maps.LatLngBounds();
					
					var coords1 = new kakao.maps.LatLng(${place1.x}, ${place1.y});
					linePath[0] = coords1;
					var callback = function(result, status){
						if (status == kakao.maps.services.Status.OK){
							document.getElementById("resultAddress1").innerText = result[0].address.address_name;
							bounds.extend(coords1);
							map.setBounds(bounds);
						}
					}
					geocoder.coord2Address(coords1.getLng(), coords1.getLat(), callback);
										
					
					if (${place2 != null}){
						var coords2 = new kakao.maps.LatLng(${place2.x}, ${place2.y});
						linePath[1] = coords2;
						var callback2 = function(result, status){
							if (status == kakao.maps.services.Status.OK){
								document.getElementById("resultAddress2").innerText = result[0].address.address_name;								
								bounds.extend(coords2);
								map.setBounds(bounds);
							}							
						};
						geocoder.coord2Address(coords2.getLng(), coords2.getLat(), callback2);
					}
					
					if (${place3 != null}){
						var coords3 = new kakao.maps.LatLng(${place3.x}, ${place3.y});						
						linePath[2] = coords3;
						var callback3 = function(result, status){
							if (status == kakao.maps.services.Status.OK){
								document.getElementById("resultAddress3").innerText = result[0].address.address_name;							
								bounds.extend(coords3);
								map.setBounds(bounds);
							}
						};
						geocoder.coord2Address(coords3.getLng(), coords3.getLat(), callback3);
					}
					
					
					for (var i = 0, len = linePath.length; i < len; i++){
						var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
				        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
				        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
				        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
				        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
				        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
				        
					    // 마커를 생성하고 지도위에 표시합니다
					    addMarker(linePath[i], normalOrigin, overOrigin, clickOrigin);

					}
					
					// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
					function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

					    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
					    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
					        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
					        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
					    
					    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
					    var marker = new kakao.maps.Marker({
					        map: map,
					        position: position,
					        image: normalImage
					    });

					    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
					    marker.normalImage = normalImage;
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
					
					for (var i = linePath.length-1; i >= 0 ; i--){
						if (linePath[i]=='(0, 0)'){
							linePath.pop(); // 빈 좌표는 없애줌
						}					
					}
					
					var polyline = new kakao.maps.Polyline({
						path: linePath,
						strokeWeight: 5,
						strokeColor: 'blue',
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
					<c:if test="${sessionMember.check2 != false}"> <!-- 로그인 후 뜨는지 확인 -->
						<button formaction="/course/like" style="border:0;background-color:white;"><img class="image" style="width:50px; height:50px;" src="../../img/like1.png" /></button>
						<button formaction="/course/scrap" style="border:0;background-color:white;"><img class="scrapImage" style="width:50px; height:50px;" src="../../img/scrap1.png"/></button>
						
						<button type="button" onclick="location.href='../view/coupon/get'" style="width:15%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">쿠폰 발급</button>
						
						<button type="button" onclick="showPopup(${course.courseId});" style="width:15%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">신고</button>		
							
						<button type="submit" formaction="../${course.courseId}/update" style="width:15%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">수정</button>
						<button type="submit" formaction="list" style="width:15%; height:60px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">삭제</button>
					</c:if>	
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