<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>제휴 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div class="container">
<center><h1>제휴 상세보기</h1></center>
<h4>${nickname}님의 ${company.name}에 관한 정보입니다.</h4>
<table class="table">
	<tr>
		<td>제휴 여부</td>
		<td><b>${company.accept}</b></td>
	</tr>
	<tr>
		<td>제휴 등록일</td>
		<td><b>${company.date}</b></td>
	</tr>
	<tr>
		<td>제휴 해지하기</td>
		<td><a href='<c:url value="/company/list/detail/stop">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>해지하기</b></a></td>
	</tr>
</table>
</div>
</body>
</html>