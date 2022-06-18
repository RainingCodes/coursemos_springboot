<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
	<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
	<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모스 관리페이지</title>
</head>
<style>
.admin a {
font-size:30px;
font-align:center;
}
.admin {
width: 100%;
 text-align: center;
}
</style>
<body>
<div class="admin">
<a href="/admin/report/course">코스 관리 페이지 이동</a><br>
<a href="/admin/report/review">리뷰 관리 페이지 이동</a><br>
<a href="/admin/company">제휴 관리</a>
</div>
</body>
</html>