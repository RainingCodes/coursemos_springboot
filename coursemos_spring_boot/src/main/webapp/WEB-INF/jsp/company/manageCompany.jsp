<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
	<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
	<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<html>
<head>
<title>제휴 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%@ include file="../member/mypage_menu.jsp"  %>
<div class="container">
<center><h2>제휴 관리</h2></center> 
<h3>제휴 중</h3>
<table class="table">
	<tr>
		<th>등록한 가게</th>
		<th>쿠폰 관리</th>
		<th>상세 관리</th>
	</tr>
	
	<c:forEach var="company" items="${companyList}">
	<c:if test="${company.accept eq 1}">
	<tr>
		<td>
			${company.place.placeName}
		</td>
		<td>
        	<a href='<c:url value="/company/list/coupon">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
		<td>
        	<a href='<c:url value="/company/list/detail">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>

<h3>제휴 종료</h3>
<table class="table">
	<tr>
		<th>등록한 가게</th>
		<th>쿠폰 관리</th>
		<th>상세 관리</th>
	</tr>
	
	<c:forEach var="company" items="${companyList}">
	<c:if test="${company.accept eq 3}">
	<tr>
		<td>
			${company.place.placeName}
		</td>
		<td>
        	<a href='<c:url value="/company/list/coupon">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
		<td>
        	<a href='<c:url value="/company/list/detail">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>

<h3>제휴 신청 및 거부</h3>
<table class="table">
	<tr>
		<th>등록한 가게</th>
		<th>상태</th>
		<th>상세 관리</th>
	</tr>
	
	<c:forEach var="company" items="${companyList}">
	<c:if test="${company.accept eq 2 || company.accept eq 0}">
	<tr>
		<td>
			${company.place.placeName}
		</td>
		<td>
			<c:if test="${company.accept eq 2}">거부</c:if>
			<c:if test="${company.accept eq 0}">신청 중</c:if>
		</td>
		<td>
        	<a href='<c:url value="/company/list/detail">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
     	
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
</body>
</html>