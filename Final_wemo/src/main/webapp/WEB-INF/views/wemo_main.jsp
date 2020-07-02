<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeMo</title>
    <style>
        .navTable {
            border-collapse: collapse;
        }
        td {
            border-radius : 5% 5% 0% 0%;
            width : 8%;
            line-height: 40px;
            height: 40px;
            font-weight: 700;
            text-align: center;
        }
        td:last-child{
            border-radius : 0% 0%;
            width : 600px;
        }

        .trash {
            color: white;
            
        }
        .bg-search{
            background-color : #CCC;
        }
        .search_input{
            font-size : 20pt;
            line-height: 20px;
            width : 200px;
            border : 1px solid gray;
            box-shadow: 1px 1px gray;
            border-radius : 5px;
        }
        .mobile-row td {
            width : 33%;
            height: 20px;
            font-weight: 700;
            text-align: center;
        }

        #mobile-tbody{
            display : none;
        }
       
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
    <script>
    $(function(){
        
        navbarAddEvent();
        $(window).resize(function(){
        	
        	var maxSectionWidth = window.innerWidth;
            $('.memobox').resizable({
                maxWidth: maxSectionWidth
            })
            
            if($(window).innerWidth() > 900){
                var normalNav = '<table class="table navTable">'
                              + '<tbody><tr class="first-row">'
                              +  '<td>WeMo</td>'
                              +  '<td class="bg-primary">공부</td>'
                              +  '<td class="bg-warning">운동</td>'
                              +  '<td class="bg-success">가계부</td>'
                              +  '<td class="bg-danger">캘린더</td>'
                              +  '<td class="bg-secondary">보관된 메모</td>'
                              +  '<td class="bg-dark trash">휴지통</td>'
                              +  '<td class="bg-info">통계</td>'
                              +  '<td class="bg-search">'
                              + '<span class="material-icons float-right" '
                              + 'style = "line-height: 24pt;">search<span>&nbsp;'
                              + '<span><input type = "text" class = "search_input float-right"></span>'
                              + '</td></tr></tbody></table>'
                $('nav').html(normalNav);
                navbarAddEvent();                
            
            } else {
                var mobileNav = '<table class="table navTable"><thead>'
                              + '<tr class="mobile-row">'
                              + '<td>Wemo</td><td></td><td>'
                              + '<span class="togglebtn material-icons float-right">list</span></td></tr></thead>'
                              + '<tbody id = "mobile-tbody">'
                              + '<tr class="mobile-row">'
                              + '<td class="bg-primary">공부</td>'
                              + '<td class="bg-warning">운동</td>'
                              + '<td class="bg-success">가계부</td></tr>'
                              + '<tr class="mobile-row">'
                              + '<td class="bg-danger">캘린더</td>'
                              + '<td class="bg-secondary">보관된 메모</td>'
                              + '<td class="bg-dark trash">휴지통</td></tr>'
                              + '<tr class="mobile-row">'
                              + '<td class="bg-info">통계</td>'
                              + '<td class="bg-search" colspan = "2">'
                              + '<span class="material-icons float-right"'
                              + ' style = "line-height: 24pt;">search<span>&nbsp;'
                              + '<input type = "text" class = "search_input float-right"></td></tr></tbody></table>'
                $('nav').html(mobileNav);
                $('.togglebtn').on('click', function(){
                $('#mobile-tbody').toggle('fast');
            })
                        .css('cursor', 'pointer');
            }
        })

        function navbarAddEvent(){
            var navbarItems = $('.first-row td');
            navbarItems.css({"cursor" : "pointer"});
            
            $.each(navbarItems,function(index, e){
            
            var firstSpanColValue = index;
            var secondSpanColValue = navbarItems.length-index -1;
            
        if (index != 0 && index != 8){
            $(navbarItems[index]).click(function(){
                var bgColorClass = $(navbarItems[index]).attr('class');
                console.log(bgColorClass);
                console.log(firstSpanColValue);
                console.log(secondSpanColValue);
                if($('.second-row'))
                    $('.second-row').last().remove();
                $('.first-row').after("<tr class = 'second-row'><td colspan='"+firstSpanColValue+"'></td><td class = '"+bgColorClass+"'></td><td colspan = '"+secondSpanColValue+"'</td></tr>")
                                
                $('.second-row td').css({
                    "border-collapse" : "collapse", 
                    "border" : "none",
                    "border-collapse" : "collapse",
                    "border-radius" : "0% 0% 5% 5%"
                })
                
                //이 부분 만들어졌을 시 선택된 nav 영역 클릭시 메모 생성 및 $('#subject').text() = this.text();(선택한 text 입력)
                })
            }
        })
        }
        
            /* 오늘 날짜 생성해서 date 클래스가 있는 span 태그에 삽입 */
            var date = new Date();
            if (date.getMonth() + 1 < 10)
                var month = "0" + (date.getMonth() + 1);
            else
                var month = data.getMonth() + 1;
            var today = date.getFullYear() + "-" + month + "-" + date.getDate();

            $('.date').text(today);

             /* newMemo(네비게이션 바 내에 공부/운동/캘린더 탭)클릭시 새 메모를 생성 */
            $('.newMemo').on('click', newMemoAppend);

             /* 처음 들어왔을 때 페이지에 존재하는 모든 메모에 이벤트 부여 */
            $('.close').on('click', recomCloseEventAdd);
            $('.lock').on('click', lockEventAdd);
            $('.favorites').on('click', favoEventAdd);           
            $('.delete').on('click', deleteEventAdd);

             /* 메모박스를 드래그가 가능한 객체로 변경하는 함수 draggable() @jQueryUI.js */
            $('.memobox').draggable()
                .resizable({
                    minWidth: 200,
                    maxWidth: 500,
                    minHeight: 130
                })
                 /* 메모 리사이즈 가능한 최소치 최대치 설정 */
                .resize(function (e) {
                    var memoWidth = $(this).width();
                    var memoHeight = $(this).height();
                    if (memoHeight < 220 || memoWidth < 220) {
                        $(this).children().children().next().css("display", "none");
                    } 
                })
                 /* 메모박스가 너무 작아지면 추천창이 자동으로 사라지도록 설계 */
                .one('click', addTextArea)
                 /* 메모박스 내에 삽입되는 textarea는 단 한 번만 실행되도록 on()이 아닌 one()으로 이벤트 부여 */
                .mouseup(adjustMemoboxzindex)                     
                .mousedown(function(e){
                    $(this).css("z-index", 1000);
                    // mousedown 했을 때 ajax를 통해서 memo 위치값 update
                }) // mousedown end

            $('.memotext').keydown(autoResizeTextArea);
            $('.memotext').focusout(memoOutResize);

             /* 추천박스 내에 있는 태그에 각각 폼 구현 -> 수정예정 */
            $('.tel').on('click', telFormAdd)
            $('.todo').on('click', todoFormAdd)
            $('.homework').on('click', homeworkFormAdd)
            $('.meeting').on('click', meetingFormAdd)

            


            /* UI 작업 끝나고 여기서부터 각 개체에 적용하는 함수들 정의 */

            // 새 메모를 메모 컨테이너에 생성하는 newMemoAppend() 함수
            function newMemoAppend(){
            	 var user = $('#user').text();
           		 
            	 var sub = $('#subject').text();
            	 var random = Math.random()*10;
            	 var top = random*40;
            	 var left = random*60;
            	 var zind =1000;
                var recommendContainer = "<div class = 'container recommend draggable' >"
                    + "<span>혹시 메모의 내용이 이것인가요?</span>"
                    + "<span class='material-icons close'> close </span><br>"
                    + "<button type = button class = 'btn btn-outline-warning tel'>전화번호</button>&nbsp;"
                    + "<button type = button class = 'btn btn-outline-warning todo'>할 일</button>"
                    + "<button type = button class = 'btn btn-outline-warning homework'>숙제</button>"
                    + "<button type = button class = 'btn btn-outline-warning meeting'>회의 일정</button></div>";

                var style = 'left: '+left+'px; top: '+top+'px; z-index: '+zind+';'

                var newMemobox = "<div class = 'container memobox shadow-sm' style = "+style+"><form>"
                    + "<div class = 'container memo-top'><span class = 'date'>" + today
                    + "</span><span class = 'section-name'> " + this.text + "</span>"
                    + "<span class = 'material-icons delete float-right'>delete</span>"
                    + "<span class = 'material-icons favorites float-right'>stars</span>"
                    + "<span class = 'material-icons float-right lock'>lock_open</span></div>"
                    + recommendContainer
                    + "<div class = 'container memoContent'></div></form></div>";

                $('.memoContainer').append(newMemobox);

                var findNewMemoBox = $('.memoContainer').last().find('.memobox');
                findNewMemoBox.draggable()
                    .resizable({
                        minWidth: 200, maxWidth: 500, minHeight: 200
                        })
                    .resize(function (e) {
                        var memoWidth = $(this).width();
                        var memoHeight = $(this).height();
                        if (memoHeight < 220 || memoWidth < 220) {
                            $(this).children().children().next().css("display", "none");
                        }
                    })
                    // 한 번만 실행되는 textarea 생성 이벤트를 .memobox 클래스에 추가
                    .one('click', findNewMemoBox, addTextArea)

                    // 나머지 아이콘들에 각각 이벤트 추가
                    .on('click', '.favorites', favoEventAdd)
                    .on('click', '.lock', lockEventAdd)
                    .on('click', '.delete', deleteEventAdd)
                    .on('click', '.close', recomCloseEventAdd)

                    // 추천 창 버튼에 이벤트 추가
                    .on('click', '.tel', telFormAdd)
                    .on('click', '.todo', todoFormAdd)
                    .on('click', '.homework', homeworkFormAdd)
                    .on('click', '.meeting', meetingFormAdd)
                
                    .mouseup(adjustMemoboxzindex)
                    .mousedown(bringFront) // mousedown end
                    .css("position", "absolute")
                
                
                $.ajax({//메모 생성시 DB에 넣음
					url:"newMemo",
					data :{
						"USER_EMAIL" : user,
						"MEMO_SUB" : sub,
						"MEMO_TOP" : top+"px",
						"MEMO_LEFT" : left+"px",
						"MEMO_ZIN" : zind
					},
					success : function(){
						adjustMemoboxzindex();//다른 메모들의 z-index : -1씩;
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
            }

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
        
        // 메모박스 클릭하면 textarea를 메모 내에 삽입하는 함수
        function addTextArea(Event) {
            //객체 내에 textarea가 하나도 없을 때만 실행되도록 함
            if($(this).find($('textarea')).length == 0){
                console.log(this.toString())
                $(this).append("<textarea class = 'memotext form-control' style='overflow-y:hidden; resize:none'>")
                $('.memotext').css({
                    "background-color": "khaki",
                    "border": "none"
                });
                $(this).find('.memotext').keydown(autoResizeTextArea)
                       .focus();
                $(this).children().children().next().css('display','none');
                $(this).focusout(memoOutResize);
                Event.preventDefault();
                // 이 이벤트는 부모객체로 전파되면 안되므로 prevent시킴
                }
            
            }

        function adjustMemoboxzindex(e){
            var memoboxAll = $('.memobox');

            memoboxAll.each(function(index, e){
                if ($(this).not($(memoboxAll[index]))){
                    var zidEach = $(memoboxAll[index]).css("z-index");
                    $(memoboxAll[index]).css("z-index", zidEach-1);
                    } // if end
                })// each end
            }// function end

        function bringFront(e){
            $(this).css("z-index", 1000);
        }

        function memoOutResize(e){
                var memotextSelector = $(this).find('.memotext');
                var text = memotextSelector.val();
                console.log(text);
                if (text.length > 5){
                var cutText = text.substring(0,5) + "...";
                    memotextSelector.val(cutText)
                                    .prop('rows', 2);
                    console.log(cutText);
                } else {
                    memotextSelector.val(text);
                }
                $(this).before().find('form').children().css("display", "none");
                $(this).parent().find('.memobox').css({"width" : 200, "height" : 130});
                e.preventDefault();
            }
        
        // 메모 내에 추가한 textarea 크기와 메모장 크기를 메모 내용에 맞춰 자동으로 늘려주거나 줄여주는 함수
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
            $(this).css('cursor', 'pointer');
            if ($(this).text().search('open') == 5)
                $(this).text('lock');
                //$.ajax 들어가야 함 (lockAdd)
            else
                $(this).text('lock_open');
                //$.ajax 들어가야 함 (lockDelete)
        }

        function favoEventAdd() {
            $(this).css('cursor', 'pointer');
            if ($(this).css('color') == "rgb(33, 37, 41)") {
                $(this).addClass('onFavo');
                //$.ajax 들어가야 함 (favoAdd 같은?)
            } else if ($(this).css('color') == "rgb(250, 128, 114)") {
                $(this).removeClass('onFavo');
                //$.ajax 들어가야 함 (favoDelete 같은)
            }
        }

        function deleteEventAdd(e) {
                $(this).css('cursor', 'pointer');
               // $(this).parent().parent().parent().css('display', 'none');
               // -> 이 방식으로는 숨기기만 함 삭제는 remove를 사용해야 함
                $(this).parent().parent().parent().remove();
                // 부모 객체까지 이벤트가 실행되지 않도록 막음
                e.preventDefault();
                /* $.ajax({
                    memoMoveToTrash or memoDelete
                })*/
            }

        function recomCloseEventAdd() {
            $(this).css('cursor', 'pointer');
            var recommend = $(this).parent();
            recommend.css("display", "none");
        }
    })
    </script>
</head>

<body>
    <nav>
      <div style="display:none" id="user">${USER_EMAIL }</div>
        <div  style="display:none" id="subject">${USER_SUB }</div>
        <table class="table navTable">
            <tbody>
                <tr class="first-row">
                    <td>WeMo</td>
                    <td class="bg-primary">공부</td>
                    <td class="bg-warning">운동</td>
                    <td class="bg-success">가계부</td>
                    <td class="bg-danger">캘린더</td>
                    <td class="bg-secondary">보관된 메모</td>
                    <td class="bg-dark trash">휴지통</td>
                    <td class="bg-info">통계</td>
                    <td class="bg-search">
                        <span class="material-icons float-right" style = "line-height: 24pt;">search</span>&nbsp;
                        <span><input type = "text" class = "search_input float-right"></span>
                    </td>
                </tr>
            </tbody>
        </table>
    </nav>
    <!-- 메모장 컨테이너 시작 -->
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
    
</body>

</html>