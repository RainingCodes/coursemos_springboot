<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ page import="com.example.demo.domain.SessionMember" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모스</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style scoped>
	#map {
    	margin: 0 25%;
        border: 1px #a8a8a8 solid;
        width : 800px;
        height : 700px;
    }
	.searchNMap {
		padding : 30px;
	}
    #map {
        border: 1px #a8a8a8 solid;
        float : left;
        width : 700px;
        height : 700px;
    }
    input {
    	font-size : 30px;
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
	  		<button class="btn btn-outline-primary" @click="register_course">코스 등록</button>
	  		<button class="btn btn-outline-primary" @click="register_company">제휴 등록</button>
	  	</td>
	    <td class="logo">
	        <a href="/"><img alt="로고" src="../img/logo.png" width="200"></a>
	    </td>
	    <td class="right" v-model="user">
	      <span class="message"><a href="/mypage">${sessionMember.nickName} </a>님 안녕하세요. </span>
	      <span class="message"><a href="/member/points" id="points"> ${sessionMember.points} Points</a></span>
	      	<span id="tooltip" class="tooltip-text">
			      <table class="table table-striped">
			      	<tbody>
		        		<tr v-for="line in infos">
		          			<td v-for="info in line"><span v-html="info"></td>
		        		</tr>
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