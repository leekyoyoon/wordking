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

	function changeOrder(){
		if(RFlag == 1){
			RFlag = 0;
			}
		else if(RFlag == 0){
			RFlag = 1;
			}
		}
	
	function changeWord(){
		if(CFlag == 1){
			CFlag = 0;
			}
		else if(CFlag == 0){
			CFlag = 1;
			}
		}

	var count = 0;
	
	function TestStart(){
		$('#StartTest').html('');
		var str = '';
		var strR = '';
		if(RFlag == 0 && CFlag == 0){			//default 순서대로 단어가 문제
			var Url = 'StartTest';
		}
		else if(RFlag == 1 && CFlag == 0){		//랜덤 순서대로 단어가 문제
			var Url = 'Random';
		}
		else if(RFlag == 0 && CFlag == 1){		//순서대로 의미가 문제
			var Url = 'MeanTest';
		}
		else if(RFlag == 1 && CFlag == 1){		//랜덤 순서대로 의미가 문제
			var Url = 'RanMean';
		}
		$.ajax({
			url:Url,
			type:'post',
			data:{
				seq : ${seq}
				},
			success:function(result){
					count = result.length;
				
					str+='<table class="table">';
					str+='<thead class="table table-striped">';
					str+='<tr>';
					str+='<th scope="col">問題番号</th>';
					str+='<th scope="col">問題</th>';
					str+='<th scope="col">試験</th>';
					str+='<th scope="col">正解確認</th>';
					str+='<th scope="col"></th>';
					str+='</tr>';
					str+='</thead>';
					str+='<tbody>';
			
					for(var i = 0; count > i; i++){
						str+='<tr>';
						str+='<th scope="row">'+(i+1)+'</th>';
						str+='<td>'+result[i].word+'</td>';
						str+='<td><input type="text" placeholder="答入力" id="userAnswer'+i+'"></td>';
						str+='<td class="openColor'+i+'" id="check'+i+'"></td>';
						str+='<td><input type="hidden" id="Meaning'+i+'" value="'+result[i].meaning+'"></td>';
						str+='</tr>';
						str+='</tbody>';

						}
					str+='</table>';
				str += '<button type="button" class="btn btn-outline-primary" style="width: 50%; float:right;" onclick="openAnswer()">提出</button>';
		
				$('#StartTest').append(str);
				}
			});
	}
	function openAnswer(){
		var UserAnswer = '';
		var Meaning = '';
		
		for(var i = 0; count > i; i++){
			if($('#userAnswer'+i).val() == $('#Meaning'+i).val()){
				$('.openColor'+i).css('background', 'lightblue');
				$('#check'+i).html('O');
				}
			else{
				$('.openColor'+i).css('color', 'red');
				$('#check'+i).html('X (正解 : '+$('#Meaning'+i).val()+')');
				}
			}
		
	}
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
          <a href="goMypage" class="nav-link"><i data-feather="user" style="width: 2em;height:2em;"></i></a>
        </nav>
      </div>
      <!-- content-header -->
      <div class="content-body" id="contents-body">
    <div >
		<h1>@単語帳の名前 : ${result.title}</h1>
	</div>
	<div id="exam">
		<p>試験の例示及び方法の選択!</p>
		<div id="selectTest" class="d-flex">
			<div>
				<div class="custom-control custom-switch">
					<input type="checkbox" class="custom-control-input" id="customSwitch1" onclick="changeOrder()">
				 	 <label class="custom-control-label" for="customSwitch1">ランダム発売 </label>
				 </div>
			</div>
			<div class="mg-sm-l-50">		 
				 <div class="custom-control custom-switch">
					 <input type="checkbox" class="custom-control-input" id="customSwitch2" onclick="changeWord()">
					 <label class="custom-control-label" for="customSwitch2">問題と答転換</label>
				 </div>
			</div>
		</div>
		
			<div id="example" style="width: 50%; ">
				<table class="table table-primary"	>
				  <tbody>
				   <thead>
					    <tr>
					      <th scope="col">문제</th>
					      <th scope="col">답</th>
					    </tr>
					  </thead>
				  	<tr>
				  		<td>
				  			${result.word }
				  		</td>
				  		<td>
				  			${result.meaning }
				  		</td>
				  	</tr>
				  </tbody>
				</table>
			</div>
	</div>
	<a class="btn btn-outline-primary" data-toggle="collapse" href="#test" role="button" aria-expanded="false" aria-controls="collapseExample" onclick="TestStart()">試験開始</a>
	
	<div class="collapse mg-t-5" id="test">
		<div id="StartTest" style="width:50%; float:left; margin:5px; ">
	  		
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