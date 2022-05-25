<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="javascript" href="../js/menu.js" />
<link rel="stylesheet" href="../css/styles.css" />
</head>
<body>
<%@ include file="header/IncludeTopMockUser.jsp"  %>
<div class="d-flex" id="wrapper" style="padding:5%;">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper" >
                <div class="sidebar-heading border-bottom bg-light" style="text-align:center">메뉴</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mypage">내 정보</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/mycourse">만든 코스 목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/scrap">스크랩한 코스 목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/company">제휴 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/review">작성한 후기 목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/user/coupon">다운받은 할인권 목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/user/report">신고함</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Page content-->
                <table>
                	<tr>
                		<th>로그인 유형</th> <th>닉네임</th>
                	</tr>
                	<tr>
                		<td>{{user.logintype}}</td><td>{{user.nickname}}</td>
                	</tr>
                </table>
            </div>
</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	    <script>
	        new Vue({
	            el: '#page-content-wrapper',
	            data : {
	            	user : {
	            		nickname : "김솜솜",
	            		logintype: "kakao",
	            		points: 150
	            	},
	            	infos : 
	            		[ {
	            			date : '2021-12-21',
	            			details : '코스 작성',
	            			points : '+20'
	            		},
	            		{
	            			date : '2022-01-14',
	            			details : '후기 작성',
	            			points : '+20'
	            		}
	            		]
	            }
	        });
	        $(function () {
				$('[data-toggle="tooltip"]').tooltip()
			})
	    </script>
</body>
</html>