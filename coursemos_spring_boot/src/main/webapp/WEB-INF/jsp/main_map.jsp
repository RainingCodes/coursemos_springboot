<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchNMap</title>
<style>
	body {
		text-align : center;
	}
</style>
</head>
<body>
        <div class="search">
            <form id="search" onsubmit="searchCourse();">
            	<search>
	                <input id="search1" type="text" placeholder="장소를 입력하세요.">
	                <input id="submit" type="submit" value="검색">
	            </search>
                <input id="plus" type="button" value="+" onclick="add_Place()"/>
            </form>
        </div> 
      

        <div id="map"></div>
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
        <script>
	        const add_Place = () => {
	            const search = document.getElementById("search");
	            const search2 = document.createElement('search2');
	            search2.innerHTML = "<input id='search2' type='text' placeholder='장소를 입력하세요.' ><input type='button' value='-' onclick='remove(this)'>";
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
	        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	        var options = { //지도를 생성할 때 필요한 기본 옵션
	        	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	        	level: 3 //지도의 레벨(확대, 축소 정도)
	        };
	
	        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴 
        </script>
    </body>
</html>