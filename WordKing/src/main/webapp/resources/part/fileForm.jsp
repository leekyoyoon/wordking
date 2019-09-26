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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/connect.js"></script>
<script type="text/javascript">
$(function(){
	$("#sidebarrr").load("resources/part/sidebar.jsp");

	$.ajax({
		url:"searchVoca",
		type:"post",
		data:{},
		success:function(result){
			var str = '';

			for(var i = 0; i < result.length; i++){
				if(i%4==0){
					str += '<div id="test" class="card-deck" style="padding-bottom: 20px;">';
					}
				str += '<div class="card col-4">';
				str += '<img src="resources/img/1.png" width="100px" height="200px"  class="card-img-top" alt="...">';
				str += '<div class="card-body">';
				str += '<h6 class="card-title">単語帳の名前 :'+ result[i].title +'</h6>';
				str += '<p class="card-text">作成者 : '+ result[i].userid +'</p>';

				str += '<p><a href="#" class="badge badge-danger"> '+ result[i].category_seq +'</a></p>';

				str += '<button class="btn btn-primary" onclick="downDetail('+ result[i].seq +')">詳しく</button>';
				str += '</div>';
				str += '</div>';
				if(i%4==3 || i==result.length-1){
				str += '</div>';
					}
				}

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

var Seq = 0;

function downDetail(seq){
	$.ajax({
		url:'downDetail',
		type:"get",
		data:{seq : seq},
		success:function(result){
			Seq = seq;
			
			$('#test').html('');

			var str = '';
			str += '<div id="example" style="width: 50%; ">';
			str += '<input type="hidden" id="title" name="title" value="'+result[0].title+'">단어장 제목 : ' + result[0].title + '</span>';;
			str += '<table class="table">';
			str += '<thead class="thead-primary">';
			str += '<tr>';
			str += '<th>番号</th>';
			str += '<th>単語</th>';
			str += '<th>意味</th>';
			str += '</tr>';
			str += '</thead>';
			str += '<tbody>';
			for(var i = 0; i < result.length; i++){
				str += '<tr>';
				str += '<th><span id="num" name="num" value="'+(i+1)+'">'+(i+1)+'</span></th>';
				str += '<td><input type="hidden" id="fileWord" name="Word" value="'+result[i].word+'">'+result[i].word+'</td>';
				str += '<td><input type="hidden" id="fileMeaning" name="Meaning" value="'+result[i].meaning+'">'+result[i].meaning+'</td>';
				str += '</tr>';
				}
			str += '</tbody>';
			str += '</div>';
			$('#inputFile').append(str);
			}
		});

}
function doExcelDownloadProcess(){
	var title = $('#title').val();
	$.ajax({
		url:'downloadExcelFile',
		type:"post",
		data:$("#inputFile").serialize(),
		xhrFields: {
            responseType: 'blob'
        },
        success: function (data) {
            var a = document.createElement('a');
            var url = window.URL.createObjectURL(data);
            a.href = url;
            a.download = title+'.xlsx';
            document.body.append(a);
            a.click();
            a.remove();
            window.URL.revokeObjectURL(url);
        }
	});
}
    function doExcelUploadProcess(){
        var f = new FormData(document.getElementById('form1'));
        $.ajax({
            url: "uploadExcelFile",
            data: f,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(result){
            	var str = "";
				
            	str+='<tr>';
				str+='<td>단어</td>';
				str+='<td>의미</td>';
				str+='</tr>';
				
				if(result.length > 0){
					for (var i = 0; i < result.length; i++) {
						str+='<tr>';
						str+='<td>'+result[i].Word+'</td>';
						str+='<td>'+result[i].Meaning+'</td>';
						str+='</tr>';
					}
				}
				$("#result").append(str);
            }
        })
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
      
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
			<input type="file" class="btn btn-outline-primary">
		    <button type="button" class="btn btn-primary" onclick="doExcelUploadProcess()">엑셀업로드 작업</button>
		    <button type="button" class="btn btn-primary" onclick="doExcelDownloadProcess()">엑셀다운로드 작업</button>
		</form>
		<div id="result">
		
		</div>
		<div id="test" style="padding-bottom: 20px;">
	
		</div>
		<form action="" id="inputFile" method="post">
			
		</form>
		
		</div>
	</div>
      

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="resources/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="resources/lib/jquery/jquery.min.js"></script>
    <script src="resources/lib/select2/js/select2.full.min.js"></script>
    
  	<!-- append theme customizer -->
    <script src="resources/lib/js-cookie/js.cookie.js"></script>
    
    <script type="text/javascript" src="resources/js/jquery.cslider.js"></script>
	<script type="text/javascript" src="resources/js/modernizr.custom.28468.js"></script></body>
<style>

</style>
</html>
