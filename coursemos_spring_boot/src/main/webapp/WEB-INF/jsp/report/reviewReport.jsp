<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
      		<th>신고 게시글 이름 : ${reportTitle}</th>
      		<th>작성자 닉네임 : ${reportUserName}</th>
      	</tr>
      </thead>
      <tbody>
        <tr>
        	<td>
	        <form:form modelAttribute="Report">
	        	<form:radiobuttons path="category" items="${ReportCodes}" itemLabel="label" itemValue="code"/>
				<input type="submit" value="신고하기" />
			</form:form>
			</td>
        </tr>
      </tbody>
    </table>
</div>
</html>

