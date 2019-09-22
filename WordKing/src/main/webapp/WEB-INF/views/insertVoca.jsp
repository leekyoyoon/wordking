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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/js/connect.js"></script>
<script>

	$(function(){
		$("#sidebarrr").load("resources/part/sidebar.jsp");
		$('.select2').select2();
		$("#registerBtn").click(function(){
			var Title = $("#title").val();
			var Contents = $("#contents").val();
			var Category_seq = $("#category_seq").val();
			var Visible = $("#visible").val();
			alert(Title+", "+Contents+", "+Category_seq+", "+Visible);
			$.ajax({
				url:'createVoca',
				data:{
					title : Title,
					contents : Contents,
					category_seq : Category_seq,
					visible : Visible
				},
				type:'POST',
				success:function(Data){
					if (Data=='false') {
						alert("단어장 등록에 오류가 생겼습니다..");
					} else if (Data=='true') {
						$.ajaxSettings.traditional = true;
						$.ajax({
							url:'insertWord',
							data:$("#inputDDiv").serialize(),	
							type:'POST',
							success:function(Data){
								if (Data == 'false') {
									alert("단어등록에 오류가 생겼습니다..");
								} else if (Data=='true') {
									$("#createVoca").submit();
									
								}
								
							}
						})
						
					}
				}
			});
			
		});
		$('#plusinput').click(function(){
			var contents ='<hr style="width:100%;">';
			contents+='<div class="TermContent-inner-padding">';
			contents+='<label class="" style="width: 40%;margin-right:10%;">';
	    	contents+='<span><input type="text"  class="textbox" name="WordName"></span>';
	    	contents+='<span class="UITextarea-border" style="width: 100%;margin-right:0px;"></span> ';		
			contents+='<span class="UITextarea-label" style="width: 100%;margin-right:0px;">単語</span></label>';			
			contents+='<label class="" style="width: 40%;margin-right: 0px;float: right;">';
	    	contents+='<span><input type="text"  class="textbox" name="Meaning"></span>';
	    	contents+='<span class="UITextarea-border" style="width: 100%;margin-right:0px;"></span>';		
			contents+='<span class="UITextarea-label" style="width: 100%;margin-right:0px;">意味</span></label></div>';			
			
			$("#plusss").append(contents);
		})
	});
	function insertImage(){
		$("#createVoca").submit();
	}

	
	function readURL(input) {
		  if (input.files && input.files[0]) {

		    var reader = new FileReader();

		    reader.onload = function(e) {
		      $('.image-upload-wrap').hide();

		      $('.file-upload-image').attr('src', e.target.result);
		      $('.file-upload-content').show();

		      $('.image-title').html(input.files[0].name);
		    };

		    reader.readAsDataURL(input.files[0]);

		  } else {
		    removeUpload();
		  }
		}

		function removeUpload() {
		  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
		  $('.file-upload-content').hide();
		  $('.image-upload-wrap').show();
		}
		$('.image-upload-wrap').bind('dragover', function () {
		        $('.image-upload-wrap').addClass('image-dropping');
		    });
		    $('.image-upload-wrap').bind('dragleave', function () {
		        $('.image-upload-wrap').removeClass('image-dropping');
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
          <a href="goMypage" class="nav-link"><i data-feather="user" style="width: 2em;height:2em;"></i></a>
        </nav>
      </div>
      <!-- content-header -->
      <div class="content-body" id="contents-body">
	
		<h1>単語帳 作成</h1>
		<form id="createVoca" action="insertImage" class="needs-validation was-validated" novalidate method="POST" enctype="multipart/form-data">
		<div class="row">
	<div class="col-sm-4" style="margin-bottom: 1%;">
	<label for="formGroupExampleInput" class="d-block">タイトル</label>
      <input type="text" class="form-control" id="title" placeholder="Invalid state" required >
      <div class="invalid-feedback">This is required</div>
    </div>
    <div class="col-sm-2" style="margin-bottom: 1%;">
    <label for="formGroupExampleInput" class="d-block">カテゴリー</label>
    <select class="select2" style="width: 100%;" size="4" id="category_seq">
    	<option value="5" selected="selected">韓国語</option>
    	<option value="1">日本語</option>	
    	<option value="3">フランス語</option>
    	<option value="2">英語</option>
    	<option value="4">中国語</option>    	
    </select>
   		
    </div>
    <div class="col-sm-2" style="margin-bottom: 1%;">
    <label for="formGroupExampleInput" class="d-block">visible</label>
    <select class="select2" style="width: 100%;" id="visible">
    	<option value="1" selected="selected">全部公開</option>
    	<option value="2">フレンドだけ公開</option>	
    	<option value="3">非公開</option>
   </select>
    </div>
    
    
    </div>
    <div class="row">
     <div class="col-sm-4">
     <label for="formGroupExampleInput" class="d-block">内容</label>
      <textarea class="form-control" rows="10" id="contents" style="resize: none;overflow: auto;" placeholder="Invalid state" required></textarea>
      <div class="invalid-feedback">This is required</div>
    </div>
     <div class="col-sm-4">
      
      <label for="formGroupExampleInput" class="d-block">イメージ</label>
     
     <div class="file-upload">
     
  <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>

  <div class="image-upload-wrap">
    <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" name="uploadFile"/>
    <div class="drag-text">
      <h3 style="margin-bottom: 4px;">Drag And select add Image</h3>
    </div>
  </div>
  <div class="file-upload-content">
    <img class="file-upload-image" src="#" alt="your image" />
    <div class="image-title-wrap">
      <button type="button" onclick="removeUpload()" class="remove-image">Remove <span class="image-title">Uploaded Image</span></button>
    </div>
  </div>
</div>
     </div>
     <div class="col-sm-4" style="padding-top: 85px;">
     <label for="formGroupExampleInput" class="d-block">  </label>
     
     <button type="button" class="btn btn-primary" id="registerBtn" style="width: 100%;height:85%;font-size: 3em;">登録</button>
     </div>
    </div>
    </form>
    <!-- </form> -->
    <hr>
    <h1>単語追加</h1>
    
    <form action="" id="inputDDiv">
    <div id="inputDiv">
    <div class="TermContent-inner" id="plusss"> 
    	<div class="TermContent-inner-padding">
    			<label class="" style="width: 40%;margin-right:10%;">
				<span><input type="text" class="textbox" name="WordName"></span>
				<span class="UITextarea-border" style="width: 100%;margin-right:0px;"></span>   		
				<span class="UITextarea-label" style="width: 100%;margin-right:0px;">単語</span>
				</label>
				<label class="" style="width: 40%;margin-right: 0px;float: right;">
				<span><input type="text" class="textbox" name="Meaning"></span>
				<span class="UITextarea-border" style="width: 100%;margin-right:0px;"></span>   		
				<span class="UITextarea-label" style="width: 100%;margin-right:0px;">意味</span>
				</label>
    	</div>
    </div>
    <div  class="TermContent-inner" style="text-align: center;">
    	<div style="padding-bottom: 5%;width: 80%;height:10%;">
    	<a class="TermContent-addRow" id="plusinput">
    		<span class="TermContent-addRowButton">
    			<button class="btn btn-primary" type="button" style="width: 80%;">
    				<span >+ カード追加</span>
    			</button>
    		</span>
    		</a>
    	</div>
    </div>
    
    </div>
    </form>
	</div>
	
    <!-- <button id="plusinput">追加</button>
    <input type="text" placeholder="1번째"> -->
</div>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="resources/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="resources/lib/jquery/jquery.min.js"></script>
    <script src="resources/lib/select2/js/select2.full.min.js"></script>
    
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
.mg-t-10::-webkit-scrollbar {
width: 8px; 
height: 8px; 
border: 3px solid #fff; 
}

.file-upload {
  background-color: #parent;
  margin: 0 auto;
  padding: 0px;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #0168fa;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #0047e8;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #238aff;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 50%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #0168fa;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #1E90FF;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #000000;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #b02818;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}

.TermContent-side{
	cursor: text;
    display: table-cell;
    padding-top: .75rem;
    position: relative;
    vertical-align: top;
    word-break: break-word;
    z-index: 1;
}

.TermContent-inner{
	background-color: #parent;
    position: relative;
}
.TermContent-side--word{
	padding-left: .75rem;
    padding-right: 1.25rem;
    width: 50%;
}
.UITextarea-border {
    -webkit-align-self: flex-end;
    align-self: flex-end;
    -ms-flex-item-align: end;
    display: block;
    height: .25rem;
    box-shadow: 0 0.125rem 0 0 #455358;
    transition: all .12s cubic-bezier(.47,0,.745,.715);
    width: 100%;
}
.UITextarea-label {
    color: #97a5aa;
    display: -webkit-flex;
    display: flex;
    -ms-flex-pack: justify;
    -webkit-justify-content: space-between;
    justify-content: space-between;
    margin-top: .625rem;
    text-align: inherit;
    font-weight: 600;
    text-transform: uppercase;
    font-size: .75rem;
    letter-spacing: .0625rem;
    line-height: 1.333333333333333;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.UITextarea {
    cursor: pointer;
    display: block;
    font-weight: 400;
    font-size: 1.125rem;
    line-height: 1.444444444444444;
}
.TermContent-inner-padding {
	padding: 2% 10% 2% 10%;
    background-color: #parent;
}
.TermContent-addRowButton {
    white-space: nowrap;
}
.UILinkButton {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: none;
    border: none;
    border-bottom: .3125rem solid #3ccfcf;
    color: #455358;
    cursor: pointer;
    display: inline-block;
    font: inherit;
    max-width: 100%;
    padding: 0 0 .75rem;
    text-align: center;
    font-weight: 700;
    text-transform: uppercase;
    font-size: .9375rem;
    letter-spacing: .075rem;
    line-height: 1.2;
    transition: all .12s cubic-bezier(.47,0,.745,.715);
    vertical-align: middle;
    width: auto;
}
.TermContent-addRow {
    position: relative;
    height: 100%;
    width: 100%;
    bottom: 0;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    z-index: 100;
}

.textbox{
width:100%;
border:none;
border-right:0px; 
border-top:0px; 
boder-left:0px; 
boder-bottom:0px;
background: transparent;
}
.textbox:focus{

border:none;
border-right:0px; 
border-top:0px; 
boder-left:0px; 
boder-bottom:0px;
}
.TermContent-side--word{
width: 100%;
}

</style>
</html>
