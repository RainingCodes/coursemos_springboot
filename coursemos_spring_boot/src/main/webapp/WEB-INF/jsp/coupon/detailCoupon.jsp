<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
h4 {
	text-align:center;
}
th {
	text-align:center;
}
</style>
<body>
<!-- 날짜 설정 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />        <%-- 오늘날짜 --%>

<div class="container">
<center><h1>쿠폰 관리</h1></center><br>
<h4>'${coupon.couponContents}' 쿠폰 발급 리스트</h4>
<table class="table">
	<tr>
		<th>유저 닉네임</th>
		<th>쿠폰 만료 기간</th>
		<th>사용 관리</th>
	</tr>
	
	<c:forEach var="mcValue" items="${mcList}">
	<tr>
		<td>${mcValue.nickname}</td>
		<fmt:formatDate value="${mcValue.memberCoupon.expirationDate}" pattern="yyyy-MM-dd" var="expiration"/>  <%-- 마감날짜 --%>
		<td>${expiration}</td>
		
		<td>
		<c:if test="${mcValue.memberCoupon.used eq 'F' }">
			<c:if test="${expiration > nowDate}">
				<a href='<c:url value="/company/list/coupon/detail/use">
		    	<c:param name="memberCouponId" value="${mcValue.memberCoupon.memberCouponId}"/></c:url>'>
		    	<b>사용하기</b></a>
			</c:if>
				
			<c:if test="${expiration < nowDate}"> 
				기간 만료
			</c:if>
		</c:if>
		
		<c:if test="${mcValue.memberCoupon.used eq 'T'}">
				사용 완료
		</c:if>
     	</td>
    </tr>
	</c:forEach>
</table>
</div>
</body>
</html>