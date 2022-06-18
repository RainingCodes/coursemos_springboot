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
<title>제휴 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div class="container">
<center><h1>제휴 관리 페이지</h1></center>

<h3>처리 전</h3>
<table class="table">
	<tr>
		<th>companyId</th>
		<th>회사명</th>
		<th>등록자</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>등록 허가</th>
		<th>등록 거부</th>
	</tr>

	<c:forEach var="list" items="${companyList}">
	<c:if test="${list.accept eq 0}">
	<tr>
		<td>
			${list.companyId}
		</td>
		<td>
			${list.place.placeName}
		</td>
		<td>
			${list.memberId}
		</td>
		<td>
			${list.phone}
		</td>
		<td>
			${list.address}
		</td>
		<td>
		<a href='<c:url value="/admin/company/process">
          	<c:param name="companyId" value="${list.companyId}"/>
          	<c:param name="accept" value="1"/></c:url>'>
          	<b>허가하기</b></a>
		</td>
		<td>
		<a href='<c:url value="/admin/company/process">
          	<c:param name="companyId" value="${list.companyId}"/>
          	<c:param name="accept" value="2"/></c:url>'>
          	<b>거부하기</b></a>
		</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
        
<h3>처리 완료</h3>
<table class="table">
	<tr>
		<th>companyId</th>
		<th>회사명</th>
		<th>등록자</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>초기화</th>
	</tr>

	<c:forEach var="list" items="${companyList}">
	<c:if test="${list.accept ne 0}">
	<tr>
		<td>
			${list.companyId}
		</td>
		<td>
			${list.place.placeName}
		</td>
		<td>
			${list.memberId}
		</td>
		<td>
			${list.phone}
		</td>
		<td>
			${list.address}
		</td>
		<td>
		<a href='<c:url value="/admin/company/process">
          	<c:param name="companyId" value="${list.companyId}"/>
          	<c:param name="accept" value="0"/></c:url>'>
          	<b>초기화</b></a>
		</td>
    </tr>
    </c:if>
	</c:forEach>
</table>
</div>
</body>
</html>