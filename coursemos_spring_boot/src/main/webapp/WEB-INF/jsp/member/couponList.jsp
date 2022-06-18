<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
	<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
	<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<html>
<head>
<title>다운받은 할인권 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
var check = 1;
$(document).ready(function () {
	if(check == 1) {
		$("#end").hide();
	}
	
	$(document).on("click", "input[name='pro']", function () {
		check = 1;
		$("#pro").show();
		$("#end").hide();
	});
	$(document).on("click", "input[name='end']", function () {
		check = 2;
		$("#pro").hide();
		$("#end").show();
	});	 
});
</script>
<style>
.button {
	text-align:center;
}
h4 {
	text-align:center;
}
th {
	text-align:center;
}
</style>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<!-- 날짜 설정 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />        <%-- 오늘날짜 --%>

<div class="container">
<div class="button">
<input class="btn btn-dark" type='button' name='pro' value='제휴 중'>
<input class="btn btn-dark" type='button' name='end' value='제휴 종료'>
</div>
<br><br>
<div id="pro">
<h4>사용 가능 할인권 리스트</h4>
<table class="table">
	<tr>
		<th>제휴점 이름</th>
		<th>쿠폰 내용</th>
		<th>만료일</th>
	</tr>
	
	<c:forEach var="mcValue" items="${memberCouponList}">
	<fmt:formatDate value="${mcValue.memberCoupon.expirationDate}" pattern="yyyy-MM-dd HH:mm:ss" var="expiration"/>  <%-- 마감날짜 --%>
	<c:if test="${mcValue.memberCoupon.used eq 'F' && expiration > nowDate}">
	<tr>
		<td>${mcValue.placeName}</td>
		<td>${mcValue.couponContent}</td>
		<td>${expiration}</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
<div id="end">
<h4>사용 불가 쿠폰 리스트</h4>
<table class="table">
	<tr>
		<th>제휴점 이름</th>
		<th>쿠폰 내용</th>
		<th>분류</th>
	</tr>
	
	<c:forEach var="mcValue" items="${memberCouponList}">
	<fmt:formatDate value="${mcValue.memberCoupon.expirationDate}" pattern="yyyy-MM-dd" var="expiration"/>  <%-- 마감날짜 --%>
	<c:if test="${mcValue.memberCoupon.used eq 'T' || expiration < nowDate}">
	<tr>
		<td>${mcValue.placeName}</td>
		<td>${mcValue.couponContent}</td>
		<td>
			<c:if test="${expiration < nowDate}"> 
				기간 만료
			</c:if>
			<c:if test="${mcValue.memberCoupon.used eq 'T'}">
				사용 완료
			</c:if>		
		</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
</div>
</body>
</html>