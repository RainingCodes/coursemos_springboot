<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />       <%-- 오늘날짜 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
<script>
function showPopups(a){
	var width = 400;
	var height = 280;
	var popupX = (window.screen.width / 2) - (width / 2);
	var popupY= (window.screen.height / 2) - (height / 2);
	openWin = window.open("/course/view/coupon/" + a, "쿠폰 발급","height=" + height  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);
}
</script>
<body>
	<div class="card mb-4">
		<div class="card-header">발급 가능한 쿠폰 목록</div>
			<div class="row">
				<div>
					<ul class="list-group">
						<c:forEach var="couponData" items="${couponList}" varStatus="status">
							<fmt:formatDate var="formatDt" value="${couponData.coupon.period}" pattern="yyyy-MM-dd"/>
							<c:if test="${formatDt > nowDate}">
								<li class="list-group-item list-group-item-action">${couponData.placeName}의 쿠폰 : <a href="javascript:void(0);" onclick="showPopups(${couponData.coupon.couponId});">${couponData.coupon.couponContents}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
		</div>
	</div>
</body>
</html>