<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>중복확인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var check = false;
var c = window.location.href.substr(-1);
$( document ).ready( function() {
	document.getElementById("nickName").value=sessionStorage.getItem("nickName");
	if(c == 't') {
		$("#message").html("이미 있는 닉네임입니다.");
		$("#message").css({ "color" : "red"});
		check = false;
	}
	if(c == 'f') {
		$("#message").html("사용이 가능한 닉네임입니다.");
		$("#message").css({ "color" : "blue"});
		check = true;
	}
});
function closePopup(){
	if(check == false) {
		alert("중복 확인이 되지 않았습니다.");
	} else {
		window.opener.document.getElementById("nickName").value = document.getElementById("nickName").value;
		window.opener.document.getElementById("check").value = 't';
		alert(window.opener.document.getElementById("check").value);
		window.close();
	}
		
}
function checkNick(){
	sessionStorage.setItem("nickName", document.getElementById("nickName").value);
	let form = document.getElementById("check");
	form.action=window.location.href;
	form.submit();

	
}
</script>
<style>
	div {
		text-align : center;
	}
	
</style>
</head>
<body>
	<div>
	<br>
	<form method="post" id="check">
		<input id=nickName name="nickName">
		<button type="button" class="btn-primary" onclick="checkNick();">중복확인</button>
		<br>
		<div><button type="button" class="btn-primary" onclick="closePopup();">창닫기</button></div>
		<div id=message></div>
	</form>
	</div>
</body>
</html>