<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>!</title>
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
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
<script src="resources/js/connect.js"></script>
<script>


	var number = 0;
	var valuenow = 0;
	$(function() {
		$("#sidebarrr").load("resources/part/sidebar.jsp");
		$("#front").click(function(){
			valuenow += 10;
			if (number ==0) {
				$("#wordNameH1").html('바뀐 단어');
				$("#MeaningH1").html('바뀐 뜻');
				$('#newProgress').css('width', valuenow);
				number =1;
			} else if (number ==1) {
				$("#wordNameH1").html('되돌아온 단어');
				$("#MeaningH1").html('되돌아온 뜻');
				$('#newProgress').css('width', valuenow);
				number =0;
			}
		});
    let card = document.getElementsByClassName("card")[0],
        moved = 0,
        interval;

    if (!card) return;

    card.addEventListener("click", function(event) {
        clearInterval(interval);
        card.style.transform = "";

        // Do not flip the card if the user is trying to
        // tap a link.
        if (event.target.nodeName === "A") {
            return;
        }

        let cName = card.getAttribute("data-toggle-class");
        let toggled = card.classList.contains(cName);
        card.classList[toggled ? "remove" : "add"](cName);
    });

    interval = setInterval(function() {
        moved = moved ? 0 : 10;
        card.style.transform = "translateY(" + moved + "px)";
        card.style.transform = "background-color : black"
    }, 1500);
});
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
      <h1>단어학습</h1>
	<div class="container" >
	 <div class="row" >
	<div class="col-sm-3" style="background-color: #parent;text-align: right">
	<button class="btn btn-primary" style="width: 100%;margin-top: 5%;height:10%;">단어 뜻</button>
	<button class="btn btn-primary" style="width: 100%;margin-top: 5%;height:10%;">셔플하기</button>
	<button class="btn btn-primary" style="width: 100%;margin-top: 5%;height:10%;">시험보기</button>
	<button class="btn btn-primary" style="width: 100%;margin-top: 5%;height:10%;">목록가기</button>
	</div>
	<div class="col-sm-5" style="background-color: #parent">
	  
	<div class='card-wrapper'>
  <div class='card' data-toggle-class='flipped'>
    <div class='card-front'>
      <div class='layer'>
        <h1 id="wordNameH1" class="w3-animate-opacity">단어</h1>
        <div class='corner'></div>
        <div class='corner'></div>
        <div class='corner'></div>
        <div class='corner'></div>
      </div>
    </div>
    <div class='card-back'>
      <div class='layer'>
        <h1 id="MeaningH1" class="w3-animate-opacity">뜻</h1>
        <div class='corner'></div>
        <div class='corner'></div>
        <div class='corner'></div>
        <div class='corner'></div>
      </div>
    </div>
  </div>
</div>
	<div style="margin-top: 15%;width: 94%;">
	<div class="progress ht-20" >
  <div id="newProgress" class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<div style="margin-top: 10%;width: 94%;">
	<p id="progressss"><a id="previous" style="size: 2em;"><ion-icon name="skip-backward"></ion-icon></a>
	1/10
	<a id="front" style="size: 2em;"><ion-icon name="skip-forward"></ion-icon></a>
	</p></div>
	</div>
	</div>
	<div class="col-sm-4" style="background-color: #parent;max-height: 412px;overflow-y: scroll;overflow-x:hidden;" >
	<label>My 단어장 리스트</label>
	<ul class="list-unstyled">
  <li class="media">
  <img src="resources/img/1.png" class="wd-200 rounded mg-r-20 df"  alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  </li>
  <li class="media mg-t-10">
  <img src="resources/img/2.png" class="wd-200 rounded mg-r-20 df" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  </li>
  <li class="media mg-t-10">
  <img src="resources/img/3.png" class="wd-200 rounded mg-r-20 df" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  
  </li>
    <li class="media mg-t-10">
  <img src="resources/img/3.png" class="wd-200 rounded mg-r-20 df" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  
  </li>
    <li class="media mg-t-10">
  <img src="resources/img/3.png" class="wd-200 rounded mg-r-20 df" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  
  </li>
    <li class="media mg-t-10">
  <img src="resources/img/3.png" class="wd-200 rounded mg-r-20 df" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  
  </li>
    <li class="media mg-t-10">
  <img src="resources/img/3.png" class="wd-200 rounded mg-r-20 df" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  
  </li>
    <li class="media mg-t-10">
  <img src="resources/img/3.png" class="wd-200 rounded mg-r-20 df" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla...
  </div>
  
  </li>
  
	</ul>
	
	
	
	</div>
	</div>
	<hr>
	<footer>
	
	<div class="media" style="height:20%;">
  <img src="resources/img/4.png" class="wd-200 rounded mg-r-20 dz" alt="">
  <div class="media-body">
    <h5 class="mg-b-15 tx-inverse">작성자자</h5>
    컨텐츠부분입니다
  </div>
</div>
	
	</footer>
</div>
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

.card {
  color: #d4cd96;
  font-family: 'Fira Sans', sans-serif;
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  -webkit-transform-origin: 100% 50%;
          transform-origin: 100% 50%;
  -webkit-transform-style: preserve-3d;
          transform-style: preserve-3d;
  width: 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  transition: -webkit-transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49);
  transition: transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49);
  transition: transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49), -webkit-transform 0.6s cubic-bezier(0.49, 0.23, 0.58, 0.49);
}
.card.flipped {
background-color : #parent;
  -webkit-transform: translateX(-100%) rotateY(-180deg);
          transform: translateX(-100%) rotateY(-180deg);
}

.card-front,
.card-back {
  -webkit-backface-visibility: hidden;
          backface-visibility: hidden;
  background-size: 3px 3px;
  background-color: #ffffff;
  border-radius: 1px;
  box-shadow: 0px -6px 8px 0px rgba(0, 0, 0, 0.1), 0px 6px 8px 0px rgba(0, 0, 0, 0.1), 6px 0px 8px 0px rgba(0, 0, 0, 0.1), -6px 0px 8px 0px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  height: 100%;
  left: 0;
  padding: 5%;
  position: absolute;
  top: 0;
  width: 100%;
}

.card-back {
  -webkit-transform: rotateY(180deg);
          transform: rotateY(180deg);
}
.card-back .layer {
   background-size: 3px 3px;
  background-color: #parent;
  color: #302f34;
  height: 100%;
  position: relative;
  width: 100%;
}
.card-back .layer:after {
  content: '';
  display: block;
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  width: 100%;
}
.card-back .layer .top,
.card-back .layer .bottom {
  left: 8%;
  position: absolute;
  z-index: 1;
}
.card-back .layer .top {
  top: 12%;
}
.card-back .layer .bottom {
  bottom: 12%;
}
.card-back .layer h2, .card-back .layer h3, .card-back .layer h4 {
  font-weight: 400;
  margin: 2px 0;
}
.card-back .layer h2 {
  font-size: 18px;
  font-weight: 500;
  text-transform: uppercase;
}
.card-back .layer h3 {
  font-size: 16px;
}
.card-back .layer h4 {
  font-size: 16px;
  font-style: italic;
}

.card-front .layer {
background-color : #parent;
  -webkit-backface-visibility: hidden;
          backface-visibility: hidden;
  display: flex;
  flex-direction: column;
  height: 100%;
  justify-content: center;
  position: relative;
  width: 100%;
}
.card-front .layer h1 {
 background-color : #parent;
  font-size: 32px;
  font-weight: 400;
  letter-spacing: -2px;
  margin: 0 auto;
  padding: 6px 18px 4px;
  text-align: center;
}
.card-back .layer h1 {
 background-color : #parent;
  font-size: 32px;
  font-weight: 400;
  letter-spacing: -2px;
  margin: 0 auto;
  padding: 6px 18px 4px;
  text-align: center;
}
.card-front .layer .corner {
  background-color : #parent;
  -webkit-backface-visibility: hidden;
          backface-visibility: hidden;
  border-right: 2px solid #d4cd96;
  border-top: 2px solid #d4cd96;
  height: 12px;
  position: absolute;
  width: 12px;
}
.card-front .layer .corner:nth-of-type(1),
.card-back .layer .corner:nth-of-type(1) {
	color: #d4cd96;
	background-color : #parent;
  right: 0;
  top: 0;
}
.card-front .layer .corner:nth-of-type(2),
.card-back .layer .corner:nth-of-type(2) {
color: #d4cd96;
  left: 0;
  top: 0;
  -webkit-transform: rotateZ(-90deg);
          transform: rotateZ(-90deg);
}
.card-front .layer .corner:nth-of-type(3),
.card-back .layer .corner:nth-of-type(3) {
color: #d4cd96;
  bottom: 0;
  left: 0;
  -webkit-transform: rotateZ(180deg);
          transform: rotateZ(180deg);
}
.card-front .layer .corner:nth-of-type(4),
.card-back .layer .corner:nth-of-type(4) {
  color: #d4cd96;
  bottom: 0;
  right: 0;
  -webkit-transform: rotateZ(90deg);
          transform: rotateZ(90deg);
}

.card-wrapper {
  height: 271.7647058824px;
  max-width: 420px;
  -webkit-perspective: 600px;
          perspective: 600px;
  position: relative;
  width: 100%;
  transition: -webkit-transform 1s;
  transition: transform 1s;
  transition: transform 1s, -webkit-transform 1s;
}
.layer{
background-color: #parent;
}
.media{
	border-style: solid;
	border-radius: 0.25px;
	border-color: gray;
}
.df{
max-height: 25%;
max-width: 25%;
}
.dz{
max-height: 100%;
max-width: 100%;
}
.w3-animate-opacity{animation:opac 0.8s}@keyframes opac{from{opacity:0} to{opacity:1}}
</style>
</html>
