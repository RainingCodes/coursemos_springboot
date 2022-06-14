<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionMember.check2 != false}"> <!-- if와 동일 -->
		<%@ include file="../header/IncludeTopMember.jsp"  %>
</c:if> <!-- if 종료 -->
<c:if test="${sessionMember.check2 ==false }">
		<jsp:forward page="/" /> 
</c:if> <!-- if 종료 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>

<style>
	
	#page-content-wrapper {
		padding-left : 10%;
	}
	#sidebar-wrapper {
		padding-left : 15%;
	}
	span {
		width : 50%;
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
	$('#update').click( function(){
		check = document.getElementById('check').value;
		if(check == 'f') {
			alert("아이디 중복 확인이 되지 않았습니다.");
		} else {
			let form = document.getElementById("sessionMember");
			form.submit();
		}
	});

  } );
function showPopup(){
	document.getElementById('check').value = 'f';
	var width = 600;
	var height = 30;

	var popupX = (window.screen.width / 2) - (width / 2);

	var popupY= (window.screen.height / 2) - (height / 2);
	let nickName = document.getElementById("nickName").value; 
	sessionStorage.setItem("nickName", nickName);
	openWin = window.open("/member/update/check","정보 수정","height=" + height  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);
     
}
function showPopup2(){
	var width = 600;
	var height = 30;

	var popupX = (window.screen.width / 2) - (width / 2);

	var popupY= (window.screen.height / 2) - (height / 2);
	let nickName = document.getElementById("nickName").value; 
	sessionStorage.setItem("nickName", nickName);
	openWin = window.open("/member/update/password","비밀번호 변경","height=" + 200  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);
     
}
</script>
</head>
<body>
<%@ include file="./mypage_menu.jsp"  %>
<span id="page-content-wrapper">
<!-- Page content-->
			<input type="hidden" id="check" value="t">
                <table>
                	<form:form modelAttribute="sessionMember" method="post">

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
								<td class="datas"><button type="button" class="btn-primary" onclick="showPopup2();">변경하기</button><td>
							</tr>
							<tr>
								<td class="labels"><form:label path="genderCode">성별</form:label></td>
								<td class="datas" ><form:radiobuttons path="genderCode" items="${genderCodes}" itemLabel="label" itemValue="code" /></td>
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
								<td class="datas" >
								<form:radiobuttons path="tasteCode" items="${tasteCodes}" itemLabel="label" itemValue="code" /></td>
							</tr>
							<tr>
								<td class="smallSpace" colspan=2></td>
							</tr>
							<tr>
								<td colspan=4><button type="button" class="btn-primary" id="update">수정하기</button></td>
							</tr>
					</form:form>
				</table>
</span>          

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

</body>
</html>