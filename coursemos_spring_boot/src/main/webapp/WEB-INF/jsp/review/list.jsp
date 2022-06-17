<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
</head>
<body>
	<div class="card mb-4">
		<div class="card-header">작성된 리뷰 목록들</div>
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<ul class="list-unstyled mb-0">
						<c:forEach var="review" items="${reviews}" varStatus="status">
							<li><a href="/review/registered/${review.reviewId}">${review.reviewContents}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>