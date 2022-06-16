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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>제휴 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<!-- 날짜 설정 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />        <%-- 오늘날짜 --%>

<div class="container">
<center><h1>쿠폰 관리</h1></center>
<h4>사용 가능 쿠폰 리스트</h4>
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
</body>
</html>