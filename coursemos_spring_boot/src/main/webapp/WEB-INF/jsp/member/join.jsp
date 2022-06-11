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
		width : 40%;
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
	$('#register').click( function(){
		check = document.getElementById('check').value;
		if(check == 'f') {
			alert("아이디 중복 확인이 되지 않았습니다.");
		} else {
			let form = document.getElementById("member");
			form.submit();
		}
	});

  } );
function showPopup(){
	var width = 600;
	var height = 30;

	var popupX = (window.screen.width / 2) - (width / 2);

	var popupY= (window.screen.height / 2) - (height / 2);
	let nickName = document.getElementById("nickName").value; 
	sessionStorage.setItem("nickName", nickName);
	openWin = window.open("/join/check","팝업 테스트","height=" + height  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);
     
}

</script>
</head>
<body>
	<input type="hidden" id="check" value="f">
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
								<td width="100"><button  class="btn-primary" type="button" onclick="showPopup();">중복확인</button></td>
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
								<td class="labels"><form:label path="repw">비밀번호 확인</form:label></td>
								<td class="datas"><form:password path="repw"  /></td>
							</tr>
							<tr>
								<td class="spaces">&nbsp;</td>
								<td class="errors" colspan=2><form:errors path="repw" cssClass="error"/></td>
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
								<td class="datas"><form:radiobuttons path="tasteCode" items="${tasteCodes}" itemLabel="label" itemValue="code" /></td>
							</tr>
							<tr>
								<td class="smallSpace" colspan=2></td>
							</tr>
							<tr>
								<td colspan=4><button type="button" class="btn-primary" id="register">회원가입</button></td>
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