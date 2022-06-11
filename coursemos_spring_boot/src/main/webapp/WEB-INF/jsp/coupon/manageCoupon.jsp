<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>제휴 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>

function submitForm() {
	var answer = confirm("정말로 중단하시겠습니까? 되돌릴 수 없습니다.");
	
	if(answer) {
		alert('발급이 중단되었습니다.')
		form.submit();
	} else {
	}
}



</script>
</head>
<body>
<div class="container">
<center><h1>쿠폰 관리</h1></center>
<h4><b>${company.companyName}</b>의 쿠폰 사용 관리 페이지입니다.</h4>

<span style="display: inline-block; width: 95%; text-align: right;"><a href='<c:url value="/company/list/coupon/register">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<h3>쿠폰 등록</h3></a></span>
          	
<h4>발급 중인 쿠폰</h4>
<table class="table">
	<tr>
		<th>쿠폰 내용</th>
		<th>쿠폰 발급기간</th>
		<th>발급 후 이용 기간</th>
		<th>갯수 제한</th>
		<th>발급 중단</th>
		<th>사용 관리</th>
	</tr>
	
	<c:forEach var="coupon" items="${couponList}">
	<c:if test="${coupon.state == 0}">
	<fmt:formatDate var="formatDt" value="${coupon.period}" pattern="yyyy-MM-dd"/>
	<tr>
		<td>${coupon.couponContents}</td>
		<td>${formatDt}</td>
		<td>${coupon.day}일</td>
		<td>${coupon.limit}개</td>
		<td>
		<form name="form" method="post" action="<c:url value='/company/list/coupon/stop' />">
			<input type="hidden" name="couponId" value="${coupon.couponId}"/>
			<input type="button" value="중단하기" onClick="submitForm()">
		</form>
		</td>
		<td>
        	<a href='<c:url value="/company/list/coupon/detail">
          	<c:param name="couponId" value="${coupon.couponId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>

<h4>발급 중지, 기간 만료 쿠폰</h4>
<table class="table">
	<tr>
		<th>쿠폰 내용</th>
		<th>쿠폰 발급기간</th>
		<th>상태</th>
		<th>사용 관리</th>
	</tr>
	
	<c:forEach var="coupon" items="${couponList}">
	<c:if test="${coupon.state != 0}">
	<fmt:formatDate var="formatDt" value="${coupon.period}" pattern="yyyy-MM-dd"/>
	<tr>
		<td>${coupon.couponContents}</td>
		<td>${formatDt}</td>
		<td>
		<c:if test="${coupon.state == 1}">
			기간 만료
		</c:if>
		<c:if test="${coupon.state == 2}">
			발급 중지
		</c:if>
		</td>
		<td>
        	<a href='<c:url value="/company/list/coupon/detail">
          	<c:param name="couponId" value="${coupon.couponId}"/></c:url>'>
          	<b>이동하기</b></a>
     	</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
</body>
</html>