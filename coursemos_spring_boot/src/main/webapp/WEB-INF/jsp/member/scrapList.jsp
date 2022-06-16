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
<title>스크랩 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<!-- 날짜 설정 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />        <%-- 오늘날짜 --%>

<div class="container">
<center><h1>스크랩 관리</h1></center>
<h4>나의 스크랩 리스트</h4>
<table class="table">
	<tr>
		<th>코스 이름</th>
		<th>코스 취향</th>
		<th>코스 상세보기</th>
	</tr>
	
	<c:forEach var="course" items="${courseList}">
	<tr>
		<td>${course.courseName}</td>
		<td>
		<c:choose>
			<c:when test="${course.taste eq 'act'}">활동적인</c:when>
			<c:when test="${course.taste eq 'hea'}">힐링되는</c:when>
			<c:when test="${course.taste eq 'nat'}">자연적인</c:when>
			<c:when test="${course.taste eq 'exp'}">체험적인</c:when>
			<c:when test="${course.taste eq 'ent'}">즐거운</c:when>
			<c:when test="${course.taste eq 'ret'}">복고풍</c:when>
			<c:when test="${course.taste eq 'cal'}">잔잔한</c:when>
		</c:choose>
		</td>
		<td>
			<a href='<c:url value="/course/view/${course.courseId}"/>'></a>
		</td>
    </tr>
	</c:forEach>
</table>
</div>
</body>
</html>