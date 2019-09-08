$("#createAccount").click(function(){
	$("#contents-body").load("resources/part/signUp.jsp");
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


