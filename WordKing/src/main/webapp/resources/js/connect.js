
$("#goUpdate").click(function(){
	$("#contents-body").load("resources/part/userUpgate.jsp");
});

//contact a태그 누르면 이벤트 함수 호출
$("#gotoContact").on('click',function(){
	$("#contents-body").load("resources/part/CustomerService.jsp");
});

$("#loginBtn").click(function(){
	var userid = $("#userId").val();
	var userpwd = $("#userPwd").val();
	if (userid == "" || userpwd == "") {
		alert("情報を入力してください。");
		return false;
	}
	$.ajax({
		url:"loginUsers",
		data:{
			userId : userid,
			userPwd : userpwd
		},
		type: "POST",
		success:function(Data){
			if (Data =="true") {
				$("#loginDiv").load("resources/part/sidebar.jsp #loginDiv");
				return false;
			} else if(Data == "false"){
				alert("情報が異なります");
				return false;
			}else{
				alert("ERROR!");
				return false;
			}
		}
	})
});

$("#cButton").click(function(){
	var Userid = $("#userIds").val();
	var Userpwd = $("#userPwds").val();
	var UserName = $("#userName").val();
	var Email = $("#email").val();
	var Job_seq = $(":input:radio[name=job_seq]:checked").val();
	var Favorite = '';
	var lastIndex = ($('input:checkbox[name="favorite"]:checked').length)-1;
	alert(lastIndex);
	  $('input:checkbox[name="favorite"]:checked').each(function(index) {
		  Favorite +=this.value;
		  if (index != lastIndex) {
			Favorite += ',';
		}
	         })
	alert(Favorite);
	         
	var BirthDate = $("#birthDate").val();
	if (idcheck!=1) {
		alert("아이디 중복체크를 해주세요!!");
		return false;
	}
	  $.ajax({
	      url:"insertUsers",
	      data:{
	         userId : Userid,
	         userPwd : Userpwd,
	         userName : UserName,
	         email : Email,
	         job_seq : Job_seq,
	         favorite : Favorite,
	         birthDate : BirthDate
	      },
	      type: "post",
	      success:function(Data){
	         alert('회원가입 성공!!');
	      }
	   })
	
});

var idcheck = 0;
	
$("#userIds").change(function(){
	   var userid = $("#userIds").val();
	   $.ajax({
	      url:"validUserId",
	      data:{
	         userId : userid
	      },
	      type: "POST",
	      success:function(Data){
	         if (Data =="false") {
	            alert("사용 불가능 합니다.");
	            idcheck=0;
	            return false;
	         } else if(Data == "true"){
	            alert("사용 가능합니다.");
	            idcheck=1;
	            return false;
	         }
	      }
	   })
	});



