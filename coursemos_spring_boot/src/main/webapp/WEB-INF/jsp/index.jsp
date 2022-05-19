<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/top_style.css" >
</head>
<body>
<%@ include file="IncludeTop.jsp"  %>
		<div class="search">
            <form id="search" onsubmit="searchCourse();">
                <input id="search1" type="text" placeholder="장소를 입력하세요.">
                <input id="submit" type="submit" value="검색">
                <br>
                <input id="plus" type="button" value="+" onclick="add_Place()"/>
            </form>
        </div>   
        <div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b20ca8a8081973cdac50c99bc45b5b5"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

</body>
</html>