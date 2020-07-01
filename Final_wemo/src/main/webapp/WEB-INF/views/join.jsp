<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>Wemo_Join</title>
<script src="resources/js/jquery-3.5.0.min.js"></script>
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
	width: 100%;
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
	width: 216px;
	height: 216px;
	border-radius: 50%;
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



		<form action="joinProcess" method="post">

			<div class="imgcontainer">
				<img src="resources/image/img_avatar2.png" alt="Avatar"
					class="avatar" id="image" >

			</div>
			<div class="container">
				<label for="uname"><b>Username</b>&nbsp;&nbsp;<span
					id="message"></span></label> <input type="text"
					placeholder="Enter Username" name="USER_EMAIL" required> <label
					for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="USER_PASS" required>

				<button type="submit">Join</button>


			</div>
		</form>
	</div>
	<script>
		$("input[name=USER_EMAIL]").on(
				'keyup',
				function() {
					$("#message").empty();

					var id = $(this).val();
					$.ajax({
						url : "idcheck.net",
						data : {
							"USER_EMAIL" : id
						},
						success : function(resp) {
							if (resp == -1) {
								$('#message').css('color', 'green').html(
										"사용 가능한 아이디 입니다.");
								checkid = true;
							} else {
								$('#message').css('color', 'blue').html(
										"이미 사용중인 아이디 입니다.");
								checkid = false;
							}
						}

					});//ajax 끝

				});//id keyup 이벤트 끝

	</script>
</body>
</html>