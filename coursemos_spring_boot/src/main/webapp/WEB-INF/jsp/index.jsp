<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>코스모스</title>
</head>
<body>

	<c:if test="${sessionMember}"> <!-- if와 동일 -->
		<%@ include file="header/IncludeTopMember.jsp"  %>
	</c:if> <!-- if 종료 -->
<%@ include file="header/IncludeTop.jsp"  %>
	



<%@ include file="main_map.jsp" %>
</body>
</html>