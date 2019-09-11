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
<title>1대1 문의하기</title>
</head>
<body>
<h3>1:1 문의하기</h3>
<hr>

<div class="cutomerInfo">
	<div class="title">회원 정보</div>
	<br>
	<div class="info" id="loginId"><span>아이디</span>${sessionScope.loginId}</div>
	<div class="info" id="email"><span>이메일</span>${sessionScope.email}
	<input type="checkbox" name="replyMail" value="replyMail" id="replyMailChkBox"> 답변여부 메일로 받음</div>
</div>
<br>
<hr>	
	<form id="" method="post">
		<div class="qnaInfo">
			<div class="title"> 문의 정보</div>
			<br>
			<div class="qnaInput" id="qnaOption"><span>분류</span>
				<input type="radio" name="qnaChoice" value="cutomer">회원
				<input type="radio" name="qnaChoice" value="note">단어장
				<input type="radio" name="qnaChoice" value="test">시험
			</div>
			<div class="qnaInput" id="qnaTitleDiv"><span>제목</span>
			<input type="text" name="qnaTitle" value="제목을 입력해주세요." id="qnaTitle"></div>
			<div class="qnaInput" id="qnaContentDiv"><span>내용</span>
			<input type="text" name="qnaContent" value="내용을 입력해주세요." id="qnaContent"></div>
			<input type="submit" name="qnaSubmit" id="qnaSubmit" value="등록하기">
			<input type="button" name="qnaCancel" id="qnaCancel" value="취소하기">
		</div>
	</form>

</body>
</html>