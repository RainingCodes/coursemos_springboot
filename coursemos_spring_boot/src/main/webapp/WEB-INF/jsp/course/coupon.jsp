<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
<script>
function showPopups(a){
	var width = 500;
	var height = 300;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY= (window.screen.height / 2) - (height / 2);
	openWin = window.open("/course/view/coupon/" + a, "쿠폰 발급","height=" + height  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);
}
</script>
<body>
	<div class="card mb-4">
		<div class="card-header">발급 가능한 쿠폰 목록</div>
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<ul class="list-unstyled mb-0">
						<c:forEach var="couponData" items="${couponList}" varStatus="status">
							<li>${couponData.placeName}의 쿠폰 : <a href="javascript:void(0);" onclick="showPopups(${couponData.coupon.couponId});">${couponData.coupon.couponContents}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>