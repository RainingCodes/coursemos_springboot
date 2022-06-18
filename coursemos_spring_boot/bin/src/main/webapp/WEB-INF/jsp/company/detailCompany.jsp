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
<title>제휴 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<script>

function submitForm() {
	var answer = confirm("정말로 해지하시겠습니까? 되돌릴 수 없습니다.");
	
	if(answer) {
		alert('제휴가 해지되었습니다.')
		form.submit();
	} else {
	}
}



</script>
<body>
<div class="container">
<center><h1>제휴 상세보기</h1></center>
<h4>${sessionMember.nickName}님의 ${company.place.placeName}에 관한 정보입니다.</h4>
<table class="table">
	<tr>
		<td>사업자등록번호</td>
		<td>${company.companyId}</td>
	</tr>
	<tr>
		<td>제휴 여부</td>
		<td>
		<b>
		<c:if test="${company.accept eq 1}">
    	제휴 진행중
		</c:if>
		<c:if test="${company.accept eq 2}">
    	제휴 거부
		</c:if>
		<c:if test="${company.accept eq 3}">
    	제휴 종료
		</c:if>
		<c:if test="${company.accept eq 0}">
    	제휴 신청
		</c:if>
		</b>
		</td>
	</tr>
	<tr>
		<td>제휴 등록일</td>
		<td><b>${company.registerDate}</b></td>
	</tr>
	<c:if test="${company.accept ne 3}">
	<tr>
		<c:if test="${company.accept eq 1}">
		<td>제휴 해지하기</td>
		<td>
		<form name="form" method="post" action="<c:url value='/company/list/detail/stop' />">
			<input type="hidden" name="companyId" value="${company.companyId}"/>
			<input type="button" value="해지하기" onClick="submitForm()">
		</form>
		</td>
        </c:if>
        <c:if test="${company.accept eq 2}">
		<td>목록에서 삭제하기</td>
		<td><a href='<c:url value="/company/list/detail/delete">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>삭제하기</b></a></td>
        </c:if>
        <c:if test="${company.accept eq 0}">
		<td>제휴 신청 취소하기</td>
		<td><a href='<c:url value="/company/list/detail/delete">
          	<c:param name="companyId" value="${company.companyId}"/></c:url>'>
          	<b>취소하기</b></a></td>
        </c:if>
	</tr>
	<c:if test="${company.accept eq 0}">
	<tr>
		<td>제휴 내용 수정하기</td>
     	<td>
     		<a href='<c:url value="/company/update">
          	<c:param name="id" value="${company.companyId}"/></c:url>'>
          	<b>수정하기</b></a>
     	</td>
	</tr>
	</c:if>
	</c:if>
</table>
</div>
</body>
</html>