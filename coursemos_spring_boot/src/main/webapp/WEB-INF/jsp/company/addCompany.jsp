<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>사업자 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<div class="container">
<center><h1>사업자 등록</h1></center>
<table class="table">
	<form:form modelAttribute="Company">
	<tr>
		<td class="text-center"><form:label path="name">가게명</form:label></td>
		<td><form:input path="name" /><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="companyId">사업자등록번호</form:label></td>
		<td><form:input path="companyId" /><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="phone">전화번호</form:label></td>
		<td><form:input path="phone" /><br></td>
	</tr>
	<tr>
		<td class="text-center"><form:label path="address">주소</form:label></td>
		<td><form:input path="address" /><br></td>
	</tr>
	<tr>
		<td colspan="2" class="text-center"><input type="submit" value="접수하기" /></td>
	</tr>
	</form:form>
</table>
</div>
</body>
</html>