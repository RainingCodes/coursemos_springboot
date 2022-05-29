<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li class="nav-item"><a class="nav-link active" href="#!">코스
							등록</a></li>
					<li class="nav-item"><a class="nav-link active" href="#!">제휴
							등록</a></li>
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
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article style="margin-left:25%;">
					<!-- Post header-->
					<header class="mb-4">
						<h1 style="text-align: center;">코스 상세페이지</h1>
					</header>
					<div>
					<p></p>
					<!-- Post title-->
					<h4 style="font-weight:bold;">서울 랜드마크 투어</h4><br>
					<!-- Preview image figure-->
					<h5 style="font-weight:bold;">코스 대표 이미지</h5>
					<img class="img-fluid rounded" id="preview-image" src="../../img/seoul.png" /> <br>
					<br>
					<br>
					<div class="upload"></div>
					<h5 style="font-weight:bold;">코스의 분위기</h5>
					<div>활동적인, 즐거운</div>
					<br>
					<br>
					<br>
					<h5 style="font-weight:bold;">코스 경로 살펴보기</h5>
					<br>
					<table style="border-radius: 5px; width: 80%">
						<tr>
							<th>남산타워</th>
						</tr>
						<tr>
							<td>서울시 용산구 남산공원길 105</td>
						</tr>
						<tr>
							<td>16,000(원)</td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<th>경복궁</th>
						</tr>
						<tr>
							<td>서울시 용산구 남산공원길 105</td>
						</tr>
						<tr>
							<td>3,000(원)</td>
						</tr>
					</table>
					
					<br>
					<!-- 지도 -->
					<h5 style="font-weight:bold;">코스 경로 미리보기</h5>
					<!-- 지도를 표시할 div 입니다 -->
					<div id="map" style="width:100%;height:350px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2"></script>
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
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					var positions = [
					    {
					        title: '카카오',
					        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
					    },
					    {
					        title: '텃밭', 
					        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
					    },
					    {
					        title: '생태연못', 
					        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
					    }
					];
					
					// 지도 위에 마커를 표시합니다
					for (var i = 0, len = positions.length; i < len; i++) {
					    var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
					        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
					        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
					        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
					        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
					        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
					        
					    // 마커를 생성하고 지도위에 표시합니다
					    addMarker(positions[i].latlng, normalOrigin, overOrigin, clickOrigin);
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

					    // 마커에 mouseover 이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'mouseover', function() {

					        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
					        // 마커의 이미지를 오버 이미지로 변경합니다
					        if (!selectedMarker || selectedMarker !== marker) {
					            marker.setImage(overImage);
					        }
					    });

					    // 마커에 mouseout 이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'mouseout', function() {

					        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
					        // 마커의 이미지를 기본 이미지로 변경합니다
					        if (!selectedMarker || selectedMarker !== marker) {
					            marker.setImage(normalImage);
					        }
					    });

					    // 마커에 click 이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'click', function() {

					        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
					        // 마커의 이미지를 클릭 이미지로 변경합니다
					        if (!selectedMarker || selectedMarker !== marker) {

					            // 클릭된 마커 객체가 null이 아니면
					            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
					            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

					            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
					            marker.setImage(clickImage);
					        }

					        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
					        selectedMarker = marker;
					    });
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
								
					var linePath = new Array();
					for (var i = 0; i < positions.length; i++) {
					    linePath[i] = positions[i].latlng;
					}
					
					var polyline = new kakao.maps.Polyline({
						path: linePath,
						strokeWeight: 5,
						strokeColor: '#FFAE00',
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
							<td>서울에서 가장 인기 있는 관광지를 운행하는 투어입니다. 티켓 한 장 가격으로 서울의 유명관광지를 순환 운행하는 버스를 하루 종일 이용할 수 있습니다. 서울을 처음 방문한 관광객에게 이보다 좋은 관광수단은 없습니다.</td>
						</tr>
					</table>
					<br>
					</div>
					<div align="center">
					<button type="submit" style="width:15%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#0d6efd; color: white;">SNS 공유</button>
					<button type="submit" style="width:15%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#0d6efd; color: white;">좋아요</button>
					<img style="width:20px; height:20px;" src="../../img/like.png" />
					<button type="submit" style="width:15%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#0d6efd; color: white;">스크랩</button>
					<!-- 추후 비활성화/활성화 조건 적용하기 -->
					<button type="submit" style="width:15%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">쿠폰 발급</button>
					<button type="submit" style="width:15%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">삭제</button>
					</div>
				</article>
				<br>
				<br>
				<br>
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
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p>
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