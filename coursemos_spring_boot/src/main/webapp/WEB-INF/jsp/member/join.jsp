<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../header/IncludeTop.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입</title>
<style>
	.container {
		width : 30%;
	    margin: 20px auto;
	    border: 1px solid #dddd;
	    border-radius: 18px;
	    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	}

	.h-1 {
	    font-size: 24px;
	    font-weight: 700;
	}

	.mt-5, .c {
		text-align : center;
	}
    input, label {
    	font-size : 17px;
    }
    label {
    	font-weight : bold;
    }
    .space {
	height : 80px;
	}
	.labels {
		height : 50px;
		width : 200px;
	}
	.datas {
		width : 300px;
	}
</style>
</head>
<body>
	
	<div class="container">
        <div class="body d-md-flex align-items-center justify-content-between">
            <div class="box-2 d-flex flex-column h-100">
                <div class="mt-5">
                	 <p class="mb-1 h-1">회원가입</p>
                	 <table>
						<form:form modelAttribute="member" action="/member/register" method="post">
							<tr>
								<td class="labels"><form:label path="nickName">회원 닉네임</form:label></td>
								<td class="datas"><form:input path="nickName" /><td>
							</tr>
							<tr>
								<td class="labels"><form:label path="password">비밀번호</form:label></td>
								<td class="datas"><form:password path="password" /></td>
							</tr>
							<tr>
								<td class="labels"><form:label path="genderCode">성별</form:label></td>
								<td class="datas"><form:select path="genderCode" items="${genderCodes}" itemLabel="label" itemValue="code" /></td>
							</tr>
							<tr>
								<td class="labels"><form:label path="birth">생년월일</form:label></td>
								<td class="datas"><input type="date" id="birth"></td>
							</tr>
							<tr>
								<td class="labels"><form:label path="tasteCode">선호하는 코스 분위기</form:label></td>
								<td class="datas"><form:checkboxes path="tasteCode" items="${tasteCodes}" itemLabel="label" itemValue="code" /></td>
							</tr>
							<tr>
								<td colspan=2><input type="submit" value="회원가입" /></td>
							</tr>
						</form:form>
					</table>
					<div class="space">&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
                
</body>
</html>