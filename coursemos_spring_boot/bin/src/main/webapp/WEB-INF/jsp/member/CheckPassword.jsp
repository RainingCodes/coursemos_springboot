<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var check = false;
var c = window.location.href.substr(-1);
$( document ).ready( function() {
	if(c == 'f') {
		$("#message").html("비밀번호가 일치하지 않습니다.");
		$("#message").css({ "color" : "red"});
		check = false;
	}
	if(c == 't') {
		window.opener.location.href="/member/update";
		check = true;
		window.close();
		check = false;
	}
  } );
function closePopup(){
	if(check == false) {
		alert("비밀번호 확인이 되지 않았습니다.");
	} else {
		window.close();
	}
}
function checkPw(){
	sessionStorage.setItem("passwordCheck", document.getElementById("passwordCheck").value);
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
	<form method="post" id="check">
		<br>
		<div>비밀번호 : <input type="password" id="passwordCheck" name="passwordCheck"></div>
		<br>
		<div><button type="button" class="btn-primary" onclick="checkPw();">확인</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn-primary" onclick="closePopup();">창닫기</button></div>
		<br>
		<div id=message></div>
	</form>
</body>
</html>