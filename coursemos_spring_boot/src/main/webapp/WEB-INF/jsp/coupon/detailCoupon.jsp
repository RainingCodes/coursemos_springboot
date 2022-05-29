<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>제휴 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div class="container">
<center><h1>쿠폰 관리</h1></center>
<h4>'${coupon.content}' 쿠폰 발급 리스트</h4>
<table class="table">
	<tr>
		<th>유저 닉네임</th>
		<th>쿠폰 만료 기간</th>
		<th>사용 관리</th>
	</tr>
	
	<c:forEach var="mcValue" items="${mcList}">
	<tr>
		<td>${mcValue.nickname}</td>
		<td>${mcValue.memberCoupon.expriationDate}</td>
		
		<td>
		<c:if test="${mcValue.use == 0}">
			<a href='<c:url value="/company/list/coupon/detail/use">
          	<c:param name="memberCouponId" value="${mcValue.memberCoupon.memberCouponId}"/></c:url>'>
          	<b>사용하기</b></a>			
		</c:if>
		<c:if test="${mcValue.use == 1}">
			사용 완료
		</c:if>
		<c:if test="${mcValue.use == 2}"> 
			기간 만료
		</c:if>
     	</td>
    </tr>
	</c:forEach>
</table>
</div>
</body>
</html>