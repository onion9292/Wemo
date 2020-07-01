<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<html>
<head>
<title>Wemo_Login</title>
<style>
/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	display: inline-block;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 48%;
}

button.join {
	display: inline-block;
	background-color: #1E90FF;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 48%;
	float: right;
}

button:hover {
	opacity: 0.8;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
}

.container {
	padding: 16px;
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 60%; /* Could be more or less, depending on screen size */
}
</style>
</head>
<body>
	<div class="modal-content">

		<form action="loginProcess" method="post">
			<div class="imgcontainer">
				<img src="resources/image/wemo.jpg" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label for="uname">
				<b>Username</b>
				</label> <input type="text" placeholder="Enter Username" name="USER_EMAIL" required> 
				<label for="psw">
				<b>Password</b> </label> 
				<input type="password" placeholder="Enter Password" name="USER_PASS" required> 
				<a id="kakao-login-btn"></a> 
				<a href="http://developers.kakao.com/logout"></a><br>
				<button type="submit">Login</button>
				<button type="button" class="join" onClick="location.href='join'">
				Join Us</button>

			</div>
		</form>
	</div>
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('2bcb51574442c731afcc82184218f4a8');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {

					Kakao.API.request({
            		
            		url : '/v2/user/me',
            		
            		success : function(res){
            			
            			alert(JSON.stringify(res));
            			
            			document.body.innerHTML+=JSON.stringify(res);
            			
            			alert(JSON.stringify(authObj));
            			
            			var id = res.id;
            			var email = res.kakao_account['email'];
				location.href = "memo?USER_EMAIL="+email+"'";
				
				data : {"user_name" : $('user_name')};
						

			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		//]]>
	</script>
</body>
</html>