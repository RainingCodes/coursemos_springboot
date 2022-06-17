<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <title>리뷰 신고</title>
</head>
<body>
<div class="container">
  <h1 align="center">리뷰 신고</h1><br>
    <table class="table">
      <thead>
      	<tr>
      		<th>신고 게시글 이름 : ${reportTitle}<br>
      		<c:if test="${reportUserName ne null}">작성자 닉네임 : ${reportUserName}</c:if>
      		</th>
      	</tr>
      </thead>
      <tbody>
      <form:form modelAttribute="Report">
        <tr>
        	<td>
	       		<form:label path="reportCategory">신고 사유</form:label>
	       	</td>
	    </tr>
	    <tr>
	        <td>
	        	<form:radiobuttons path="reportCategory" items="${ReportCodes}" itemLabel="label" itemValue="code"></form:radiobuttons>
	        </td>
	    </tr>
	    <tr>
	        <td>
		        <input type="submit" value="신고하기" />
			</td>
        </tr>
       </form:form>
      </tbody>
    </table>
</div>
</body>
</html>

