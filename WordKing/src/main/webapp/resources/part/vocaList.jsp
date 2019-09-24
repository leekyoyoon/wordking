<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
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
	
	$.ajax({
		url:"myVoca",
		type:"post",
		data:{},
		success:function(result){
			var str = '';
			var count = 0;

			
			for(var i = 0; i < result.length; i++){
				if(count > 3){
					str += '</div>';
					count = 0;
					}
				if(count == 0){
					str += '<div id="test" class="card-deck" style="padding-bottom: 20px;">';
					}
				str += '<div class="card">';
				str += '<img src="resources/img/1.png" width="100px" height="200px"  class="card-img-top" alt="...">';
				str += '<div class="card-body">';
				str += '<h6 class="card-title">単語帳の名前 :'+ result[i].title +'</h6>';
				str += '<p class="card-text">作成者 : '+ result[i].userid +'</p>';

				str += '<p><a href="#" class="badge badge-danger"> '+ result[i].category_seq +'</a></p>';

				str += '<a href="showdetail?seq='+ result[i].seq +'" class="btn btn-primary">詳しく</a>';
				str += '</div>';
				str += '</div>';
				count ++;
				}
			str += '</div>';
			$('#test').append(str);
			
		}
	});
})

function totalSearch(){
	    if (event.keyCode == 13 && $('#totalSearch').val() != ''){
	    	totalsend();
		    }
	    else if(event.keyCode == 13 && $('#mySearchSearch').val() != ''){
	    	mysend();
		    }
	}

function mysend()  {
	
    var SearchList = $('#mySearch').val();
	
	$.ajax({
		url:'MySearch',
		type:"post",
		data:{title : SearchList},
		success:function(result){
			$('#test').html('');

			var str = '';
			var count = 0;
			
			for(var i = 0; i < result.length; i++){
				if(count > 3){
					str += '</div>';
					count = 0;
					}
				if(count == 0){
					str += '<div id="test" class="card-deck" style="padding-bottom: 20px;">';
					}
				str += '<div class="card">';
				str += '<img src="resources/img/1.png" width="100px" height="200px"  class="card-img-top" alt="...">';
				str += '<div class="card-body">';
				str += '<h6 class="card-title">単語帳の名前 :'+ result[i].title +'</h6>';
				str += '<p class="card-text">作成者 : '+ result[i].userid +'</p>';

				str += '<p><a href="#" class="badge badge-danger"> '+ result[i].category_seq +'</a></p>';

				str += '<a href="showdetail?seq='+ result[i].seq +'" class="btn btn-primary">詳しく</a>';
				str += '</div>';
				str += '</div>';
				}
			str += '</div>';
			$('#test').append(str);
			}
        });
}

function totalsend()  {
	
        var SearchList = $('#totalSearch').val();
		
		$.ajax({
			url:'totalSearch',
			type:"post",
			data:{searchList : SearchList},
			success:function(result){
				$('#test').html('');

				var str = '';
				var count = 0;
				
				for(var i = 0; i < result.length; i++){
					if(count > 3){
						str += '</div>';
						count = 0;
						}
					if(count == 0){
						str += '<div id="test" class="card-deck" style="padding-bottom: 20px;">';
						}
					str += '<div class="card">';
					str += '<img src="resources/img/1.png" width="100px" height="200px"  class="card-img-top" alt="...">';
					str += '<div class="card-body">';
					str += '<h6 class="card-title">単語帳の名前 :'+ result[i].title +'</h6>';
					str += '<p class="card-text">作成者 : '+ result[i].userid +'</p>';

					str += '<p><a href="#" class="badge badge-danger"> '+ result[i].category_seq +'</a></p>';

					str += '<a href="showdetail?seq='+ result[i].seq +'" class="btn btn-primary">詳しく</a>';
					str += '</div>';
					
					str += '</div>';
					}
				str += '</div>';
				$('#test').append(str);
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
		
      	<div id="test" style="padding-bottom: 20px;">

		</div>
      
      	<div class="search-form" style="width: 30%; margin: auto;">
			<input type="search" class="form-control" placeholder="私の単語帳で検索......" id="mySearch" onkeyup="totalSearch()">
			<i data-feather="search"></i>
		</div>
	</div>
</div>
      
    
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