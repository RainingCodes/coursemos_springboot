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
<center><h1>신고 관리 페이지</h1></center>
<h4>${type} 신고 페이지</h4>
<table class="table">
	<tr>
		<th>reportId</th>
		<th>category</th>
		<th>신고자</th>
		<th>처리여부</th>
		<th>courseId</th>
	</tr>
	
	<c:forEach var="list" items="${reportList}">
	<tr>
		<td>
			${list.reportId}
		</td>
		<td>
			${list.reportCategory}
		</td>
		<td>
			${list.memberId}
		</td>
		<td>
			${list.state}
		</td>
		<td>
			${list.courseId}
		</td>
    </tr>
	</c:forEach>
</table>
</div>
</body>
</html>