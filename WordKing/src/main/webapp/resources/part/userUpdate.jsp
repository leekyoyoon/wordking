<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
   <title>Home</title>
   
   <!-- Required meta tags -->
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
   <!-- import CSS -->
   <link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
   <link rel="stylesheet" href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="resources/lib/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="resources/lib/jqvmap/jqvmap.min.css">
   <link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
     <link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
   
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/connect.js"></script>

<script>
   $(function(){
	  select();
	   
   });
   
   function select(){
	 	$.ajax({
	 		url: "select",
	 		type: "post",
	 		success: function(vo) {
	 			$('#userName').val(vo.userName);
	 			$('#email').val(vo.email);
	 			var job_seq = vo.job_seq;
	 			$('input:radio[name=job_seq]:input[value=' + job_seq + ']').attr("checked", true);
	 			$('#birthDate').val(vo.birthDate);
	 		},
	 		error: function() {
	 			alert("실패");
	 		}
	 	});  
   };
   
   $('#userUpdate').on('click', userUpdate);
   
   function userUpdate() {
	   var userName = $('#userName').val();
		var userPwds = $('#userPwds').val();
		var email = $('#email').val();
		var Job_seq = $(":input:radio[name=job_seq]:checked").val();
		var BirthDate = $("#birthDate").val();
	   
	   formcheck();
	   
	   $.ajax({
		  url: "userUpdate",
		  type: "post",
		  data:{
		         userPwd : userPwds,
		         userName : userName,
		         email : email,
		         job_seq : Job_seq,
		         birthDate : BirthDate
		      },
		  success: function(){
			alert("성공");  
		    $("#contents-body").load("resources/part/myPage.jsp");
		  },
		  error: function(){
			  alert("실패");  
		  }
	   });
   }
   
   function formcheck() {
	 
	 if(userPwds.length == 0) {
		 alert("패스워드를 입력하세요");
		 return false;
	 }
	 
	 if(userName.length == 0) {
		 alert("이름을 입력하세요");
		 return false;
	 }
	 
	 if(email.length == 0) {
		 alert("이멜을 입력하세요");
		 return false;
	 }
	 
	 if(userPwds.length < 3 || userPwds.length > 10) {
		 alert("비밀번호는 3자리에서 10자리 까지만 가능합니다.");
		 return false;
	 }
	 return true;
   };
</script>
<body>
<h1>個人情報修正</h1>

    <div class="content content-fixed content-auth" id="page_signup" style="margin-top: 0;">
      <div class="container">
        <div class="media align-items-stretch justify-content-center ht-100p">
          <div class="sign-wrapper mg-lg-r-50 mg-xl-r-60">
            <div class="pd-t-20 wd-100p">
           　			  
             <h4 class="tx-color-01 mg-b-5">個人情報</h4>
              <p class="tx-color-03 tx-16 mg-b-40">WordKing</p>     
             
                <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">ID</label>
                </div>
                	${sessionScope.loginId}
              </div> 
             
             <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">パスワード</label>
                </div>
                <input type="password" class="form-control" id="userPwds" placeholder="パスワード">
              </div>
              
             <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">名前</label>
                </div>
              	     <input type="text" class="form-control" id="userName">
             </div>
              
              
              <div class="form-group">
                 <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">メールアドレス</label>
                </div>
                <input type="email" class="form-control" id="email" placeholder="メールアドレス">
              </div>
              
              
              <div class="form-group">
                 <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">職業</label>
                </div>
            <input type="radio" name="job_seq" id="job_seq" value="1" >学生   &nbsp;
            <input type="radio" name="job_seq" id="job_seq" value="2" >会社員   &nbsp;
            <input type="radio" name="job_seq" id="job_seq" value="3" >主婦   &nbsp;
            <input type="radio" name="job_seq" id="job_seq" value="4" >その以外に   &nbsp;
              </div>
              
              <div class="form-group">
                  <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">イメージ</label>
                </div>
              </div>
           
            <div class="form-group">
                  <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">興味がある言語</label>
                </div>
                 <input type="checkbox" name="favorite" value="japanese" >日本語   &nbsp;
             <input type="checkbox" name="favorite" value="english" >英語   &nbsp;
             <input type="checkbox" name="favorite" value="french," >フランス語   &nbsp;
            <input type="checkbox" name="favorite" value="chinese" >中国語   &nbsp;
            <input type="checkbox" name="favorite" value="german" >ドイツ語   &nbsp;
              </div>
              
              <div class="form-group">
               <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">生年月日</label>
                </div>
            <input type="date" class="form-control" id="birthDate">
              </div>
              
              <div class="form-group tx-12">
                By WordKing <strong>Create an account</strong> below, you agree to our terms of service and privacy statement.
              </div><!-- form-group -->

              <button class="btn btn-brand-02 btn-block" id="userUpdate">個人情報修正完了</button> 
              
              
             
              <div class="tx-13 mg-t-20 tx-center">Already have an account? <a href="page-signin.html">Sign In</a></div>
            </div>
          </div><!-- sign-wrapper -->
          <div class="media-body pd-y-30 pd-lg-x-50 pd-xl-x-60 align-items-center d-none d-lg-flex pos-relative">
            <div class="mx-lg-wd-500 mx-xl-wd-550">
              <img src="https://via.placeholder.com/1280x1225" class="img-fluid" alt="">
            </div>
            <div class="pos-absolute b-0 r-0 tx-12">
              Social media marketing vector is created by <a href="https://www.freepik.com/pikisuperstar" target="_blank">pikisuperstar (freepik.com)</a>
            </div>
          </div><!-- media-body -->
        </div><!-- media -->
      </div><!-- container -->
    </div><!-- content -->

    <footer class="footer">
      <div>
      </div>
      <div>
        <nav class="nav">
          <a href="https://themeforest.net/licenses/standard" class="nav-link">Licenses</a>
          <a href="../../change-log.html" class="nav-link">Change Log</a>
          <a href="https://discordapp.com/invite/RYqkVuw" class="nav-link">Get Help</a>
        </nav>
      </div>
    </footer>



<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
<style>

</style>
</html>