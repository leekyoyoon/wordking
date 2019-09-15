$("#goInsertVoca").click(function(){
	$("#contents-body").load("resources/voca/insertVoca.jsp");
});

/*$("#vocaButton").click(function(){
	var Word = $("#word").val();
	var Meaning = $("#meaning").val();
	var Image = $("#image").val();
	
	if (Image.length == 0) {
		Image = '';
	}
	   
	var Category = $('input[name="category"]:checked').val();
	if(Category == null){
		alert("言語 種類をチェックしてください。");
		return false;
	}
	
	if(Word.length == 0){
		alert("単語を入力してください。");
		return false;
	}
	
	if(Meaning.length == 0){
		alert("意味を入力してください。");
		return false;
	}
	
	
	$.ajax({
		url:"insertUsers",
		data:{
			Word : Word,
			Meaning : Meaning,
			Image : Image,
			Category : Category,
		},
		type: "post",
		success:function(Data){
			location.reload();
		}
	})
	
});*/