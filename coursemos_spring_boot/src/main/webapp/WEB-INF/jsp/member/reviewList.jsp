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
<title>리뷰 목록</title>

</head>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<div class="container">
	<h3 style="text-align:center">${sessionMember.nickName}님이 작성한 리뷰들</h3>
	<div style="display: flex; justify-content : center;" >
		<table class="table table-striped" style="width:50%; ">
			<thead>
				<tr>
					<td>리뷰 번호</td>
					<td>내용</td>
					<td>작성 날짜</td>
					<td>좋아요 수</td>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="review" items="${reviews}" varStatus="status">
						<tr>
							<td><c:out value="${review.reviewId}" /></td>
							<td><a href="/review/registered/${review.reviewId}"><c:out value="${review.reviewContents}" /></a></td>
							<td><c:out value="${review.writtenDate}" /></td>
							<td><c:out value="${review.likes}" /></td>
						</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>
</html>