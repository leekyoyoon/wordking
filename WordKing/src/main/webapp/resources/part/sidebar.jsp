<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
	<link href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/lib/jqvmap/jqvmap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
  	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
  	
	<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/connect.js"></script>
<script>

</script>
<body>


<aside class="aside aside-fixed" id="sidebarr" style="position: fixed;">
      <div class="aside-header">
        <a href="home" class="aside-logo">Word<span>KING</span></a>
        <a href="" class="aside-menu-link">
          <i data-feather="menu"></i>
          <i data-feather="x"></i>
        </a>
      </div>
      <div class="aside-body" style="overflow-x: hidden; overflow-y: scroll;">
      <!-- login in Side_bar -->
        <div class="aside-loggedin" id="loginDiv">
          <c:if test="${sessionScope.loginId !=null }">
          <div class="d-flex align-items-center justify-content-start">
            <a href="" class="avatar"><img src="https://via.placeholder.com/500" class="rounded-circle" alt=""></a>
            <div class="aside-alert-link">
              <a href="" class="new" data-toggle="tooltip" title="You have 2 unread messages"><i data-feather="message-square"></i></a>
              <a href="" class="new" data-toggle="tooltip" title="You have 4 new notifications"><i data-feather="bell"></i></a>
              <a href="" data-toggle="tooltip" title="Sign out"><i data-feather="log-out"></i></a>
            </div>
          </div>
          
          <div class="aside-loggedin-user">
            <a href="#loggedinMsenu" class="d-flex align-items-center justify-content-between mg-b-2" data-toggle="collapse">
            
              <h6 class="tx-semibold mg-b-0">${sessionScope.loginId}</h6>
              <i data-feather="chevron-down"></i>
            </a>
            <p class="tx-color-03 tx-12 mg-b-0">Administrator</p>
          </div>
          <div class="collapse" id="loggedinMenu">
            <ul class="nav nav-aside mg-b-0">
              <li class="nav-item"><a href="" class="nav-link"><i data-feather="edit"></i> <span>Edit Profile</span></a></li>
              <li class="nav-item"><a href="" class="nav-link"><i data-feather="user"></i> <span>View Profile</span></a></li>
              <li class="nav-item"><a href="" class="nav-link"><i data-feather="settings"></i> <span>Account Settings</span></a></li>
              <li class="nav-item"><a href="" class="nav-link"><i data-feather="help-circle"></i> <span>Help Center</span></a></li>
              <li class="nav-item"><a href="" class="nav-link"><i data-feather="log-out"></i> <span>Sign Out</span></a></li>
            </ul>
          </div>  
          </c:if>
				<c:if test="${sessionScope.loginId ==null }">
					<div class="form-group">
						<label for="formGroupExampleInput" class="d-block">ID</label>
						<input type="text" class="form-control" placeholder="id.." id="userId" style="width: 97%;min-width: 90%;resize: none;">
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2" class="d-block">PASSWORD</label>
						<input type="password" class="form-control" placeholder="password.." id="userPwd" style="width: 97%;min-width: 90%;resize: none;">
					</div>
					<div class="form-group">
					<button type="button" class="btn btn-Light" style="width: 47.5%;" id="loginBtn">ログイン</button>
					<button type="button" class="btn btn-Light" id="createAccount" style="width: 47.5%;">新規取得</button>
					</div>
				</c:if>
			</div>
        <!-- aside-loggedin -->
        
        <ul class="nav nav-aside">
          <li class="nav-label" style="font-size: 2em;">単語帳</li>
          <li class="nav-item">
          <a class="nav-link with-sub" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">単語 ▼</a>
			<div class="collapse mg-t-5" id="collapseExample">
			<a href="dashboard-two.html" class="nav-link"><i data-feather="globe"></i> <span>- 新たな単語帳 作成</span></a>
			<a href="dashboard-two.html" class="nav-link"><i data-feather="globe"></i> <span>- 単語 登録</span></a>
			<a href="dashboard-two.html" class="nav-link"><i data-feather="globe"></i> <span>- 単語帳 検索</span></a>
			<a href="dashboard-two.html" class="nav-link"><i data-feather="globe"></i> <span>- 単語 分析</span></a>
			</div>
          
          <li class="nav-item"><a href="dashboard-two.html" class="nav-link"><i data-feather="globe"></i> <span>学習</span></a></li>
          <li class="nav-item"><a href="dashboard-three.html" class="nav-link"><i data-feather="pie-chart"></i> <span>他の単語帳 調べ</span></a></li>
          <li class="nav-item"><a class="nav-link" id="fileUpload" style="cursor:pointer"><i data-feather="life-buoy"></i> <span>単語 File Upload / Download</span></a></li>
          <li class="nav-label mg-t-25" style="font-size: 2em;">試験</li>
          <li class="nav-item"><a href="app-calendar.html" class="nav-link"><i data-feather="calendar"></i> <span>受験</span></a></li>
          <li class="nav-item"><a href="app-chat.html" class="nav-link"><i data-feather="message-square"></i> <span>オススメの試験</span></a></li>
          <li class="nav-item"><a href="app-contacts.html" class="nav-link"><i data-feather="users"></i> <span>試験結果</span></a></li>
          <li class="nav-item"><a href="app-file-manager.html" class="nav-link"><i data-feather="file-text"></i> <span>File Upload / Download</span></a></li>

          <li class="nav-label mg-t-25" style="font-size: 2em;">マイページ</li>
          <li class="nav-item with-sub">
            <a href="" class="nav-link"><i data-feather="file"></i> <span>Other Pages</span></a>
            <ul>
              <li><a href="page-timeline.html">Timeline</a></li>
            </ul>
          </li>
          <li class="nav-label mg-t-25" style="font-size: 2em;">お客様センター</li>
          <li class="nav-item"><a href="../../components" class="nav-link"><i data-feather="layers"></i> <span>Components</span></a></li>
          <li class="nav-item"><a href="../../collections" class="nav-link"><i data-feather="box"></i> <span>Collections</span></a></li>
        </ul>
      </div>
    </aside>
</body>
<style>
/* Shrinking the sidebar from 250px to 80px and center aligining its content*/
 a:hover{
cursor: pointer;
}
.nav-link:hover{
background-color: #989898;
}

#sidebar.active {
    min-width: 80px;
    max-width: 80px;
    text-align: center;
}

/* Toggling the sidebar header content, hide the big heading [h3] and showing the small heading [strong] and vice versa*/
#sidebar .sidebar-header strong {
    display: none;
}
#sidebar.active .sidebar-header h3 {
    display: none;
}
#sidebar.active .sidebar-header strong {
    display: block;
}

#sidebar ul li a {
    text-align: left;
}

#sidebar.active ul li a {
    padding: 20px 10px;
    text-align: center;
    font-size: 0.85em;
}

#sidebar.active ul li a i {
    margin-right:  0;
    display: block;
    font-size: 1.8em;
    margin-bottom: 5px;
}

/* Same dropdown links padding*/
#sidebar.active ul ul a {
    padding: 10px !important;
}

/* Changing the arrow position to bottom center position, 
   translateX(50%) works with right: 50% 
   to accurately  center the arrow */
#sidebar.active .dropdown-toggle::after {
    top: auto;
    bottom: 10px;
    right: 50%;
    -webkit-transform: translateX(50%);
    -ms-transform: translateX(50%);
    transform: translateX(50%);
}
@media (max-width: 768px) {
    /* 80px and its content aligned to centre. Pushing it off the screen with the
       negative left margin
    */
    #sidebar.active {
        min-width: 80px;
        max-width: 80px;
        text-align: center;
        margin-left: -80px !important;
    }


    /* Reappearing the sidebar on toggle button click */
    #sidebar {
        margin-left: 0; 
    }


    /* Toggling the sidebar header content, 
       hide the big heading [h3] and showing the small heading [strong] and vice versa
    */
    #sidebar .sidebar-header strong {
        display: none;
    }
    #sidebar.active .sidebar-header h3 {
        display: none;
    }
    #sidebar.active .sidebar-header strong {
        display: block;
    }

    /* Downsize the navigation links font size */
    #sidebar.active ul li a {
        padding: 20px 10px;
        font-size: 0.85em;
    }

    #sidebar.active ul li a i {
        margin-right:  0;
        display: block;
        font-size: 1.8em;
        margin-bottom: 5px;
    }

    /* Adjust the dropdown links padding*/
    #sidebar.active ul ul a {
        padding: 10px !important;
    }

    /* Changing the arrow position to bottom center position, 
      translateX(50%) works with right: 50% 
      to accurately  center the arrow */
.dropdown-toggle::after {
        top: auto;
        bottom: 10px;
        right: 50%;
        -webkit-transform: translateX(50%);
        -ms-transform: translateX(50%);
        transform: translateX(50%);
    }

</style>
</html>
