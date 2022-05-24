<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>코스모스</title>
<link rel="stylesheet" href="../css/top_style.css" >


</head>
<body>
<%@ include file="IncludeTop.jsp"  %>
		<div class="searchNMap">
			<div id="map">
			</div>
			 <div class="search">
	            <form id="search" onsubmit="searchCourse();">
	            	<search>
	            		<input id="search1" type="text" placeholder="장소를 입력하세요.">
	                	<input id="submit" type="submit"v alue="검색">
	            	</search>
	                <br><br>
	                <input id="plus" type="button" value="+" onclick="add_Place()"/>
	            </form>
	          </div>   
			
		</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b20ca8a8081973cdac50c99bc45b5b5"></script>
	<script>
	const add_Place = () => {
        const search = document.getElementById("search");
        const search2 = document.createElement('search2');
        search2.innerHTML = "<input id='search2' type='text' placeholder='장소를 입력하세요.' > <input type='button' value='-' onclick='remove(this)'>";
        search.appendChild(search2);
        document.getElementById('plus').remove();
    }
		const remove = (obj) => {
            document.getElementById('search').removeChild(obj.parentNode);
            const search = document.getElementById("search");
            var newPlus = document.createElement('input');
            newPlus.setAttribute("id", "plus");
            newPlus.setAttribute("type", "button");
            newPlus.setAttribute("value", "+");
            newPlus.setAttribute("onclick", "add_Place()");
            search.appendChild(newPlus);
        }
	
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		 // 지도에 표시할 원을 생성합니다
        var circle = new kakao.maps.Circle({
            center : new kakao.maps.LatLng(33.450701, 126.570667),  // 원의 중심좌표 입니다 
            radius: 200, // 미터 단위의 원의 반지름입니다 
            strokeWeight: 5, // 선의 두께입니다 
            strokeColor: '#75B8FA', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'dashed', // 선의 스타일 입니다
            fillColor: '#CFE7FF', // 채우기 색깔입니다
            fillOpacity: 0.7  // 채우기 불투명도 입니다   
        }); 
        // 지도에 원을 표시합니다 
        circle.setMap(map); 
	</script>
	</div>
</body>
</html>