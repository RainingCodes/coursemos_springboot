<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
<h4>${nickname}님의 ${company.companyName}에 관한 정보입니다.</h4>
<table class="table">
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
	</tr>
	</c:if>
</table>
</div>
</body>
</html>