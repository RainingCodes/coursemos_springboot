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
<link rel="icon" type="image/x-icon" href="../../assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../css/styles.css" rel="stylesheet" />
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
                	<button class="navbar-brand" type="button" style="border:none;"><img src="../../img/logo.png" style="width:100px;"></button>
	                <!-- <a class="navbar-brand" href="#!">코스모스</a> -->
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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
        <div class="container mt-5">
            <div class="row">
            	<form action="" method="post">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                        	<h1 style="text-align:center;">코스 작성</h1><p></p>
                            <!-- Post title-->
							<div class="card-body">
								<div class="input-group">
									<input class="form-control" type="text" v-model="inputTitle" placeholder="코스 이름을 입력하세요" required>
								</div>
								<div v-if="!titleValid">유효하지 않은 제목입니다.</div>
							</div>
						</header>
					
					<!-- Preview image figure-->
					<img class="img-fluid rounded" id="preview-image"
						src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" />
					<br><br><br>
					<h5>코스를 대표하는 이미지를 업로드하세요</h5>
					<input type="file" id="real-input" class="image_inputType_file"
						accept="../img/*" required>
					<br><br><br>
					<div class="upload"></div>
					<h5>코스의 분위기를 선택하세요</h5>
					<div class="selectTaste" style="display:inline-block; width: 300px; line-height: 45px;">
						<input type="checkbox" name="category" v-for="item in taste"><span v-html="item"></span>
						<!-- <input type="checkbox" name="category" value=""> 활동적인
						<input type="checkbox" name="category" value=""> 잔잔한
						<input type="checkbox" name="category" value=""> 힐링
						<input type="checkbox" name="category" value=""> 자연적인
						<input type="checkbox" name="category" value=""> 공식적인
						<input type="checkbox" name="category" value=""> 체험적
						<input type="checkbox" name="category" value=""> 즐거운
						<input type="checkbox" name="category" value=""> 복고풍 -->
					</div>
					<br><br><br>
					<!-- 코스 추가 -->
                  		<h5>코스 경로에 추가할 장소를 입력하세요 
						<input type="button" name="add" value="+" id="add_btn" style="border:none;border-radius:5px; text-align: center; margin-left:45%;height: 30px;"></h5>
						<input class="form-control" type="text" placeholder="코스 명칭" style="width:90%"><br>
						<div style="float:left; width:70%;"><input type="text" class="form-control" id="sample5_address" placeholder="상세 주소"></div>
						<div style="float:right; margin-right: 90px;"><input type="button" style="border:none; border-radius:5px; text-align: center; width: 120px; height: 33px;" onclick="sample5_execDaumPostcode()" value="주소 검색"></div><br><br>
						<input class="form-control" type="text" placeholder="소요 비용(원)" style="width:90%"><br>
						<input class="form-control" type="text" placeholder="소요 시간(분)" style="width:90%"><br>
                       	<!-- 지도 -->
                       	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>


					<!-- 	<img class="img-fluid rounded" id="preview-image"
						src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" /> -->
						<br><br><br>						
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
                        <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76e55c5ff78afa2dcf5a29a283774395&libraries=services"></script>
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
	    
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      			mapOption = {
          			center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
          			level: 5 // 지도의 확대 레벨
      			};

		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });


		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
		
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("sample5_address").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                    }
		                });
		            }
		        }).open();
		    }
	</script>
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