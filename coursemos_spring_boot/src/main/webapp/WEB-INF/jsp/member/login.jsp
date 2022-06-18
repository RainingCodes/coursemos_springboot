<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
		<jsp:forward page="/" /> 
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
		<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif
}
.container {
	width : 30%;
    margin: 20px auto;
    border: 1px solid #dddd;
    border-radius: 18px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}

.loginBtn {
	padding:10px;
}
.box-2 {
    width: 100%;
}

.h-1 {
    font-size: 24px;
    font-weight: 700;
}

.mt-5, .c {
	text-align : center;
}
t {
	display:block;
    border: 2px solid transparent;
    color: #615f5fdd;
    margin : 15px auto;
}
#login2, #join {
	display: inline-block;
	border-radius:5px;
}
#login2 > a, #join > a {
	text-decoration:none;
	color: white;
}
.space {
	height : 80px;
}
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
function kakaoLogin() {
	Kakao.Auth.login({
		success: function (response) {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function (response) {
				kakaoLoginPro(response)
			},
			fail: function (error) {
				console.log(error)
			},
		})
	},
		fail: function (error) {
			console.log(error)
		},
	}
</script>

<div class="container">
        <div class="body d-md-flex align-items-center justify-content-between">
            <div class="box-2 d-flex flex-column h-100" id="t">
                <div class="mt-5">
                    <p class="mb-1 h-1">로그인</p>
                    	<!--  <div class="loginBtn"><a href="javascript:kakaoLogin()"><img alt="카카오 로그인" src="../img/kakao_login.png" width=200 height=50></a></div>
                    	<div class="loginBtn"><a href="/"><img alt="네이버 로그인" src="../img/naver_login.png" width=200 height=50></a></div>
                    	<div class="loginBtn"><a href="/"><img alt="구글 로그인" src="../img/google_login.png" width=200 height=50></a></div>
                    	<div class="loginBtn"><a href="/mock">임시로그인</a></div> -->
                    	<div class="loginBtn btn-primary btn-sm" id="login2" onclick="location.href='/login2'">로그인</a></div>
                    	<div class="loginBtn btn-secondary btn-sm" id="join" onclick="location.href='/join'">회원가입</a></div>
                    	<br>
                    	<div class="loginBtn btn"><a href="/search/pw">비밀번호를 까먹으셨나요?</a></div>
                    	<div class="space">&nbsp;</div>
                </div>
            </div>
        </div>
    </div>	