<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- import CSS -->
	<link rel="stylesheet" href="resources/css/dashforge.css" type="text/css">
	<link href="resources/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="resources/lib/jqvmap/jqvmap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/dashforge.dashboard.css">
  	<link rel="shortcut icon" type="image/x-icon" href="resources/img/favicon.png">
  	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1��1 �����ϱ�</title>
</head>
<body>
<h3>1:1 �����ϱ�</h3>
<hr>

<div class="cutomerInfo">
	<div class="title">ȸ�� ����</div>
	<br>
	<div class="info" id="loginId"><span>���̵�</span>${sessionScope.loginId}</div>
	<div class="info" id="email"><span>�̸���</span>${sessionScope.email}
	<input type="checkbox" name="replyMail" value="replyMail" id="replyMailChkBox"> �亯���� ���Ϸ� ����</div>
</div>
<br>
<hr>	
	<form id="" method="post">
		<div class="qnaInfo">
			<div class="title"> ���� ����</div>
			<br>
			<div class="qnaInput" id="qnaOption"><span>�з�</span>
				<input type="radio" name="qnaChoice" value="cutomer">ȸ��
				<input type="radio" name="qnaChoice" value="note">�ܾ���
				<input type="radio" name="qnaChoice" value="test">����
			</div>
			<div class="qnaInput" id="qnaTitleDiv"><span>����</span>
			<input type="text" name="qnaTitle" value="������ �Է����ּ���." id="qnaTitle"></div>
			<div class="qnaInput" id="qnaContentDiv"><span>����</span>
			<input type="text" name="qnaContent" value="������ �Է����ּ���." id="qnaContent"></div>
			<input type="submit" name="qnaSubmit" id="qnaSubmit" value="����ϱ�">
			<input type="button" name="qnaCancel" id="qnaCancel" value="����ϱ�">
		</div>
	</form>

</body>
</html>