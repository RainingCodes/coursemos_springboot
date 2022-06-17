<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<tr>
							<td><c:out value="${report.reportId}" /></td>
							<td><c:out value="${report.writtenDate}" /></td>
							<td>
							<c:out value="${report.getReportCategory()}" />
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
								<a href='<c:url value="/review/registerd/${report.reviewId}"/>'>이동하기</a>
							</td>
							</c:if>
							<td><c:out value="${report.state}" /></td>
						</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
</script>
</html>