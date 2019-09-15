<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>Home</title>

<!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- import CSS -->
<link rel="stylesheet" href="resources/css/dashforge.css"
	type="text/css">
<link rel="stylesheet"
	href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="resources/lib/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="resources/lib/jqvmap/jqvmap.min.css">
<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/img/favicon.png">

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/connect.js"></script>

<script>
	$("#withdraw").click(function() {
		
		if($('input:checkbox[id="check"]:checked').length < 1){
			alert("チェックしてください。");
			return false;
		}
		
		$.ajax({
			url:"withdraw",
			type:"get",
			success: function(){
				alert("成功");
				location.href="home";
			},
			error: function (){alert("エラー");}
		});
	});
	
</script>

<body>
	<h1>会員脱退</h1>
	<div class="card">
		<div class="card-body">
			<b style="color: blue;">会員脱退後にはID <b style="color: red;">${sessionScope.loginId}</b>
				で 再加入することはできず、IDとデータは復旧できません。<br>
				掲示板型サービスに残っている書き込みは脱退後、削除することはできません。
			</b> <br> <b><input type="checkbox" id="check">&nbsp;&nbsp;案内事項を全て確認しており、これに同意します。</b>
			<a id="withdraw" class="btn btn-primary">脱退</a>
		</div>
	</div>
</body>
<style>
</style>
</html>