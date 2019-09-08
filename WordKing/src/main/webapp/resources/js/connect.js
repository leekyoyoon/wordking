$("#createAccount").click(function(){
	$("#contents-body").load("resources/part/signUp.jsp");
});

$("#fileUpload").on("click", function () {
	$("#contents-body").load("resources/part/fileForm.jsp");
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

$("#createButton").click(function(){
	var Userid = $("#userId").val();
	var Userpwd = $("#userPwd").val();
	var UserName = $("#userName").val();
	var Email = $("#email").val();
	var Job_seq = $("#job_seq").val();
	var BirthDate = $("#birthDate").val();
	var Favorite = $("#favorite").val();
	
	alert(Userid);
	alert(Userpwd);
	
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
		type: "POST",
		success:function(Data){
			if (Data =="true") {
				$("#contents-body").load("resources/part/home.jsp");
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

