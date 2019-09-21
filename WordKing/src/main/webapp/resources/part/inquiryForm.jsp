<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function(){

		$("#insertInquiryBtn").on('click',function(){
			$("#insertInquiry").submit();
		});
		
		$("#insertInquiryCancelBtn").on('click',function(){
			$("#gotoInquiry").submit();
		});
		
		if($("#insertInquiryResult").val == "true"){
			alert("登録しました。");
			window.loaction="myPage";
		}
	});	

</script>
<title>1대1 문의하기</title>
</head>
<body>
	<form id="insertInquiry" action="insertInquiry" method="POST" enctype="multipart/form-data">
		<div class="cutomerInfo">
			<div class="title">회원 정보</div>
			<div class="info" id="inquiryuserid" value="${sessionScope.loginId}"><span>아이디</span>${sessionScope.loginId}</div>
			<div class="info" id="loginEmail"><span>이메일</span>${sessionScope.email}
			<input type="checkbox" name="replyEmailCheck" value="replyMail" id="replyMailChkBox"> 답변여부 메일로 받음</div>
		</div>
		<hr>	
		<div class="inquiryInfo">
			<div class="title"> 문의 정보</div>
			<br>
			<div class="inquiryInput" id="inquiryOption"><span>분류</span>
				<input type="radio" name="inquirycategory" value="customer">회원
				<input type="radio" name="inquirycategory" value="note">단어장
				<input type="radio" name="inquirycategory" value="test">시험
			</div>
			<div class="inquiryInput" id="inquiryTitleDiv"><span>제목</span>
				<input type="text" name="inquirytitle" placeholder="제목을 입력해주세요." id="inquiryTitle"></div>
			<div class="inquiryInput" id="inquiryContentDiv"><span>내용</span>
				<input type="text" name="inquirycontent" placeholder="내용을 입력해주세요." id="inquiryContent"></div>
			<div class="inquiryInput" id="inquiryFileuploadDiv"><span>첨부파일</span>
				<input type="file" name="upload" id="upload"></div><br>
		</div>
	</form>
		<div class="inquiryBtns" id="inquiryBtns">
				<input type="button" class="btn btn-light" id="insertInquiryBtn" value="登録">
				<input type="button" class="btn btn-light" id="insertInquiryCancelBtn" value="カンスル">
		</div>
	<input type="hidden" id="insertInquiryResult" value="${result}">
</body>
</html>