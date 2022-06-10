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
<center><h1>${type} 신고 관리 페이지</h1></center>

<h3>처리 전</h3>
<table class="table">
	<tr>
		<th>reportId</th>
		<th>category</th>
		<th>신고자</th>
		<th>courseId</th>
		<th>완료 처리</th>
	</tr>

	<c:forEach var="list" items="${reportList}">
	<c:if test="${list.state eq 'F'}">
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
			${list.courseId}
		</td>
		<td>
		<a href='<c:url value="/admin/report/course/process">
          	<c:param name="reportId" value="${list.reportId}"/></c:url>'>
          	<b>처리하기</b></a>
		</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
        
<h3>처리 완료</h3>
<table class="table">
	<tr>
		<th>reportId</th>
		<th>category</th>
		<th>신고자</th>
		<th>courseId</th>
		<th>완료 처리</th>
	</tr>

	<c:forEach var="list" items="${reportList}">
	<c:if test="${list.state eq 'T'}">
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
			${list.courseId}
		</td>
		<td>
			처리 완료
		</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
</body>
</html>