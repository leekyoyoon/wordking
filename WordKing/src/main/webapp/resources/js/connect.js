$("#createAccount").click(function(){
	$("#contents-body").load("resources/part/signUp.jsp");
});

$("#myPage").click(function(){
	$("#contents-body").load("resources/part/myPage.jsp");
});

$("#goUpdate").click(function(){
	$("#contents-body").load("resources/part/userUpgate.jsp");
});

$("#fileWord").click(function(){
	$("#contents-body").load("resources/part/fileForm.jsp");
});

$("#gotoContact").on('click',function(){
	alert("!!");
	   $("#contents-body").load("resources/part/CustomerService.jsp");
});

$("#kButton").on('click',function(){
	alert("!!");
	location.reload();
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
	   
	var Favorite = $(":checkbox:radio[name=favorite]:checked").val();
	
	 var Favorite = '';
	    $('input:checkbox[name="favorite"]:checked').each(function() {

	         if(this.checked){//checked 처리된 항목의 값

	            Favorite +=this.value; 
	            Favorite +=",";
	         }

	    });
	var BirthDate = $("#birthDate").val();
	if (idcheck!=1) {
		alert("아이디 중복체크를 해주세요!!");
		return false;
	}
	  $.ajax({
	      url:"insertUsers",
	      data:{
	         userId : userid,
	         userPwd : userpwd,
	         userName : userName,
	         email : email,
	         job_seq : job_seq,
	         favorite : favorite,
	         birthDate : BirthDate
	      },
	      type: "post",
	      success:function(Data){
	         alert("!@#");
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


