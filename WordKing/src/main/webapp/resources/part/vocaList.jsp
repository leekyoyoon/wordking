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
</script>
<body>
<div class="row" style="margin-bottom: 2.5%;">
  <div class="col-sm-4">
  <div class="search-form" style="width: 75%;">
  <input type="search" class="form-control" placeholder="Search">
  <button class="btn" type="button" style="background-color: white;">検索</button>
</div>
  </div>
  <div class="col-sm-4 offset-sm-4" style="text-align:right; float: right;">
  <button type="button" class="btn btn-outline-secondary" onclick="location.href='goInsertWord'">作成</button></div>
</div>

  <table class="table table-light">
  <thead>
    <tr>
      <th scope="col">Image</th>
      <th scope="col">Category</th>
      <th scope="col">Title</th>
      <th scope="col">Contents</th>
      <th scope="col">Word개수</th>
      <th scope="col">updateDate</th>
    </tr>
  </thead>
  <tbody>
    <tr class="hoverr">
      <th scope="row">1</th>
      <td>Adrian Monino</td>
      <td>Front-End Engineer</td>
      <td>Computer Science</td>
      <td>$120,000</td>
      <td>2019/12/12</td>
    </tr>
    <tr class="hoverr">
      <th scope="row">2</th>
      <td>Socrates Itumay</td>
      <td>Software Engineer</td>
      <td>Computer Engineering</td>
      <td>$150,000</td>
      <td>2019/12/12</td>
    </tr>
    <tr class="hoverr">
      <th scope="row">3</th>
      <td>Reynante Labares</td>
      <td>Product Manager</td>
      <td>Business Management</td>
      <td>$250,000</td>
      <td>2019/12/12</td>
    </tr>
  </tbody>
</table>

<div style="text-align: right;width: 100%;float: right;">
<nav aria-label="Page navigation example" style="text-align: right;float: right;">
  <ul class="pagination mg-b-0">
    <li class="page-item disabled"><a class="page-link page-link-icon" href="#"><i data-feather="chevron-left"></i></a></li>
    <li class="page-item active"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link page-link-icon" href="#"><i data-feather="chevron-right"></i></a></li>
  </ul>
</nav>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/lib/feather-icons/feather.min.js"></script>
    <script src="resources/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 	<script src="resources/lib/jquery/jquery.min.js"></script>
    <script src="resources/js/dashforge.js"></script>
   
    <!-- append theme customizer -->
    <script src="resources/lib/js-cookie/js.cookie.js"></script>
    
</body>
<style>
.aside-body {
	border: 0 auto;
}

.banner {
	position: relative;
	width: 340px;
	height: 210px;
	top: 50px;
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
}

.banner ul {
	position: absolute;
	margin: 0px;
	padding: 0;
	list-style: none;
}

.banner ul li {
	float: left;
	width: 340px;
	height: 210px;
	margin: 0;
	padding: 0;
}

body {
	overflow: hidden;
}

.da-slider {
	border-left: 8px;
	border-right: 8px;
	border-radius: 10px;
	box-shadow: 5px 5px 5px 5px gray;
	/* border-color: black; */
}

.hoverr:hover {
	background-color: #ababab;
	cursor: pointer;
}
</style>
</html>