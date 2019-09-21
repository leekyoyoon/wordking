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
	function wmChange(Word, Meaning){

		for(var i = 0; i < Word.length; i++){ 
			console.log(Word[i]); 
		} 
		for(var i = 0; i < Meaning.length; i++){ 
			console.log(Meaning[i]); 
		}

		var word = Word;
		var meaning = Meaning;
		var temp;

		alert(word);
		alert(meaning);
		
		temp = word;
		word = meaning;
		meaning = temp;

		$('#word').val(word);
		$('#meaning').val(meaning);

		alert(word);
		alert(meaning);
	}
</script>

<div >
	<h1>!単語帳の名前 : ${result[0].title}</h1>
	<h6>作成者: ${result[0].userId }</h6>
</div>
<body>
	<div>
		<p>試験方法</p>
		<input type="button" value="ランダム" id="random">
		<input type="button" value="順序どおり" id="inOrder">
		<input type="button" value="単語隠し" id="sercetWord">
		<input type="button" value="意味隠し" id="sercetMean">	
		<input type="button" value="誤答ノート" id="incorrectRate">	
	</div>

	<div >
		<p>登録された単語</p>
		<div id="question">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Name</th>
			      <th scope="col">Job Title</th>
			      <th scope="col">Degree</th>
			      <th scope="col">Salary</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>Adrian Monino</td>
			      <td>Front-End Engineer</td>
			      <td>Computer Science</td>
			      <td>$120,000</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>Socrates Itumay</td>
			      <td>Software Engineer</td>
			      <td>Computer Engineering</td>
			      <td>$150,000</td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>Reynante Labares</td>
			      <td>Product Manager</td>
			      <td>Business Management</td>
			      <td>$250,000</td>
			    </tr>
			  </tbody>
			</table>
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
</style>
</html>