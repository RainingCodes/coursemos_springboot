<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>비밀번호 수정</title>
</head>
<style>
	div {
		text-align : center;
	}
	.error {
		color:red;
		font-size:12px;
	}
</style>
<script>
var c = window.location.href.substr(-1);
if(c == 't') {
	window.opener.location.href="/mypage";
	window.close();
}
function change(){
	let form = document.getElementById("sessionMember");
	form.submit();
}
</script>
<body>
	<form:form modelAttribute="sessionMember" method="post">
		<br>
		<div>변경할 비밀번호 : <input type="password" id="passwordCheck" name="passwordCheck"></div>
		<div><form:errors path="password" cssClass="error"/></div><br>
		<div>비밀번호 확인 : <input type="password" id="repw" name="repw"></div>
		<div><form:errors path="repw" cssClass="error" /></div><br>
		<div><button type="button" class="btn-primary" onclick="change();">변경하기</button></div>
		<br>
	</form:form>
</body>
</html>