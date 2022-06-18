<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />       <%-- 오늘날짜 --%>
<html>
<head>
<title>제휴 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
th {
	font-size:20px;
}
th, td {
text-align:center;
}
.red {
color:red;
}
</style>
</head>
<body>
<div class="container">
<table class="table table-striped">
	<tr>
		<th>${placeName} 제휴 쿠폰 정보</th>
	</tr>
	<tr>
		<td>쿠폰 내용 : ${coupon.couponContents} </td>
	</tr>
	<tr>
		<td>발급 후 <b>${coupon.day}일</b>만 사용 가능</td>
	</tr>
	<tr>
		<fmt:formatDate var="formatDt" value="${coupon.period}" pattern="yyyy-MM-dd"/>
		<td><b>${formatDt}</b>까지 발급 가능</td>
	</tr>
	<tr>
		
		<c:if test="${isCEO == true}">
			<td class="red"><b>내가 만든 쿠폰은 열람만 가능합니다.</b></td>
		</c:if>
		<c:if test="${isCEO == false}">
			<td>
			<a href='<c:url value="/course/view/coupon/get">
          	<c:param name="couponId" value="${coupon.couponId}"/></c:url>'>
          	<button class="btn btn-dark">발급 받기</button></a>
          	</td>
         </c:if>
	</tr>	
</table>
</div>
</body>
</html>