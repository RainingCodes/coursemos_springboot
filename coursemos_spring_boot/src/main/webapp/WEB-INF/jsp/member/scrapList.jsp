<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
		<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
		<jsp:forward page="/" /> 
</c:if> <!-- if 종료 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩 관리</title>
<style>
.button {
	text-align:center;
}
h2 {
	text-align:center;
}
th {
	text-align:center;
}
</style>
</head>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<div class="container">
<center><h2>스크랩 관리</h2></center>
<table class="table table-bordered">
	<tr>
		<th>코스 이름</th>
		<th>코스 취향</th>
		<th>코스 상세보기</th>
		<th>스크랩 취소</th>
	</tr>
	
	<c:forEach var="course" items="${courseList}">
	<tr>
		<td>${course.courseName}</td>
		<td align="center">
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
			<a href='<c:url value="/course/view/${course.courseId}"/>'>이동하기</a>
		</td>
		<td>
			<a href='<c:url value="/member/unscrap">
          	<c:param name="courseId" value="${course.courseId}"/></c:url>'>
          	취소하기</a>
		</td>
    </tr>
	</c:forEach>
</table>
</div>
<%@ include file="../footer.jsp"  %>
</body>
</html>