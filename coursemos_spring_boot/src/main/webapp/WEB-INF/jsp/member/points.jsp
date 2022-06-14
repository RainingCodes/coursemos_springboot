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
<title>포인트</title>

</head>
<body>

<div class="container">
	<h3 style="text-align:center">${sessionMember.nickName}님의 포인트 내역</h3>
	<div style="display: flex; justify-content : center;" >
		<table class="table table-striped" style="width:50%; ">
			<thead>
				<tr>
					<td>날짜</td>
					<td>내역</td>
					<td>포인트 변동</td>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="points" items="${sessionMember.getPointList()}" varStatus="status">
						<tr>
							<td>
								<c:out value="${points.getPointsDate()}" /></td>
							<td><c:out value="${points.getTypeString()}" /></td>
							<td><c:out value="${points.getTypeString2()}" /></td>
						</tr>
				</c:forEach>
				<tr>
					<td>현재 포인트</td>
					<td colspan="2">${sessionMember.getPoints() }</td>
				</tr>
			</tbody>	
		</table>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
</script>
</html>