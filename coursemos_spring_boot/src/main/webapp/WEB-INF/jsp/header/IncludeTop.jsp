<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모스</title>
<script src="https://cdn.jsdelivr.net/npm/vu	e/dist/vue.js"></script>
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
	
	.tooltip:hover .tooltiptext {
	  visibility: hidden;
	}
</style>
</head>
<body>
	<table class="top">
	  <tr>
	  	<td class="left"></td>
	    <td class="logo">
	        <a href="/"><img alt="로고" src="../img/logo.png" width="200"></a>
	    </td>
	    <td class="right">
	      <button class="btn btn-outline-primary" v-on:click="login">로그인</button>
	    </td>
	  </tr>
	</table>
	<hr>
	<script>
		new Vue({
			el: '.right',
			data: {
				
			},
			methods: {
				login: function() {
					location.href="/login";
				}
			}
		})
	</script>
</body>
</html>