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
					<img class="img-fluid rounded" id="preview-image" src="../img/seoul.png" /> <br>
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
					<img class="img-fluid rounded" id="preview-image" src="../img/path.png" /> <br>
					<br>
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
					<button type="submit" style="width:20%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#0d6efd; color: white;">SNS 공유하기</button>
					<button type="submit" style="width:20%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#0d6efd; color: white;">좋아요</button>
					<button type="submit" style="width:20%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#0d6efd; color: white;">스크랩</button>
					<!-- 추후 비활성화/활성화 조건 적용하기 -->
					<button type="submit" style="width:20%; height:40px; border:none; border-radius:5px; text-align: center; background-color:#ced4da;">쿠폰 발급</button>
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