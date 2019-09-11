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

<title>������</title>
</head>
<body>
<h3>�����̵� �������.</h3>
<hr>	

<div class="csMenu">
	<div class="faqTitle">���� ã�� ���� - �ñ��Ͻ� ������ ã�ƺ�����.</div>
	<div class="faqSearch">
		���� ã�� ���� <input type="text" name="faqSearchKeyword" id="faqSearchKeyword" value="���ǻ����� �Է��ϼ���.">
		<button class="searchBtn" id="searchBtn">�˻�</button>
	</div>
	<br>
	<div class="faq" id="faq">
		<table class="table table-hover" id="faqList"></table>
	</div>
	
	<br>
	<hr>
	
	<div class="noticeTitle">��������  - Ȯ�����ֽñ� �ٶ��ϴ�.</div>
	<br>
	<div class="notice" id="notice">
		<table class="table table-hover" id="noticeList"></table>
	</div>
</div>
</body>
</html>