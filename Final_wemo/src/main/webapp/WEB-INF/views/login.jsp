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
    
    <!-- Material Icons (for simple icons) -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- jquery-ui (util for drag/snap) -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- Google Font (Noto Sans KR) -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <script>
       $(function(){

       		var date = new Date();
            if (date.getMonth() + 1 < 10)
                var month = "0" + (date.getMonth() + 1);
            else
                var month = data.getMonth() + 1;
            if (date.getDate()<10)
                var day = "0"+date.getDate();
            else
                var day = date.getDate();

            var today = date.getFullYear() + "." + month + "." + day;

            $('.date').text(today)
                      .css({"font-size" : "16pt",
                            "font-weight" : 700});
            $(window).resize(viewSetup)
            viewSetup();

            function viewSetup(){
          	  var loginTopWidth = $('.loginViewTop').css('width');
          	  $('.loginViewMain').css('width', loginTopWidth);

          	  var viewWidth = $(window).width();

        	    if(viewWidth >= 450) { 
                 $('.loginViewMain').css({"padding": "60px"})
                 $('.loginInput').css({"width" : "200px"})
                 // 기본값
       	     } else if (viewWidth >360 && viewWidth < 450){
                $('.loginViewMain').css({
                 "padding-top" : "40px",
                 "padding-left": "40px", 
                 "padding-right": "40px",
                 "padding-bottom": "40px"})
                $('.loginInput').css({"width" : "120px"})
       	     } else if (viewWidth <= 360){
                $('.loginViewMain').css({
                 "padding-top" : "60px",
                 "padding-left": "20px", 
                 "padding-right": "20px",
                 "padding-bottom": "60px"})
                $('.loginInput').css({"width" : "120px"})
           		 }
            }
            
		
		Kakao.init('2bcb51574442c731afcc82184218f4a8');

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
				
				//data : {"user_name" : $('user_name')};
						

			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
				});
		
			}
		});
       });
		
	</script>
    <style>

        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
      
        .loginViewTop{
            border : 5px solid black;
            border-radius : 20px 20px 0px 0px;
            padding : 10px;
            margin:0px auto;
            box-sizing:border-box;
            background-color : pink;
            box-shadow:12px 12px 2px 1px hotpink;
        }
        .loginViewMain{
            width : 80%;
            box-sizing:border-box;
            border-top : 0px solid black;
            border-left : 5px solid black;
            border-right : 5px solid black;
            border-bottom : 5px solid black;
            border-radius : 0px 0px 20px 20px;
            background-color: white;
            
            height : 480px;
            box-shadow:12px 12px 2px 1px hotpink;
        }
        .title {
            text-align: center;
            font-size : 54pt;
        }
        h3 {
            text-align: center;
            font-weight: 700;
        }
        .loginInput{
            border-top : none;
            border-left : none;
            border-right : none;
            border-bottom : 1px solid black;
            color : darkslategray
        }
        .loginInput:focus{
            outline :none;
        }
        .loginViewInput{
            margin : 0px auto;
            box-sizing:border-box;
            width : 350px;
        }
        .kakao{
        	margin-top:10px;
        	padding-left : 64px;
        }
    </style>
</head>
<body>
    <br><br>
        <div class = "container loginViewTop">
            <span class = "date"></span>
            <span class ="material-icons float-right">close</span>
            <span class ="material-icons float-right">crop_square</span>
            <span class ="material-icons float-right">minimize</span>
        </div>
        <div class = "container loginViewMain">
            <h1 class = "title">WeMo</h1>
            <h3>우리의 메모</h3><br><br>
            
            <div class = "loginViewInput">
            <form action="loginProcess" method="post">
           			<label for ="USER_EMAIL">이메일주소</label>&nbsp; 
           			<input type = "text" id = "USER_EMAIL" name = "USER_EMAIL" class = "loginInput" required><br><br>
                
          			<label for ="USER_PASS">&nbsp;&nbsp;비밀번호&nbsp;&nbsp;&nbsp;</label> 
           			<input type = "password" id ="USER_PASS" name = "USER_PASS" class ="loginInput"><br><br>
          		  <span><input type = "checkbox" id = "autoLogin" name ="autoLogin"><label for = "autoLogin">&nbsp;자동 로그인</label></span>
            <br>      
         		
                <button type ="submit" class = "btn"  >메모장 열기</button>
                <button type ="button" class = "btn" onClick="location.href='join'">회원가입</button>
                <button type ="button" class = "btn">비밀번호 찾기</button><br>
                <div class="kakao"><a id="kakao-login-btn" ></a> 
				<a href="http://developers.kakao.com/logout"></a></div>
				 </form>
            </div>
         
        </div>
</body>
</html>