<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<html>
	<head>
	<meta charset="UTF-8">
        <title>게시글 추가</title>
		<script language="JavaScript">
		var cnt = 0; 
		$(document).ready(function () {
			  $(document).on("click", "input[name='add']", function () {
				  if(cnt >= 10)
					  alert("더 이상 추가할 수 없습니다.");
				  else {
					  cnt++;
					  $("#add_btn").before("<p>학생 <input type='number' name='num" + cnt + "'> 명당 가격 <input type='number' name='price" + cnt +"' > 원</p>");
					  $("#student").val(cnt);
					  }
				  
			  });
			});
		</script>
	</head>
	<input type="button" name="add" value="+" id="add_btn" style="border:none;border-radius:5px; text-align: center; margin-left:300px; height: 30px;">
</html>