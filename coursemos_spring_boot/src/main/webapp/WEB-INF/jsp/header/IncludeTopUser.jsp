<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모스</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style scoped>
	#map {
    	margin: 0 25%;
        border: 1px #a8a8a8 solid;
        width : 800px;
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
	.tooltip {
	  position: relative;
	  display: inline-block;
	  border-bottom: 1px dotted black;
	}
	
	.tooltip .tooltiptext {
	  visibility: hidden;
	  background-color: black;
	  color: #fff;
	  text-align: center;
	  border-radius: 6px;
	  
	  /* Position the tooltip */
	  position: absolute;
	  z-index: 1;
	  top: 100%;
	  left: 50%;
	  margin-left: -60px;
	}
	
	.tooltiptext {
	  visibility: hidden;
	}
	.tooltip:hover {
		visibility : visible;
	}
</style>
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
	      <a href="/mypage">{{user.nickname}}</a>님 안녕하세요. 
	      <a>{{user.points}}</a> Points
	      	<span data-toggle="tooltip" class="tooltip-text">
			      <table class="table table-striped">
			      	<tbody>
		        		<tr v-for="line in infos">
		          			<td v-for="info in line"><span v-html="info"></td>
		        		</tr>
		      		</tbody>
			    </table>
			</span>
	      </a>
	      
	  </tr>
	</table>
	<div v-for="info in infos"><span v-html="info"></span></div>
	<hr>
</body>
</html>