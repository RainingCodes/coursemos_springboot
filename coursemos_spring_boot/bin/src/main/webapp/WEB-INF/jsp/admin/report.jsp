<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
	<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
	<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>신고 상세보기</title>
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
		<th>
			<c:if test="${type == 'course'}">
				courseId
			</c:if>
			<c:if test="${type == 'review'}">
				reviewId
			</c:if>
		</th>
		<th>원본 게시글</th>
		<th>게시글 삭제, 포인트 회수</th>
		<th>완료 처리</th>
	</tr>

	<c:forEach var="list" items="${reportList}">
	<c:if test="${list.state eq false}">
	<tr>
		<td>
			${list.reportId}
		</td>
		<td>
			${list.reportCategory}
		</td>
		<td>
			${list.nickname}
		</td>
		<td>
			${list.id}
		</td>
		<td>
			<c:if test="${list.existPost == true}">
			<c:if test="${type == 'course'}">
	        	<a href='<c:url value="/course/view/${list.id}"/>'>
	          	<b>이동하기</b></a>
			</c:if>
			<c:if test="${type == 'review'}">
				<a href='<c:url value="/review/registered/${list.id}"/>'>
	          	<b>이동하기</b></a>
			</c:if>
			</c:if>
			<c:if test="${list.existPost == false}">삭제됨</c:if>
		</td>
		<td>
			<c:if test="${list.existPost == true}">
			<c:if test="${type == 'course'}">
	        	<a href='<c:url value="/admin/report/course/remove">
						<c:param name="courseId" value="${list.id}"/>
          				<c:param name="reportId" value="${list.reportId}"/>
          				</c:url>'>
          		<b>코스 삭제하기</b></a>
			</c:if>
			<c:if test="${type == 'review'}">
				<a href='<c:url value="/admin/report/review/remove">
						<c:param name="reviewId" value="${list.id}"/>
          				<c:param name="reportId" value="${list.reportId}"/>
          				</c:url>'>
          		<b>리뷰 삭제하기</b></a>
			</c:if>		
			</c:if>
			<c:if test="${list.existPost == false}">삭제됨</c:if>
		</td>
		<td>
		<a href='<c:url value="/admin/report/*/process">
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
		<th>
			<c:if test="${type == 'course'}">
				courseId
			</c:if>
			<c:if test="${type == 'review'}">
				reviewId
			</c:if>
		</th>
		<th>완료 처리</th>
	</tr>

	<c:forEach var="list" items="${reportList}">
	<c:if test="${list.state eq true}">
	<tr>
		<td>
			${list.reportId}
		</td>
		<td>
			${list.reportCategory}
		</td>
		<td>
			${list.nickname}
		</td>
		<td>
			${list.id}
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