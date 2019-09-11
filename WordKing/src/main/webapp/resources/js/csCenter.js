$(function(){
	selectFaqList();
	selectNoticeList();
	
	$("#noticeBtn").on('click',function(){
		$("#noticeDetail").toggle();	
	});
	
});

function selectFaqList(){
	var str = 0;
	str += "<tr>";
	str += "<th>대분류</th>";
	str += "<th>중분류</th>";
	str += "<th>제목</th>";
	str += "</tr>";
	
	$.ajax({
		url:"selectFaqList",
		type:"post",
		success:function(FaqList){
			for (var i = 0; i < FaqList.length; i++) {
				str += "<tr>";
				str += "<td>" + FaqList[i].category1 + "</td>";
				str += "<td>" + FaqList[i].category2 + "</td>";
				str += "<td><a onclick='lookFaqDetail("+FaqList[i].faqnum+")'>" + FaqList[i].faqTitle + "</a></td>";
				str += "<td><div class='accordion'><button>"+ "+" + "</div></td>";
				str += "</tr>";
			}
			$("#faqList").append(str);
		}
	});
}

function selectNoticeList(){
	var str = 0;
	str += "<tr>"
	str += "<th>제목</th>"
	str += "<th>날짜</th>"
	str += "</tr>"
		
	$.ajax({
		url:"selectNoticeList",
		type:"post",
		success:function(NoticeList){
			for (var i = 0; i < NoticeList.length; i++) {
				str += "<tr>"
				str += "<td>" + NoticeList[i].noticeDate + "</td>";
				str += "<td>" + NoticeList[i].noticeTitle + "</td>"
				// 토글버튼 테스트 중
				str += "<td><a class='noticeBtn' id='noticeBtn'>" + "+" + "</a>"
				+"<div class='noticeDetail' id='noticeDetail'>"+ NoticeList[i].noticeContents + "</div>"
				str += "</tr>"
			}
			$("#noticeList").append(str);
		}
	});
}

function lookFaqDetail(num){
	alert(num);	
}
