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
<style>
.admin a {
font-size:30px;
font-align:center;
}
.admin {
font-size:30px;
width: 100%;
 text-align: center;
}
</style>
<meta charset="UTF-8">
<title>코스모스 관리페이지</title>
</head>
<body>
<div class="admin">
해당 페이지는 관리자가 아니면 접근할 수 없습니다.
    <div>
      <button class="btn btn-outline-primary" onclick="history.back()">Back</button>
    </div>
</div>
</body>
</html>