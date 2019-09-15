<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home!</title>
	<!-- import CSS -->
	<link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
	<link href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/lib/jqvmap/jqvmap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
  	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
    <link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/style2.css" />
	<link href='http://fonts.googleapis.com/css?family=Economica:700,400italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/connect.js"></script>
<script>


	$(function(){
		$("#sidebarrr").load("resources/part/sidebar.jsp");
	})
	
</script>
<body>
<aside class="aside aside-fixed" id="sidebarrr" style="position: fixed;">
</aside>
 <div class="content ht-100v pd-0">


      <div class="content-header">
        <div class="content-search">
          <i data-feather="search"></i>
          <input type="search" class="form-control" placeholder="Search...">
        </div>
        <nav class="nav">
  
          <a href="" class="nav-link"><i data-feather="help-circle" style="width: 2em;height:2em;"></i></a>
          <a href="" class="nav-link"><i data-feather="grid" style="width: 2em;height:2em;"></i></a>
          <a class="nav-link" id="myPage"><i data-feather="user" style="width: 2em;height:2em;"></i></a>
        </nav>
      </div>
      <!-- content-header -->
      <div class="content-body" id="contents-body">
	
	<div class="content content-fixed content-auth" id="page_signup" style="margin-top: 0;">
      <div class="container">
        <div class="media align-items-stretch justify-content-center ht-100p">
          <div class="sign-wrapper mg-lg-r-50 mg-xl-r-60">
            <div class="pd-t-20 wd-100p">
             
             <h4 class="tx-color-01 mg-b-5">新規登録!</h4>
              <p class="tx-color-03 tx-16 mg-b-40">WordKingへようこそ.</p>     
             
                <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">ID</label>
                </div>
                <input type="text" class="form-control" id="userIds" placeholder="ID">
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
                <input type="text" class="form-control" id="userName" placeholder="名前">
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
             <input type="checkbox" name="favorite" value="french" >フランス語   &nbsp;
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
                By clicking <strong>Create an account</strong> below, you agree to our terms of service and privacy statement.
              </div><!-- form-group -->

              <button class="btn btn-brand-02 btn-block" id="cButton">WordKing　IDを登録</button> 
             
              <div class="divider-text">or</div>
              <button class="btn btn-outline-KAKAO btn-block" style="margin-bottom: 10%;">Sign Up With KAKAO</button>
            </div>
          </div><!-- sign-wrapper -->
          <div class="media-body pd-y-30 pd-lg-x-50 pd-xl-x-60 align-items-center d-none d-lg-flex pos-relative">
            <div class="mx-lg-wd-500 mx-xl-wd-550">
              <img src="https://via.placeholder.com/1280x1225" class="img-fluid" alt="">
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
	
	
	</div>
</div>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="resources/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="resources/lib/jquery/jquery.min.js"></script>
  	<!-- append theme customizer -->
    <script src="resources/lib/js-cookie/js.cookie.js"></script>
    
    <script type="text/javascript" src="resources/js/jquery.cslider.js"></script>
	<script type="text/javascript" src="resources/js/modernizr.custom.28468.js"></script>
    
</body>
<style>

.aside-body{
	border: 0 auto;
}
	.banner {position: relative; width: 340px; height: 210px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 340px; height: 210px; margin:0; padding:0;}

body{
overflow: hidden;
}

.da-slider{
	border-left : 8px;
	border-right : 8px;
	border-radius : 10px;
	box-shadow : 5px 5px 5px 5px gray;
	/* border-color: black; */
}
</style>
</html>
