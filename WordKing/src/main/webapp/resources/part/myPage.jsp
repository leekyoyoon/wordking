<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
	
	<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- import CSS -->
	<link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
	<link rel="stylesheet" href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="resources/lib/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="resources/lib/jqvmap/jqvmap.min.css">
	<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
  	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
  	
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/connect.js"></script>

<script>
		function goUpdate(){
		$("#aaa").submit();
	}

	function goWithdraw(){
		$("#bbb").submit();
	}
</script>

<body>

<h1>
	マイページ
</h1>

<a onclick="goUpdate()">個人情報修正</a><br>

<a onclick="goWithdraw()">会員脱退</a><br>

<form action="goUpdate" id="aaa" method="POST"></form>
<form action="goWithdraw" id="bbb" method="POST"></form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
<style>

	a:hover {
	cursor: pointer;
}
</style>
</html>