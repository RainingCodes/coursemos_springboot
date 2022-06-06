<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트</title>

</head>
<body>
<%@ include file="header/IncludeTopMockUser.jsp"  %>
<div class="container">
	<h3 style="text-align:center">{{user.nickname}}님의 포인트 내역</h3>
	<div style="display: flex; justify-content : center;" >
		<table class="table table-striped" style="width:50%; ">
			<tbody>
				<tr>
					<td>날짜</td>
					<td>내역</td>
					<td>포인트 변동</td>
				</tr>
				<tr v-for="line in infos">
					<td v-for="info in line"><span v-html="info"></td>
				</tr>
				<tr>
					<td colspan="3">total : {{user.points}}</td>
				</tr>
			</tbody>	
		</table>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	new Vue({
    	el: '.container',
        data : {
        	user : {
            	nickname : "김솜솜",
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
            	},
            	{
            		date : '2022-01-15',
            		details : '코스 작성',
            		points : '+20'
            	},
            	{
            		date : '2022-01-18',
            		details : '후기 작성',
            		points : '+20'
            	},
            	{
            		date : '2022-02-04',
            		details : '후기 작성',
            		points : '+20'
            	},
            	{
            		date : '2022-02-08',
            		details : '후기 열람',
            		points : '-5'
            	},
            	{
            		date : '2022-02-12',
            		details : '후기 열람',
            		points : '-5'
            	},
            	{
            		date : '2022-02-28',
            		details : '후기 작성',
            		points : '+20'
            	},
            	{
            		date : '2022-03-01',
            		details : '후기 작성',
            		points : '+20'
            	},
            	{
            		date : '2022-03-08',
            		details : '후기 작성',
            		points : '+20'
            	},
            	{
            		date : '2022-02-04',
            		details : '후기 작성',
            		points : '+20'
            	}
            	]
        }
	});
</script>
</html>