<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<style scoped>
    .search {
        position:absolute;
        top:80px;
        left:275px;
        width:700px;
        height:500px;
    }
    .test {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    }

    #map {
        position:absolute;
        top:80px;
        left:600px;
        width: 800px;
        height: 600px;
        border: 1px #a8a8a8 solid;
    }
</style>
    
</head>
<body>
 <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <!-- navbar-brand의 content 변경 -->
            <a class="navbar-brand" href="#">Fixed navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <!-- dropdown 메뉴 삭제 -->
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
                </ul>
            </div>
        </nav>
        <div class="search">
            <form id="search" onsubmit="searchCourse();">
                <input id="search1" type="text" placeholder="장소를 입력하세요.">
                <input id="submit" type="submit" value="검색">
                <br>
                <input id="plus" type="button" value="+" onclick="add_Place()"/>
            </form>
        </div>   
        <div id="map"></div>
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c17b5563968f2fffd356919521833ce2&libraries=services"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
        
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

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
    </body>
</html>