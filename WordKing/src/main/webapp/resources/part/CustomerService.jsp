<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
<!--<script src="resources/js/csCenter.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

$(function(){
	selectFaqList();
	selectNoticeList();
	
});

function selectFaqList(){
	var Str = null;
	var userStr = null;
	var noteStr = null;
	var testStr = null;
	Str += "<tr><th id='row1' style='width:100px'>대분류</th><th style='width:160px'>중분류</th><th>제목</th></tr>";
	userStr += "<tr><th id='row1' style='width:100px'>대분류</th><th style='width:160px'>중분류</th><th>제목</th></tr>";
	noteStr += "<tr><th id='row1' style='width:100px'>대분류</th><th style='width:160px'>중분류</th><th>제목</th></tr>";
	testStr += "<tr><th id='row1' style='width:100px'>대분류</th><th style='width:160px'>중분류</th><th>제목</th></tr>";
	
	$.ajax({
		url:"selectFaqList",
		type:"post",
		
		success:function(FaqList){
			
			for (var i = 0; i < FaqList.length; i++) {
				Str += "<tr><td>" + FaqList[i].category1 + "</td><td>" + FaqList[i].category2 + "</td><td>";
				Str += "<a class='btn btn-link' data-toggle='collapse' href='#faqContent"+i+"' role='button' aria-expanded='false' aria-controls='faqContent"+i+"'>";
				Str += FaqList[i].faqTitle + "</a>"
				Str += "<div class='collapse' id='faqContent"+i+"'><div class='card card-body'>";
				Str += FaqList[i].faqContent + "</div></div></td></tr>";
				
				if(FaqList[i].category1 == "회원"){
					userStr += "<tr><td>" + FaqList[i].category1 + "</td><td>" + FaqList[i].category2 + "</td><td>";
					userStr += "<a class='btn btn-link' data-toggle='collapse' href='#faqContent"+i+"' role='button' aria-expanded='false' aria-controls='faqContent"+i+"'>";
					userStr += FaqList[i].faqTitle + "</a>"
					userStr += "<div class='collapse' id='faqContent"+i+"'><div class='card card-body'>";
					userStr += FaqList[i].faqContent + "</div></div></td></tr>";
				}
				
				if(FaqList[i].category1 == "단어장"){
					noteStr += "<tr><td>" + FaqList[i].category1 + "</td><td>" + FaqList[i].category2 + "</td><td>";
					noteStr += "<a class='btn btn-link' data-toggle='collapse' href='#faqContent"+i+"' role='button' aria-expanded='false' aria-controls='faqContent"+i+"'>";
					noteStr += FaqList[i].faqTitle + "</a>"
					noteStr += "<div class='collapse' id='faqContent"+i+"'><div class='card card-body'>";
					noteStr += FaqList[i].faqContent + "</div></div></td></tr>";
				}
				
				if(FaqList[i].category1 == "시험"){
					testStr += "<tr><td>" + FaqList[i].category1 + "</td><td>" + FaqList[i].category2 + "</td><td>";
					testStr += "<a class='btn btn-link' data-toggle='collapse' href='#faqContent"+i+"' role='button' aria-expanded='false' aria-controls='faqContent"+i+"'>";
					testStr += FaqList[i].faqTitle + "</a>"
					testStr += "<div class='collapse' id='faqContent"+i+"'><div class='card card-body'>";
					testStr += FaqList[i].faqContent + "</div></div></td></tr>";
				}
			}
			$("#faqTotalList").append(Str);
			$("#faqUserList").append(userStr);
			$("#faqNoteList").append(noteStr);
			$("#faqTestList").append(testStr);
		}
	});
}

function selectNoticeList(){
	var str = null;
	str += "<tr>"
	str += "<th id='row1' style='width:150px'>날짜</th>"
	str += "<th>제목</th>"
	str += "</tr>"
	$.ajax({
		url:"selectNoticeList",
		type:"post",
		success:function(NoticeList){
			for (var i = 0; i < NoticeList.length; i++) {
				str += "<tr>"
				str += "<td>" + NoticeList[i].noticeDate + "</td>";
				str += "<td>"
				str += "<a class='btn btn-link' data-toggle='collapse' href='#noticeContent"+i+"' role='button' aria-expanded='false' aria-controls='noticeContent"+i+"'>";
				str += NoticeList[i].noticeTitle + "</a>"
				str += "<div class='collapse' id='noticeContent"+i+"'>";
				str += "<div class='card card-body'>";
				str += NoticeList[i].noticeContents
				str += "</div></div></td></tr>";
			}
			$("#noticeList").append(str);
		}
	});
}
	
</script>


<style>
	.inquiryBtn {
		float : right;
	}
	.faqSearch {
		float : left;
	}
</style>
<title>고객센터</title>
</head>
<body>
<h3>무엇이든 물어보세요.</h3>
<hr>	

<div class="csMenu">
	<div class="faqTitle">자주 찾는 문의 - 궁금하신 사항을 찾아보세요.</div>
	<div class="faqSearchAndInquiry">
		<div class="faqSearch" id="faqSearch">
			<input type="text" name="faqSearchKeyword" id="faqSearchKeyword" value="문의사항을 입력하세요.">
			<button class="searchBtn" id="searchBtn">검색</button>
		</div>
		<div class="inquiryBtn" id="inquiryBtn">
			<form id="gotoInquiry" action="gotoInquiry" method="get">
			<button type="submit" class="btn btn-primary">1대1 문의하기</button>
			</form>
		</div>
	</div>
	<br>
	<br>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" id="total-tab" data-toggle="tab" href="#total" role="tab" aria-controls="total" aria-selected="true">전체</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="user-tab" data-toggle="tab" href="#user" role="tab" aria-controls="user" aria-selected="false">회원</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="note-tab" data-toggle="tab" href="#note" role="tab" aria-controls="note" aria-selected="false">단어장</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="test-tab" data-toggle="tab" href="#test" role="tab" aria-controls="test" aria-selected="false">시험</a>
		</li>
	</ul>
	<div class="tab-content bd bd-gray-300 bd-t-0 pd-20" id="myTabContent">
		<div class="tab-pane fade show active" id="total" role="tabpanel" aria-labelledby="total-tab">
			<div class="faqTotal" id="faqTotal">
				<table class="table table-hover" id="faqTotalList"></table>
			</div>
		</div>
		<div class="tab-pane fade" id="user" role="tabpanel" aria-labelledby="user-tab">
			<div class="faqUser" id="faqUser">
				<table class="table paginated" id="faqUserList"></table>
			</div>
		</div>
		<div class="tab-pane fade" id="note" role="tabpanel" aria-labelledby="note-tab">
			<div class="faqNote" id="faqNote">
				<table class="table table-hover" id="faqNoteList"></table>
			</div>
		</div>
				<div class="tab-pane fade" id="test" role="tabpanel" aria-labelledby="test-tab">
			<div class="faqTest" id="faqTest">
				<table class="table table-hover" id="faqTestList"></table>
			</div>
		</div>
	</div>
	
	<br>
	<hr>
	
	<div class="noticeTitle">공지사항  - 확인해주시기 바랍니다.</div>
	<br>
		<div class="notice" id="notice">
			<table class="table table-hover" id="noticeList"></table>
			<div id="more_btn_div" align="center">
			<hr>
				<a id="more_btn_a" href="javascript:moreContent('more_list', 10);" >더보기(More)</a>
			<hr>
		</div>
	</div>
</div>
</body>
</html>