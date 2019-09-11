<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- import CSS -->
	<link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
	<link href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/lib/jqvmap/jqvmap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
  	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
  	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="resources/js/csCenter.js"></script>

<title>고객센터</title>
</head>
<body>
<h3>무엇이든 물어보세요.</h3>
<hr>	

<div class="csMenu">
	<div class="faqTitle">자주 찾는 문의 - 궁금하신 사항을 찾아보세요.</div>
	<div class="faqSearch">
		자주 찾는 문의 <input type="text" name="faqSearchKeyword" id="faqSearchKeyword" value="문의사항을 입력하세요.">
		<button class="searchBtn" id="searchBtn">검색</button>
	</div>
	<br>
	<div class="faq" id="faq">
		<table class="table table-hover" id="faqList"></table>
	</div>
	
	<br>
	<hr>
	
	<div class="noticeTitle">공지사항  - 확인해주시기 바랍니다.</div>
	<br>
	<div class="notice" id="notice">
		<table class="table table-hover" id="noticeList"></table>
	</div>
</div>
</body>
</html>