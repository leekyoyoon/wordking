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
	var userid = $("#userId").val();
	var userpwd = $("#userPwd").val();
	var userName = $("#userName").val();
	var email = $("#email").val();
	var job_seq = $("#job_seq").val();
	
	
	alert("클릭");
	$.ajax({
		url:"signUp",
		data:{
			userId : userid,
			userPwd : userpwd,
			userName : userName,
			email : email,
			job_seq : job_seq
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

