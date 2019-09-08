<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
	<!-- import CSS -->
	<link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
	<link href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/lib/jqvmap/jqvmap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
  	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
    <link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="resources/css/style2.css" />
		<script type="text/javascript" src="resources/js/modernizr.custom.28468.js"></script>
		<link href='http://fonts.googleapis.com/css?family=Economica:700,400italic' rel='stylesheet' type='text/css'>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript" src="resources/js/jquery.cslider.js"></script>
<script>


	$(function(){
		$('#da-slider').cslider({
			autoplay	: true,
			bgincrement	: 450
		});
		$("#sidebarrr").load("resources/part/sidebar.jsp");
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	})
	
	
	
</script>
<body>

<aside class="aside aside-fixed" id="sidebarrr" style="position: fixed;">
</aside>

 <div class="content ht-100v pd-0" style="position: fixed;width: 83.5%;">
      <div class="content-header">
        <div class="content-search">
          <i data-feather="search"></i>
          <input type="search" class="form-control" placeholder="Search...">
        </div>
        <nav class="nav">
          ＜
          <a href="" class="nav-link">메뉴1번<i data-feather="help-circle"></i></a>
          <a href="" class="nav-link">메뉴2번<i data-feather="grid"></i></a>
          <a href="" class="nav-link">메뉴3번<i data-feather="align-left"></i></a>
        </nav>
      </div>
      <!-- content-header -->
      <div class="content-body" id="contents-body">
	
		<div id="da-slider" class="da-slider" style="margin-top:0px;margin-bottom:2em; background-image: url('resources/img/waves.gif');width: 100%;">
				<div class="da-slide">
					<h2>Easy management</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
					<a class="da-link" style="text-align: center;">More</a>
					<div class="da-img"><img src="resources/img/2.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>Revolution</h2>
					<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
					<a class="da-link" style="text-align: center;">More</a>
					<div class="da-img"><img src="resources/img/3.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>Warm welcome</h2>
					<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.</p>
					<a class="da-link" style="text-align: center;">More</a>
					<div class="da-img"><img src="resources/img/1.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>Quality Control</h2>
					<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
					<a class="da-link" style="text-align: center;">More</a>
					<div class="da-img"><img src="resources/img/4.png" alt="image01" /></div>
				</div>
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
			</div>

			<div class="card-deck">
				<div class="card">
					<img src="resources/img/1.png" width="100px" height="200px"  class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
				<div class="card">
					<img src="resources/img/2.png" width="100px" height="200px" class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
				<div class="card">
					<img src="resources/img/3.png" width="100px" height="200px"  class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
					
				</div>
				<div class="card">
					<img src="resources/img/3.png" width="100px" height="200px"  class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
					
				</div>
			</div>
			<div class="card-deck">
				<div class="card">
					<img src="resources/img/1.png" width="100px" height="200px"  class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
				<div class="card">
					<img src="resources/img/2.png" width="100px" height="200px" class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
				<div class="card">
					<img src="resources/img/3.png" width="100px" height="200px"  class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
					
				</div>
				<div class="card">
					<img src="resources/img/3.png" width="100px" height="200px"  class="card-img-top" alt="...">
					<div class="card-body">
						<h6 class="card-title">Card title</h6>
						<p class="card-text">Some quick example text...</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
					
				</div>
			</div>
		</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
<style>

.aside-body{
	border: 0 auto;
}
	.banner {position: relative; width: 340px; height: 210px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 340px; height: 210px; margin:0; padding:0;}

</style>
</html>
