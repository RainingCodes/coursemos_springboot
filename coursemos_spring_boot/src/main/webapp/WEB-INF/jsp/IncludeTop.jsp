<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스모스</title>
<style>
@charset "UTF-8";
	table {
		width : 100%;
	}
	.left {
		width : 30%;
	}
	.logo {
		width : 40%;
	}
	.right {
		width : 30%;
	}
	td {
		text-align:center;
	}
	.logo input{
		width : 30%;
		object-fit: contain;
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
	        <input type="image" border="0" src="../img/logo.png">
	    </td>
	    <td class="right">
	      <button class="btn btn-primary" @click="login">로그인</button>
	    </td>
	  </tr>
	</table>
	<hr>
</body>

</html>