<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.demo.domain.SessionMember" %>
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
<title>마이페이지</title>
<link rel="javascript" href="../js/menu.js" />
<link rel="stylesheet" href="../css/styles.css" />
<style>

	#page-content-wrapper {
		margin:auto;
	}
	span {
		width : 40%;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$( document ).ready( function() {
	$('#update').click( function(){
		var width = 600;
		var height = 30;
		var popupX = (window.screen.width / 2) - (width / 2);
		var popupY= (window.screen.height / 2) - (height / 2);
		openWin = window.open("/member/update/check0","비밀번호 확인","height=" + 170  + ", width=" + width  + ", left="+ popupX + ", top="+ popupY / 2);
	});
	$('#withdrawal').click( function(){
		var result = confirm("그 동안 코스모스를 이용한 정보가 다 지워집니다.\n정말 탈퇴하시겠습니까?");
		if(result) {
			location.href="/member/withdrawal";
		} 
		
	});
  } );

</script>
</head>
<body>

<%@ include file="./mypage_menu.jsp"  %>
<span id="page-content-wrapper">
<!-- Page content-->
                <table class="table table-bordered">
                	<tr>
						<th class="labels">회원 닉네임</th>
						<td class="datas">${sessionMember.nickName}</td>
					</tr>
					<tr>
						<th class="labels">성별</th>
						<td class="datas">${sessionMember.getGender()}</td>
					</tr>
					<tr>
						<th class="labels">가입일</th>
						<td class="datas">${sessionMember.birth }</td>
					</tr>
					<tr>
						<th class="labels">선호하는 코스 분위기</th>
						<td class="datas">
						<%
							String taste = ((SessionMember)session.getAttribute("sessionMember")).getTaste();
						%>
						<c:if test="${taste != null}" >
							<c:out value="${taste }"></c:out>
						</c:if>
						<c:if test="${taste == null}" >
							없음
						</c:if>
						</td>
					</tr>
					<tr>
						<th class="labels">현재 포인트</th>
						<td class="datas"><a href="/member/points">${sessionMember.points} Points</a></td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn-primary" id="update">회원 정보 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn-primary" id="withdrawal">회원 탈퇴</button></td>
					</tr>
				</table>
</span>          

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

</body>
</html>