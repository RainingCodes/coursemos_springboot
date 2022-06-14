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
<center><h1>제휴 관리</h1></center>

<h3>제휴 중</h3>
<table class="table">
	<tr>
		<th>등록한 가게</th>
		<th>쿠폰 관리</th>
		<th>상세 관리</th>
	</tr>
	
	<c:forEach var="company" items="${companyList}">
	<c:if test="${company.accept eq 1}">
	<tr>
		<td>
			${company.place.placeName}
		</td>
		<td>
        	<a href='<c:url value="/company/list/coupon">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
		<td>
        	<a href='<c:url value="/company/list/detail">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>

<h3>제휴 종료</h3>
<table class="table">
	<tr>
		<th>등록한 가게</th>
		<th>쿠폰 관리</th>
		<th>상세 관리</th>
	</tr>
	
	<c:forEach var="company" items="${companyList}">
	<c:if test="${company.accept eq 3}">
	<tr>
		<td>
			${company.place.placeName}
		</td>
		<td>
        	<a href='<c:url value="/company/list/coupon">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
		<td>
        	<a href='<c:url value="/company/list/detail">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>

<h3>제휴 거부</h3>
<table class="table">
	<tr>
		<th>등록한 가게</th>
		<th>상세 관리</th>
	</tr>
	
	<c:forEach var="company" items="${companyList}">
	<c:if test="${company.accept eq 2}">
	<tr>
		<td>
			${company.place.placeName}
		</td>
		<td>
        	<a href='<c:url value="/company/list/detail">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
</body>
</html>