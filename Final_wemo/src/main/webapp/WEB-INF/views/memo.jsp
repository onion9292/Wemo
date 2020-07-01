<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Material Icons (for simple icons) -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- jquery-ui (util for drag/snap) -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- Google Font (Noto Sans KR) -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Memo-Main</title>
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .memobox {
            margin-top: 20px;
            height: 200px;
            width: 350px;
            box-sizing: border-box;
            border: 1px solid #CCC;
            border-radius: 5px;
            box-shadow: 5px gray;
            background: khaki;
        }

        .recommend {
            margin-top: 10px;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid orange;
            border-radius: 5px;
            width: 80%;
        }

        .btn {
            font-weight: 700;
        }

        .close {
            cursor: pointer;
        }

        .memoContent {
            margin: 10px;
        }

        .recomList {
            margin-top: 10px;
        }

        .newMemo {
            cursor: pointer;
        }

        .onFavo {
            color: salmon;
        }

        .memo-top {
            margin: 5px;
        }
    </style>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">My SubBrain</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div style="display:none" id="user">${USER_EMAIL }</div>
        <div  style="display:none" id="subject">${USER_SUB }</div>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" id="study">공부</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="health">운동</a>
              
            </li>
            <li class="nav-item">
              <a class="nav-link" id="money">가계부</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"  id="week">주간 메모</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="keep">보관한 메모</a>
              </li>
              <li class="nav-item">
                <a class="nav-link " id="statistics">통계</a>
              </li>
              <li>
              &nbsp;&nbsp;
              </li>
              
        </ul>
        	<button type="button" class="newMemo" >메모추가</button>
          	<input class="navbar-right" type="text" name="search-word" style="float:right" placeholder="Search Memo">
          	<span class="material-icons navbar-right">search</span>
        </div>
      </nav>
      
      
<div class="memoContainer">     
<c:forEach var ="memo" items="${memolist }"> 
   <div class = 'section section-${memo.MEMO_SUB }' >
        <form>
        	<div class = 'container memobox shadow-sm' style=" position : ${memo.MEMO_POSITION} ; top:${memo.MEMO_TOP}; left:${memo.MEMO_LEFT}; z-index:${memo.MEMO_ZIN}">
            <div class = 'container memo-top'>
                <span class = "date"></span>
                <span class = "section-name" style="display:none">${memo.MEMO_SUB }</span>
                <span class = "material-icons delete float-right">delete</span>
                <span class = 'material-icons float-right favorites'>stars</span>
                <span class = "material-icons float-right lock">lock_open</span>                
            </div>
            <div class="container memoSubject">${memo.MEMO_SUB }</div>                       
            <div class = 'container memoContent'>${memo.MEMO_TEX }</div>
            </div>
            </form>
        </div>
        </c:forEach>
        </div>
    
    
	<script>
	 $(function(){
		
			
         $(window).resize(function () {
             var maxSectionWidth = window.innerWidth;
             $('.memobox').resizable({
                 maxWidth: maxSectionWidth
             })
         })
         
         var sectionName = $('.section-name').val();

         var date = new Date();
         if (date.getMonth() + 1 < 10)
             var month = "0" + (date.getMonth() + 1);
         else
             var month = data.getMonth() + 1;
         var today = date.getFullYear() + "-" + month + "-" + date.getDate();
		
         $('.date').text(today);         

         $('.close').on('click', recomCloseEventAdd);

         $('.lock').on('click', lockEventAdd)
             .css('cursor', 'pointer');

         $('.newMemo').on('click', newMemoAppend)
                      .css('cursor', 'pointer');       

         $('.favorites').on('click', favoEventAdd)
             .css('cursor', 'pointer');
         
         $('.delete').on('click', deleteEventAdd)
             .css('cursor', 'pointer');

         $('.memobox').draggable()
             .resizable({
                 minWidth: 200,
                 maxWidth: 500,
                 minHeight: 200
             })
             .resize(function (e) {
                 var memoWidth = $(this).width();
                 var memoHeight = $(this).height();
                 if ( memoWidth < 270) {
                     $(this).children().children().next().css("display", "none");
                 }else{
                	 $(this).children().children().next().css("display", "inline-block");
                 }
             })
             .one('click', addTextArea);

         $('textarea.memotext').keydown(autoResizeTextArea);

         $('.tel').on('click', telFormAdd)
         $('.todo').on('click', todoFormAdd)
         $('.homework').on('click', homeworkFormAdd)
         $('.meeting').on('click', meetingFormAdd)
         
         function newMemoAppend() {
       		 var user = $('#user').text();
       		 
        	 var sub = $('#subject').text();
        	 var random = Math.random()*10;
        	 var top = random*40;
        	 var left = random*60;
        	 var zind = 1000;
        	 
             var recommendContainer = "<div class = 'container recommend draggable' >"
                 + "<span>혹시 메모의 내용이 이것인가요?</span>"
                 + "<span class='material-icons close'> close </span><br>"
                 + "<button type = button class = 'btn btn-outline-warning tel'>전화번호</button>&nbsp;"
                 + "<button type = button class = 'btn btn-outline-warning todo'>할 일</button>"
                 + "<button type = button class = 'btn btn-outline-warning homework'>숙제</button>"
                 + "<button type = button class = 'btn btn-outline-warning meeting'>회의 일정</button></div>";

             var newMemobox = "<div class = 'container memobox shadow-sm' style='position:absolute;top:"+top+"px;left:"+left+"px;z-index:1"+zind+"'><form>"
                 + "<div class = 'container memo-top'><span class = 'date'>" + today
                 + "</span><span class = 'section-name'>"+ sub +"</span>"
                 + "<span class = 'material-icons delete float-right'>delete</span>"
                 + "<span class = 'material-icons favorites float-right'>stars</span>"
                 + "<span class = 'material-icons float-right lock'>lock_open</span></div>"
                 + recommendContainer
                 + "<div class = 'container memoContent'></div></form></div>";

             $('.memoContainer').append(newMemobox);
             $('.favorites').on('click', favoEventAdd).css('cursor', 'pointer');
             
             $('.memobox').draggable()
                 .resizable({
                     minWidth: 200,
                     maxWidth: 500,
                     minHeight: 200
                 })
                 .resize(function (e) {
                     var memoWidth = $(this).width();
                     var memoHeight = $(this).height();
                     if ( memoWidth < 270) {
                         $(this).children().children().next().css('display','none');
                     }else{
                    	 $(this).children().children().next().css("display", "inline-block");
                     }
                 })
                 .one('click', addTextArea);
             
             $('.lock').on('click', lockEventAdd)
                 .css('cursor', 'pointer');
             $('.delete').on('click', deleteEventAdd)
                 .css('cursor', 'pointer');
             $('.close').on('click', recomCloseEventAdd);
             $('.tel').on('click', telFormAdd);
             $('.todo').on('click', todoFormAdd);
             $('.homework').on('click', homeworkFormAdd);
             $('.meeting').on('click', meetingFormAdd);
					             
      		
             	$.ajax({
					url:"newMemo",
					data :{
						"USER_EMAIL" : user,
						"MEMO_SUB" : sub,
						"MEMO_TOP" : top+"px",
						"MEMO_LEFT" : left+"px",
						"MEMO_ZIN" : zind
					},
					success : function(){
						
					}
             		
             		
             	})//새로운 메모 만들시 DB에 메모 insert
             };

     function telFormAdd() {
             var memoContent = $(this).parent().next();
             memoContent.html(
                 "<div class = 'input-group recomList'>"
                 + "<div class = 'input-group-prepend'>"
                 + "<span class = 'input-group-text'>이름</span></div>"
                 + "<input type ='text' name = 'name' class = 'form-control'/></div>"
                 + "<div class = 'input-group'>"
                 + "<div class ='input-group-prepend'>"
                 + "<span class = 'input-group-text'>전화번호</span></div>"
                 + "<input type ='text' name = 'tel' class = 'form-control'/></div>"
                 + "<div class = 'input-group'>"
                 + "<div class = 'input-group-prepend'>"
                 + "<span class = 'input-group-text'>메모</span></div>"
                 + "<textarea class = 'form-control' name = 'memo'/></textarea>"
                 + "<button class = 'btn btn-outline-success'>입력</button></div>"
             )
         };

     function homeworkFormAdd() {
             var memoContent = $(this).parent().next();
             memoContent.html(
                 "<div class = 'input-group recomList'>"
                 + "<div class = 'input-group-prepend'>"
                 + "<span class = 'input-group-text'>과목명</span></div>"
                 + "<input type ='text' class = 'form-control'/></div>"
                 + "<div class = 'input-group'>"
                 + "<div class ='input-group-prepend'>"
                 + "<span class = 'input-group-text'>언제까지?</span></div>"
                 + "<input type ='text' class = 'form-control'/></div>"
                 + "<div class = 'input-group'>"
                 + "<div class = 'input-group-prepend'>"
                 + "<span class = 'input-group-text'>메모</span></div>"
                 + "<textarea class = 'form-control'/></textarea>"
                 + "<button class = 'btn btn-outline-success'>입력</button></div>"
             )
         }

     function meetingFormAdd() {
             var memoContent = $(this).parent().next();
             memoContent.html(
                 "<div class = 'input-group recomList'>"
                 + "<div class = 'input-group-prepend'>"
                 + "<span class = 'input-group-text'>언제?</span></div>"
                 + "<input type ='text' class = 'form-control'/></div>"
                 + "<div class = 'input-group'>"
                 + "<div class ='input-group-prepend'>"
                 + "<span class = 'input-group-text'>어디서?</span></div>"
                 + "<input type ='text' class = 'form-control'/></div>"
                 + "<div class = 'input-group'>"
                 + "<div class = 'input-group-prepend'>"
                 + "<span class = 'input-group-text'>어떤 회의?</span></div>"
                 + "<textarea class = 'form-control'/></textarea>"
                 + "<button class = 'btn btn-outline-success'>입력</button></div>"
             )
         }

     function todoFormAdd() {
             var memoContent = $(this).parent().next();
             memoContent.html(
                 "<div class = 'input-group recomList'>"
                 + "<div class = 'input-group-prepend'>"
                 + "<span class = 'input-group-text'>할 일</span></div>"
                 + "<textarea class = 'form-control' rows = '5'></textarea>"
                 + "<button class = 'btn btn-outline-success'>입력</button></div>"
             )
         }

     function addTextArea(e) {
             $(this).append("<textarea class = 'memotext form-control' style='overflow-y:hidden; resize:none'>")
             $('.memotext').css({
                 "background-color": "khaki",
                 "border": "none"
             });
             $('textarea.memotext').keydown(autoResizeTextArea)
                 .focus();
                 $(this).children().children().next().css('display','none');
         }

     function autoResizeTextArea() {
             var NumberOfEnters = $(this).val().split("\n").length + 1;
             if (NumberOfEnters == 1) {
                 $(this).attr('rows', 2)
             } else {
                 $(this).attr('rows', NumberOfEnters)
             }

             var textAreaHeight = $(this).height();
             var memotopHeight = $('.memo-top').height();
             var memoboxHeight = $(this).parent().height();

             if (textAreaHeight + memotopHeight + 40 > memoboxHeight) {
                 $(this).parent().css("height", textAreaHeight + memotopHeight + 40)
             } else if (textAreaHeight < memoboxHeight && memoboxHeight >= 348) {
                 $(this).parent().css("height", textAreaHeight + memotopHeight + 60)
             }
         }

     function lockEventAdd() {
         if ($(this).text().search('open') == 5)
             $(this).text('lock');
         else
             $(this).text('lock_open');
     }

     function favoEventAdd() {
         if ($(this).css('color') == "rgb(33, 37, 41)") {
             $(this).addClass('onFavo');
             //$.ajax 들어가야 함 (favoAdd 같은?)
         } else if ($(this).css('color') == "rgb(250, 128, 114)") {
             $(this).removeClass('onFavo');
             //$.ajax 들어가야 함 (favoDelete 같은)
         }
     }

     function deleteEventAdd() {
             $(this).parent().parent().parent().css('display', 'none');
             /* $.ajax({
                 memoMoveToTrash or memoDelete
             })*/
         }

     function recomCloseEventAdd() {
         var recommend = $(this).parent();
         recommend.css("display", "none");
     }
 })
	
	
	</script>

</body>
</html>