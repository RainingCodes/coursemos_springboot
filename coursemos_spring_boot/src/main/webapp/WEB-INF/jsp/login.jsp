<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="IncludeTop.jsp"  %>
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



.container .box input {
	width: 200px;
	height:50px;
}
.box:active,
.box:visited {
    border: 2px solid black;
}

.box:hover {
    border: 2px solid black;
}
.container .box {
	display:block;
    border: 2px solid transparent;
    color: #615f5fdd;
    margin : 15px auto;
}
</style>
<div class="container">
        <div class="body d-md-flex align-items-center justify-content-between">
            <div class="box-2 d-flex flex-column h-100">
                <div class="mt-5">
                    <p class="mb-1 h-1">소셜 로그인</p>
                        	<div class="box"><input type="image" border="0" src="../img/kakao_login.png"></div>
                        	<div class="box"><input type="image" border="0" src="../img/naver_login.png"></div>
                        	<div class="box"><input type="image" border="0" src="../img/google_login.png"></div>
                </div>
            </div>
        </div>
    </div>
