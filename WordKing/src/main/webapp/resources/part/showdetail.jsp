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
	<link href='http://fonts.googleapis.com/css?family=Economica:700,400italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/connect.js"></script>

<script>
var RFlag = 0;
var CFlag = 0;

$(function(){
	
	$('#da-slider').cslider({
		autoplay	: true,
		bgincrement	: 450
	});
	$("#sidebarrr").load("resources/part/sidebar.jsp");
	var $banner = $(".banner").find("ul");

});
	
function totalSearch(){
    if (event.keyCode == 13 && $('#totalSearch').val() != '')
    	totalsend();
}

function totalsend()  {
    var SearchList = $('#totalSearch').val();
    $.ajax({
		url:"totalSearch",
		type:"post",
		data:{searchList : SearchList},
		success:function(result){
			$('#contents-body').html('');

			var str = '';
			str += '<div class="card-deck" style="padding-bottom: 20px;">';
			
			for(var i = 0; i < result.length; i++){
				str += '<div class="card">';
				str += '<img src="resources/img/1.png" width="100px" height="200px"  class="card-img-top" alt="...">';
				str += '<div class="card-body">';
				str += '<h6 class="card-title">単語帳の名前 :'+ result[i].title +'</h6>';
				str += '<p class="card-text">作成者 : '+ result[i].userid +'</p>';
				
				if(result[i].category_seq == 1){
					str += '<p><a href="#" class="badge badge-danger">일본어</a></p>';
					}
				else if(result[i].category_seq == 2){
					str += '<p><a href="#" class="badge badge-primary">영어</a></p>';
				}
				else if(result[i].category_seq == 3){
					str += '<p><a href="#" class="badge badge-info">프랑스어</a></p>';
				}
				else if(result[i].category_seq == 4){
					str += '<p><a href="#" class="badge badge-warning">중국어</a></p>';
				}
				else if(result[i].category_seq == 5){
					str += '<p><a href="#" class="badge badge-dark">독일어</a></p>';
				}
				
				str += '<a href="showdetail?seq='+ result[i].seq +'" class="btn btn-primary">詳しく</a>';

				str += '</div>';
				str += '</div>';
				}
			str += '</div>';
			$('#contents-body').append(str);
			}
        });
}
</script>


<body>
<aside class="aside aside-fixed" id="sidebarrr" style="position: fixed;">
</aside>
 <div class="content ht-100v pd-0">

      <div class="content-header">
        <div class="content-search">
          <i data-feather="search"></i>
          <input type="search" class="form-control" placeholder="単語帳検索..." id="totalSearch" onkeyup="totalSearch()">
        </div>
        <nav class="nav">
  
          <a href="" class="nav-link"><i data-feather="help-circle" style="width: 2em;height:2em;"></i></a>
          <a href="" class="nav-link"><i data-feather="grid" style="width: 2em;height:2em;"></i></a>
          <a href="goMypage" class="nav-link"><i data-feather="user" style="width: 2em;height:2em;"></i></a>
        </nav>
      </div>
      <!-- content-header -->
      <div class="content-body" id="contents-body">
	<div id="voca">
		
    <div >
		<h1>単語帳の名前 : ${result[0].title}</h1>
	</div>
	
			<div id="example" style="width: 50%; ">
				<table class="table table-primary"	>
				  <tbody>
				   <thead>
					    <tr>
					      <th scope="col">番号</th>
					      <th scope="col">単語</th>
					      <th scope="col">意味</th>
					    </tr>
					  </thead>
				  	<c:forEach var="result" items="${result}" varStatus="status">
					  	<tr>
					  		<th scope="row">${status.count}</th>
					  		<td>${result.word }</td>
					  		<td>${result.meaning }</td>
					  	</tr>
					</c:forEach>
				  </tbody>
				</table>
				
				<a href="#" class="btn btn-outline-success" style="float:right;">学習しに行く</a>
				
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
</div>
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