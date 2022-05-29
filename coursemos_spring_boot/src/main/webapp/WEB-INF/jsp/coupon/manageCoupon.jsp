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
<h4>${company.name}의 쿠폰 사용 관리 페이지입니다.</h4>
<a href='<c:url value="/company/list/coupon/register">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>쿠폰 등록</b></a>
          	
<h4>발급 중인 쿠폰</h4>
<table class="table">
	<tr>
		<th>쿠폰 내용</th>
		<th>쿠폰 발급기간</th>
		<th>발급 후 이용 기간</th>
		<th>갯수 제한</th>
		<th>발급 중단</th>
		<th>사용 관리</th>
	</tr>
	
	<c:forEach var="coupon" items="${couponList}">
	<c:if test="${coupon.state == 0}">
	<tr>
		<td>${coupon.content}</td>
		<td>${coupon.period}</td>
		<td>${coupon.day}</td>
		<td>${coupon.limit}</td>
		<td>
        	<a href='<c:url value="/company/list/coupon/stop">
          	<c:param name="couponId" value="${coupon.couponId}"/></c:url>'>
          	<b>중단하기</b></a>
     	</td>
		<td>
        	<a href='<c:url value="/company/list/coupon/detail">
          	<c:param name="couponId" value="${coupon.couponId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>

<h4>발급 중지, 기간 만료 쿠폰</h4>
<table class="table">
	<tr>
		<th>쿠폰 내용</th>
		<th>쿠폰 발급기간</th>
		<th>발급 후 이용 기간</th>
		<th>발급 중단</th>
		<th>사용 관리</th>
	</tr>
	
	<c:forEach var="coupon" items="${couponList}">
	<c:if test="${coupon.state != 0}">
	<tr>
		<td>${coupon.content}</td>
		<td>${coupon.period}</td>
		<td>${coupon.day}</td>
		<td>${coupon.limit}</td>
		<td>
        	<a href='<c:url value="/company/list/coupon/detail">
          	<c:param name="couponId" value="${coupon.couponId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
</body>
</html>