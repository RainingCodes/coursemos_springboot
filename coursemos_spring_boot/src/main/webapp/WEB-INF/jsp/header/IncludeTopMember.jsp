<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ page import="com.example.demo.domain.SessionMember" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모스</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style scoped>
	.searchNMap {
		padding : 30px;
	}
    .top {
		width : 100%;
	}
	.left, .right {
		width : 30%;
	}
	.logo {
		width : 40%;
	}
	td {
		text-align:center;
	}
	.logo img{
		object-fit: contain;
	}
	search, search2, #plus {
		margin : 10px;
	}
	.message {
		font-size : 20px;
	}
</style>
<script>
$(document).ready(function(){
	$('#tooltip').css('display', 'none');
	$('#points').css('color', 'blue');
	$('#points').hover(function() {
		$('#tooltip').css('display','');
	}, function() {
		
	});
	$('#close').onclick(function() {
		$('#tooltip').css('display','none');
	});
});

</script>
</head>
<body>
	<table class="top">
	  <tr>	
	  	<td class="left">
	  		<button class="btn btn-outline-primary" id="register_course" onclick="location.href='/course/register'">코스 등록</button>
	  		<button class="btn btn-outline-primary" id="register_company" onclick="location.href='/company/register'">제휴 등록</button>
	  	</td>
	    <td class="logo">
	        <a href="/"><img alt="로고" src="https://github.com/RainingCodes/img-repository/blob/main/logo.png?raw=true" width="200"></a>
	    </td>
	    <td class="right">
	      <span class="message"><a href="/mypage">${sessionMember.nickName} </a>님 안녕하세요. </span>
	      <span class="message"><a href="/member/points" id="points"> ${sessionMember.points} Points</a></span>
	      	<span id="tooltip" class="tooltip-text">
			      <table class="table table-striped">
			      	<tbody>
			      		<c:set var="listSize" value="${sessionMember.getPointList().size()}" />
		        		<c:forEach var="points" items="${sessionMember.getPointList()}" varStatus="status">
							 <c:if test="${status.index >= listSize - 3 }">
							<tr>
								<td>
									<c:out value="${points.getPointsDate()}" /></td>
								<td><c:out value="${points.getTypeString()}" /></td>
								<td><c:out value="${points.getTypeString2()}" /></td>
							</tr>
							</c:if>
						</c:forEach>
		        		<tr>
		        			<td colspan="3"><a href="/member/points">더보기</a>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="$('#tooltip').css('display','none');" value="닫기" style="font-size:15px;"></td>
		        		</tr>
		      		</tbody>
			    </table>
			</span>
				
				<button type="button" class="btn btn-outline-primary" onclick="location.href='/member/logout'">로그아웃</button>


	      
	  </tr>
	</table>
	<div v-for="info in infos"><span v-html="info"></span></div>
	<hr>
</body>
</html>