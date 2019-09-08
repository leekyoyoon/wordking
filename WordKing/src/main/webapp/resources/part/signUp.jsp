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
	
</script>
<body>


    <div class="content content-fixed content-auth" id="page_signup" style="margin-top: 0;">
      <div class="container">
        <div class="media align-items-stretch justify-content-center ht-100p">
          <div class="sign-wrapper mg-lg-r-50 mg-xl-r-60">
            <div class="pd-t-20 wd-100p">
             
             <h4 class="tx-color-01 mg-b-5">新規登録</h4>
              <p class="tx-color-03 tx-16 mg-b-40">WordKingへようこそ.</p>     
             
                <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">ID</label>
                </div>
                <input type="text" class="form-control" id="userId" placeholder="ID">
              </div> 
             
             <div class="form-group">
                <div class="d-flex justify-content-between mg-b-5">
                  <label class="mg-b-0-f">パスワード</label>
                </div>
                <input type="password" class="form-control" id="userPwd" placeholder="パスワード">
              </div>
              
             <div class="form-group">
                <label>名前</label>
                <input type="text" class="form-control" id="userName" placeholder="名前">
              </div>
              
              
              <div class="form-group">
                <label>メールアドレス</label>
                <input type="email" class="form-control" id="email" placeholder="メールアドレス">
              </div>
              
              
              <div class="form-group">
                <label>職業</label><br>
				<input type="radio" name="job_seq" id="job_seq" value="1" >学生   &nbsp;
				<input type="radio" name="job_seq" id="job_seq" value="2" >会社員   &nbsp;
				<input type="radio" name="job_seq" id="job_seq" value="3" >主婦   &nbsp;
				<input type="radio" name="job_seq" id="job_seq" value="4" >その以外に   &nbsp;
              </div>
              
              <div class="form-group">
              	<label>イメージ</label><br>
              </div>
           
				<div class="form-group">
              	<label>興味がある言葉</label><br>
              	<input type="checkbox" name="" value="japanese" >日本語   &nbsp;
			    <input type="checkbox" name="" value="english" >英語   &nbsp;
			    <input type="checkbox" name="" value="french," >フランス語   &nbsp;
				<input type="checkbox" name="" value="chinese" >中国語   &nbsp;
				<input type="checkbox" name="" value="german" >ドイツ語   &nbsp;
              </div>
              
              <div class="form-group">
               <label>生年月日</label><br>
				<select name="birthDate"><!-- 선택하는거 select -->
					<option value="1990">1990</option><!--  option 설정 value는 서버쪽으로 전송 중간에는 사람이 보여지는 값 -->
					<option value="1991">1991</option>
					<option value="1992">1992</option>
					<option value="1993">1993</option>
					<option value="1994">1994</option>
					<option value="1995">1995</option>
				</select>
				<select name="birthmonths">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select name="birthday">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
              </div>
              
              <div class="form-group tx-12">
                By clicking <strong>Create an account</strong> below, you agree to our terms of service and privacy statement.
              </div><!-- form-group -->

              <button class="btn btn-brand-02 btn-block" id="createButton">WordKing　IDを登録</button> 
             
              <div class="divider-text">or</div>
              <button class="btn btn-outline-KAKAO btn-block">Sign Up With KAKAO</button>
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
        <span>&copy; 2019 DashForge v1.0.0. </span>
        <span>Created by <a href="http://themepixels.me">ThemePixels</a></span>
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
