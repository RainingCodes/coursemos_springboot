<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>쿠폰 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
  	.error {
		color:red;
		font-size:15px;
		font-weight:bold;
	}
  </style>
</head>
<body>
<div class="container">
<h4><b>${companyName}</b>의 쿠폰 등록입니다.</h4>
<table class="table">
	<form:form modelAttribute="Coupon">
	<tr>
		<td class="text-center"><form:label path="couponContents">쿠폰 내용</form:label></td>
		<td><form:input path="couponContents" /> <form:errors path="couponContents" cssClass="error"/></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="period">쿠폰 발급 기간</form:label></td>
		<td><form:input path="period" />까지 <form:errors path="period" cssClass="error"/></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="day">발급 후 이용기간</form:label></td>
		<td><form:input path="day" />일 <form:errors path="day" cssClass="error"/></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="limit">발급 갯수 제한</form:label></td>
		<td><form:input path="limit" />개까지 발급 <form:errors path="limit" cssClass="error"/></td>
		
	</tr>
	<tr>
		<td colspan="2" class="text-center"><input type="submit" value="접수하기" /></td>
	</tr>
	</form:form>
</table>
</div>
</body>
</html>