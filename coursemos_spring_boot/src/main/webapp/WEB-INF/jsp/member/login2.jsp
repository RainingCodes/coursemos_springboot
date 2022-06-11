<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
		<jsp:forward page="/" /> 
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
		<%@ include file="../header/IncludeTop.jsp"  %>
</c:if> <!-- if 종료 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다른 방법으로 로그인</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif
}
.container {
	width : 35%;
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
.container .box {
	display:block;
    border: 2px solid transparent;
    color: #615f5fdd;
    margin : 15px auto;
}
#login {
	display: inline-block;
	border-radius:5px;
}
.space {
	height : 80px;
}
label {
	font-size : 20px;
}
input {
	font-size : 30px;
}
	.spaces1 {
		width : 50px;
	}
	.spaces2 {
		height : 30px;
	}
	.error {
		color:red;
		font-size:12px;
	}
</style>
</head>
<body>
<div class="container">
        <div class="body d-md-flex align-items-center justify-content-between">
            <div class="box-2 d-flex flex-column h-100">
                <div class="mt-5">
                    <p class="mb-1 h-1">로그인</p>
                    <div class="spaces2">&nbsp;</div>
                    <table>
                    	<form:form modelAttribute="sessionMember" method="post">
                    		<tr>
                    			<td><form:label path="nickName">회원 닉네임</form:label></td>
                    			<td class="spaces1">&nbsp;</td>
                    			<td><form:input path="nickName" /></td>
                    		</tr>
                    		<tr>
								<td class="spaces">&nbsp;</td>
								<td class="errors" colspan=2><form:errors path="nickName" cssClass="error"/></td>
							</tr>
                    		<tr>
                    			<td colspan=3 class="spaces2">&nbsp;</td>
                    		</tr>
                    		<tr>
                    			<td><form:label path="password">비밀번호</form:label></td>
                    			<td class="spaces1">&nbsp;</td>
                    			<td><form:password path="password" /></td>
                    		</tr>
                    		<tr>
								<td class="spaces">&nbsp;</td>
								<td class="errors" colspan=2><form:errors path="password" cssClass="error"/></td>
							</tr>
                    		<tr>
                    			<td class="spaces2" colspan="3">&nbsp;</td>
                    		</td>	
                    		<tr>
                    			<td colspan="5"><div class="loginBtn btn-primary btn-sm" id="login"><button class="btn-primary">로그인</button></div></td>
                    		</tr>
                    		<tr>
                    			<td colspan="3"><div class="space">&nbsp;</div></td>
                    		</tr>
                    	</form:form>
                    </table>
                    	
                </div>
            </div>
        </div>
    </div>
</body>
</html>