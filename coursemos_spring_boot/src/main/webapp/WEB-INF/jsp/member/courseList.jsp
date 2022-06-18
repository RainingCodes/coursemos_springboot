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
<title>코스 목록</title>

</head>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<div class="container">
	<h3 style="text-align:center">${sessionMember.nickName}님이 작성한 코스들</h3>
	<div style="display: flex; justify-content : center;" >
		<table class="table table-striped" style="width:50%; ">
			<thead>
				<tr>
					<td>코스 번호</td>
					<td>이름</td>
					<td>작성 날짜</td>
					<td>좋아요 수</td>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="course" items="${courses}" varStatus="status">
						<tr>
							<td><c:out value="${course.courseId}" /></td>
							<td><a><c:out value="${course.courseName}" /></a></td>
							<td><c:out value="${course.writtenDate}" /></td>
							<td><c:out value="${course.likes}" /></td>
						</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>
</body>

</html>
