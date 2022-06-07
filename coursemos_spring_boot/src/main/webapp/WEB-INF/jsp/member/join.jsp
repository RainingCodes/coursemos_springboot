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
		width : 35%;
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
    input, label,span {
    	font-size : 17px;
    }
    label, #birht {
    	font-weight : bold;
    }
    .space {
	height : 80px;
	}
	.labels {
		height : 30px;
		width : 230px;
	}
	.datas {
		width : 330px;
	}
	.spaces {
		width : 200px;
		height:3px;
	}
	.smallSpace {
		height : 15px;
	}
	span {
		padding : 5px;
	}
	.error {
		color:red;
		font-size:12px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$( document ).ready( function() {
	$("#birth").html(new Date().toISOString().substring(0, 10));
	$("#birth").css("font-weight", "bold");
  } );


</script>
</head>
<body>
	
	<div class="container">
        <div class="body d-md-flex align-items-center justify-content-between">
            <div class="box-2 d-flex flex-column h-100">
                <div class="mt-5">
                	 <p class="mb-1 h-1">회원가입</p>
                	 <table>
						<form:form modelAttribute="member" method="post">
							<tr>
								<td class="smallSpace" colspan=2></td>
							</tr>
							<tr>
								<td class="labels"><form:label path="nickName">회원 닉네임</form:label></td>
								<td class="datas"><form:input path="nickName" /><td>
							</tr>
							<tr>
								<td class="spaces">&nbsp;</td>
								<td class="errors" colspan=2><form:errors path="nickName" cssClass="error" /></td>
							</tr>
							<tr>
								
								<td class="labels"><form:label path="password">비밀번호</form:label></td>
								<td class="datas"><form:password path="password"  /></td>
							</tr>
							<tr>
								<td class="spaces">&nbsp;</td>
								<td class="errors" colspan=2><form:errors path="password" cssClass="error"/></td>
							</tr>
							<tr>
								<td class="labels"><form:label path="genderCode">성별</form:label></td>
								<td class="datas"><form:radiobuttons path="genderCode" items="${genderCodes}" itemLabel="label" itemValue="code" /></td>
							</tr>
							<tr>
								<td class="spaces">&nbsp;</td>
								<td class="errors" colspan=2><form:errors path="genderCode" cssClass="error"/></td>
							</tr>
							<tr>
								<td class="labels"><form:label path="birth">가입일</form:label></td>
								<td class="datas"><span id="birth"></span></td>
								
							</tr>
							<tr>
								<td class="spaces">&nbsp;</td>
							</tr>
							<tr>
								<td class="labels"><form:label path="tasteCode">선호하는 코스 분위기</form:label></td>
								<td class="datas"><form:checkboxes path="tasteCode" items="${tasteCodes}" itemLabel="label" itemValue="code" /></td>
							</tr>
							<tr>
								<td class="smallSpace" colspan=2></td>
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