<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
	
	<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- import CSS -->
	<link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
	<link rel="stylesheet" href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="resources/lib/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="resources/lib/jqvmap/jqvmap.min.css">
	<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
  	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">	
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script type="text/javascript">
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
				str+='<td>이름</td>';
				str+='<td>가격</td>';
				str+='<td>수량</td>';
				str+='</tr>';
				
				if(result.length > 0){
					for (var i = 0; i < result.length; i++) {
						str+='<tr>';
						str+='<td>'+result[i].name+'</td>';
						str+='<td>'+result[i].price+'</td>';
						str+='<td>'+result[i].quantity+'</td>';
						str+='</tr>';
					}
				}
				$("#result").append(str);
            }
        })
    }
    
    function doExcelDownloadProcess(){
        var f = document.form1;
        f.action = "downloadExcelFile";
        f.submit();
    }
</script>
<body>

<form id="form1" name="form1" method="post" enctype="multipart/form-data">
    <input type="file" id="fileInput" name="fileInput">
    <button type="button" onclick="doExcelUploadProcess()">엑셀업로드 작업!</button>
    <button type="button" onclick="doExcelDownloadProcess()">엑셀다운로드 작업</button>
</form>
<div id="result">
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
<style>

</style>
</html>
