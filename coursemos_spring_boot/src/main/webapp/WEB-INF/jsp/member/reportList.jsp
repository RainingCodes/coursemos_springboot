<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.demo.domain.Report" %>

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
<title>신고 목록</title>
</head>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<div class="container">
	<h3 style="text-align:center">${sessionMember.nickName}님의 신고내역</h3>
	<div style="display: flex; justify-content : center;" >
		<table class="table table-striped" style="width:50%; ">
			<thead>
				<tr>
					<td>신고 번호</td>
					<td>신고한 날짜</td>
					<td>신고유형</td>
					<td>분류</td>
					<td>신고한 글 바로가기</td>
					<td>신고 상태</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="report" items="${list}" varStatus="status">
				<fmt:formatDate value="${report.writtenDate}" pattern="yyyy-MM-dd" var="written"/>  <%-- 마감날짜 --%>
						<tr>
							<td><c:out value="${report.reportId}" /></td>
							<td><c:out value="${written}" /></td>
							<td>
							<c:choose>
								<c:when test="${report.reportCategory.contains('spam')}">스팸홍보/도배글</c:when>
								<c:when test="${report.reportCategory.contains('lie')}">허위 정보</c:when>
								<c:when test="${report.reportCategory.contains('mali')}">악의적 비하</c:when>
								<c:when test="${report.reportCategory.contains('unpl')}">불쾌한 표현</c:when>
								<c:when test="${report.reportCategory.contains('ille')}">불법 정보</c:when>
							</c:choose>
							</td>
							<c:if test="${report.courseId ne null}">
							<td>
								코스
							</td>
							<td>
								<a href='<c:url value="/course/view/${report.courseId}"/>'>이동하기</a>
							</td>
							</c:if>
							<c:if test="${report.reviewId ne null}">
							<td>
								리뷰
							</td>
							<td>
								<a href='<c:url value="/review/registered/${report.reviewId}"/>'>이동하기</a>
							</td>
							</c:if>
							<td>
							
							<c:choose>
								<c:when test="${report.state == 'F'}">처리 전</c:when>
								<c:when test="${report.state == 'T'}">처리 완료</c:when>
							</c:choose>
							
							</td>
						</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>

</html>