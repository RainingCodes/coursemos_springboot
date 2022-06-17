<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script>
function showPopup(a){
	
	var width = 800;
	var height = 500;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY= (window.screen.height / 2) - (height / 2);
	openWin = window.open("/review/" + a + "/check","팝업 테스트","height=" + height  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);
}
</script>
<body>
	<div class="card mb-4">
		<div class="card-header">작성된 리뷰 목록들</div>
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<ul class="list-unstyled mb-0">
						<c:forEach var="review" items="${reviews}" varStatus="status">
							<li><a href="javascript:void(0);" onclick="showPopup(${review.reviewId});">${review.reviewContents}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-sm-6">
					<ul class="list-unstyled mb-0">
						<li><button class="btn-primary" onclick="href.location='/review/register/' + ${courseId}">리뷰 작성하기</button></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>