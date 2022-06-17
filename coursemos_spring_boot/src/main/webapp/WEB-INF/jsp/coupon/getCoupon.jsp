<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>제휴 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div class="container">
<table class="table">
	<tr>
		<td>${placeName} 제휴 쿠폰 정보</td>
	</tr>
	<tr>
		<td>쿠폰 내용 : ${coupon.couponContents} </td>
	</tr>
	<tr>
		<td>발급 후 ${coupon.day}까지 사용가능</td>
	</tr>
	<tr>
		<td>${coupon.period}까지 발급 가능</td>
	</tr>
	<tr>
		<td><a href='<c:url value="/course/view/coupon/get">
          	<c:param name="couponId" value="${coupon.couponId}"/></c:url>'>
          	<b>발급 받기</b></a></td>
	</tr>	
</table>
</div>
</body>
</html>