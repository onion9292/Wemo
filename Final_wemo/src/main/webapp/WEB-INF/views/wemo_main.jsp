<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><!DOCTYPE html>
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
                              +  '<td class="bg-primary">����</td>'
                              +  '<td class="bg-warning">�</td>'
                              +  '<td class="bg-success">�����</td>'
                              +  '<td class="bg-danger">Ķ����</td>'
                              +  '<td class="bg-secondary">������ �޸�</td>'
                              +  '<td class="bg-dark trash">������</td>'
                              +  '<td class="bg-info">���</td>'
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
                              + '<td class="bg-primary">����</td>'
                              + '<td class="bg-warning">�</td>'
                              + '<td class="bg-success">�����</td></tr>'
                              + '<tr class="mobile-row">'
                              + '<td class="bg-danger">Ķ����</td>'
                              + '<td class="bg-secondary">������ �޸�</td>'
                              + '<td class="bg-dark trash">������</td></tr>'
                              + '<tr class="mobile-row">'
                              + '<td class="bg-info">���</td>'
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
                })
            }
        })
        }
        
            /* ���� ��¥ �����ؼ� date Ŭ������ �ִ� span �±׿� ���� */
            var date = new Date();
            if (date.getMonth() + 1 < 10)
                var month = "0" + (date.getMonth() + 1);
            else
                var month = data.getMonth() + 1;
            var today = date.getFullYear() + "-" + month + "-" + date.getDate();

            $('.date').text(today);

             /* newMemo(�׺���̼� �� ���� ����/�/Ķ���� ��)Ŭ���� �� �޸� ���� */
            $('.newMemo').on('click', newMemoAppend);

             /* ó�� ������ �� �������� �����ϴ� ��� �޸� �̺�Ʈ �ο� */
            $('.close').on('click', recomCloseEventAdd);
            $('.lock').on('click', lockEventAdd);
            $('.favorites').on('click', favoEventAdd);           
            $('.delete').on('click', deleteEventAdd);

             /* �޸�ڽ��� �巡�װ� ������ ��ü�� �����ϴ� �Լ� draggable() @jQueryUI.js */
            $('.memobox').draggable()
                .resizable({
                    minWidth: 200,
                    maxWidth: 500,
                    minHeight: 130
                })
                 /* �޸� �������� ������ �ּ�ġ �ִ�ġ ���� */
                .resize(function (e) {
                    var memoWidth = $(this).width();
                    var memoHeight = $(this).height();
                    if (memoHeight < 220 || memoWidth < 220) {
                        $(this).children().children().next().css("display", "none");
                    } 
                })
                 /* �޸�ڽ��� �ʹ� �۾����� ��õâ�� �ڵ����� ��������� ���� */
                .one('click', addTextArea)
                 /* �޸�ڽ� ���� ���ԵǴ� textarea�� �� �� ���� ����ǵ��� on()�� �ƴ� one()���� �̺�Ʈ �ο� */
                .mouseup(adjustMemoboxzindex)                     
                .mousedown(function(e){
                    $(this).css("z-index", 1000);
                }) // mousedown end

            $('.memotext').keydown(autoResizeTextArea);
            $('.memotext').focusout(memoOutResize);

             /* ��õ�ڽ� ���� �ִ� �±׿� ���� �� ���� -> �������� */
            $('.tel').on('click', telFormAdd)
            $('.todo').on('click', todoFormAdd)
            $('.homework').on('click', homeworkFormAdd)
            $('.meeting').on('click', meetingFormAdd)

            


            /* UI �۾� ������ ���⼭���� �� ��ü�� �����ϴ� �Լ��� ���� */

            // �� �޸� �޸� �����̳ʿ� �����ϴ� newMemoAppend() �Լ�
            function newMemoAppend(){

                var recommendContainer = "<div class = 'container recommend draggable' >"
                    + "<span>Ȥ�� �޸��� ������ �̰��ΰ���?</span>"
                    + "<span class='material-icons close'> close </span><br>"
                    + "<button type = button class = 'btn btn-outline-warning tel'>��ȭ��ȣ</button>&nbsp;"
                    + "<button type = button class = 'btn btn-outline-warning todo'>�� ��</button>"
                    + "<button type = button class = 'btn btn-outline-warning homework'>����</button>"
                    + "<button type = button class = 'btn btn-outline-warning meeting'>ȸ�� ����</button></div>";

                var style = 'left: 100px; top: 100px; z-index: 1000;'

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
                    // �� ���� ����Ǵ� textarea ���� �̺�Ʈ�� .memobox Ŭ������ �߰�
                    .one('click', findNewMemoBox, addTextArea)

                    // ������ �����ܵ鿡 ���� �̺�Ʈ �߰�
                    .on('click', '.favorites', favoEventAdd)
                    .on('click', '.lock', lockEventAdd)
                    .on('click', '.delete', deleteEventAdd)
                    .on('click', '.close', recomCloseEventAdd)

                    // ��õ â ��ư�� �̺�Ʈ �߰�
                    .on('click', '.tel', telFormAdd)
                    .on('click', '.todo', todoFormAdd)
                    .on('click', '.homework', homeworkFormAdd)
                    .on('click', '.meeting', meetingFormAdd)
                
                    .mouseup(adjustMemoboxzindex)
                    .mousedown(bringFront) // mousedown end
                    .css("position", "absolute")
                adjustMemoboxzindex();
            }

        function telFormAdd() {
                var memoContent = $(this).parent().next();
                memoContent.html(
                    "<div class = 'input-group recomList'>"
                    + "<div class = 'input-group-prepend'>"
                    + "<span class = 'input-group-text'>�̸�</span></div>"
                    + "<input type ='text' name = 'name' class = 'form-control'/></div>"
                    + "<div class = 'input-group'>"
                    + "<div class ='input-group-prepend'>"
                    + "<span class = 'input-group-text'>��ȭ��ȣ</span></div>"
                    + "<input type ='text' name = 'tel' class = 'form-control'/></div>"
                    + "<div class = 'input-group'>"
                    + "<div class = 'input-group-prepend'>"
                    + "<span class = 'input-group-text'>�޸�</span></div>"
                    + "<textarea class = 'form-control' name = 'memo'/></textarea>"
                    + "<button class = 'btn btn-outline-success'>�Է�</button></div>"
                )
            }

        function homeworkFormAdd() {
                var memoContent = $(this).parent().next();
                memoContent.html(
                    "<div class = 'input-group recomList'>"
                    + "<div class = 'input-group-prepend'>"
                    + "<span class = 'input-group-text'>�����</span></div>"
                    + "<input type ='text' class = 'form-control'/></div>"
                    + "<div class = 'input-group'>"
                    + "<div class ='input-group-prepend'>"
                    + "<span class = 'input-group-text'>��������?</span></div>"
                    + "<input type ='text' class = 'form-control'/></div>"
                    + "<div class = 'input-group'>"
                    + "<div class = 'input-group-prepend'>"
                    + "<span class = 'input-group-text'>�޸�</span></div>"
                    + "<textarea class = 'form-control'/></textarea>"
                    + "<button class = 'btn btn-outline-success'>�Է�</button></div>"
                )
            }

        function meetingFormAdd() {
                var memoContent = $(this).parent().next();
                memoContent.html(
                    "<div class = 'input-group recomList'>"
                    + "<div class = 'input-group-prepend'>"
                    + "<span class = 'input-group-text'>����?</span></div>"
                    + "<input type ='text' class = 'form-control'/></div>"
                    + "<div class = 'input-group'>"
                    + "<div class ='input-group-prepend'>"
                    + "<span class = 'input-group-text'>���?</span></div>"
                    + "<input type ='text' class = 'form-control'/></div>"
                    + "<div class = 'input-group'>"
                    + "<div class = 'input-group-prepend'>"
                    + "<span class = 'input-group-text'>� ȸ��?</span></div>"
                    + "<textarea class = 'form-control'/></textarea>"
                    + "<button class = 'btn btn-outline-success'>�Է�</button></div>"
                )
            }

        function todoFormAdd() {
                var memoContent = $(this).parent().next();
                memoContent.html(
                    "<div class = 'input-group recomList'>"
                    + "<div class = 'input-group-prepend'>"
                    + "<span class = 'input-group-text'>�� ��</span></div>"
                    + "<textarea class = 'form-control' rows = '5'></textarea>"
                    + "<button class = 'btn btn-outline-success'>�Է�</button></div>"
                )
            }
        
        // �޸�ڽ� Ŭ���ϸ� textarea�� �޸� ���� �����ϴ� �Լ�
        function addTextArea(Event) {
            //��ü ���� textarea�� �ϳ��� ���� ���� ����ǵ��� ��
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
                // �� �̺�Ʈ�� �θ�ü�� ���ĵǸ� �ȵǹǷ� prevent��Ŵ
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
        
        // �޸� ���� �߰��� textarea ũ��� �޸��� ũ�⸦ �޸� ���뿡 ���� �ڵ����� �÷��ְų� �ٿ��ִ� �Լ�
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
                //$.ajax ���� �� (lockAdd)
            else
                $(this).text('lock_open');
                //$.ajax ���� �� (lockDelete)
        }

        function favoEventAdd() {
            $(this).css('cursor', 'pointer');
            if ($(this).css('color') == "rgb(33, 37, 41)") {
                $(this).addClass('onFavo');
                //$.ajax ���� �� (favoAdd ����?)
            } else if ($(this).css('color') == "rgb(250, 128, 114)") {
                $(this).removeClass('onFavo');
                //$.ajax ���� �� (favoDelete ����)
            }
        }

        function deleteEventAdd(e) {
                $(this).css('cursor', 'pointer');
               // $(this).parent().parent().parent().css('display', 'none');
               // -> �� ������δ� ����⸸ �� ������ remove�� ����ؾ� ��
                $(this).parent().parent().parent().remove();
                // �θ� ��ü���� �̺�Ʈ�� ������� �ʵ��� ����
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
        <table class="table navTable">
            <tbody>
                <tr class="first-row">
                    <td>WeMo</td>
                    <td class="bg-primary">����</td>
                    <td class="bg-warning">�</td>
                    <td class="bg-success">�����</td>
                    <td class="bg-danger">Ķ����</td>
                    <td class="bg-secondary">������ �޸�</td>
                    <td class="bg-dark trash">������</td>
                    <td class="bg-info">���</td>
                    <td class="bg-search">
                        <span class="material-icons float-right" style = "line-height: 24pt;">search<span>&nbsp;
                        <span><input type = "text" class = "search_input float-right"></span>
                    </td>
                </tr>
            </tbody>
        </table>
    </nav>
    <!-- �޸��� �����̳� ���� -->
    <div class="memoContainer">
        <!-- �����̳� �� ù��° �޸�ڽ� -->
        <!-- �޸�ڽ��� ��ġ ������ ���⼭ style�� �ָ� ��ġ�� ������ ���� �� -->
        <div class='container memobox shadow-sm' style = "position: absolute; left: 5px; top: 80px; z-index: 120">
            <form>
                <!-- �޸�ڽ� ��� �޴�(��¥, ī�װ�, �����ܵ�) -->
                <div class='container memo-top'>
                    <span class="date"></span>
                    <span class="section-name">����</span>
                    <span class="material-icons delete float-right">delete</span>
                    <span class='material-icons float-right favorites'>stars</span>
                    <span class="material-icons float-right lock">lock_open</span>
                </div>
                <!-- �޸�ڽ� �� ��õ���� -->
                <div class='container recommend'>
                    <span>Ȥ�� �޸��� ������ �̰��ΰ���?</span>
                    <span class='material-icons close'> close </span>
                    <br>
                    <button type=button class='btn btn-outline-warning tel'>��ȭ��ȣ</button>
                    &nbsp;
                    <button type=button class='btn btn-outline-warning todo'>�� ��</button>
                    <button type=button class='btn btn-outline-warning homework'>����</button>
                    <button type=button class='btn btn-outline-warning meeting'>ȸ�� ����</button>
                </div>
                <!-- �޸�ڽ� �� �޸� ������ -->
                <div class='container memoContent'>
                <!-- �� �ڸ��� textarea ���Ե� -->
                </div>
            </form>
        </div>

        <div class='container memobox shadow-sm' style = "position: absolute; left: 352px; top: 92px; z-index: 13">
            <form>
                <div class='container memo-top'>
                    <span class="date"></span>
                    <span class="section-name">�</span>
                    <span class='material-icons delete float-right'>delete</span>
                    <span class='material-icons float-right favorites'>stars</span>
                    <span class="material-icons float-right lock">lock_open</span>
                </div>
                <div class='container recommend'>
                    <span>Ȥ�� �޸��� ������ �̰��ΰ���?</span>
                    <span class='material-icons close'> close </span>
                    <br>
                    <button type=button class='btn btn-outline-warning tel'>��ȭ��ȣ</button>
                    &nbsp;
                    <button type=button class='btn btn-outline-warning todo'>�� ��</button>
                    <button type=button class='btn btn-outline-warning homework'>����</button>
                    <button type=button class='btn btn-outline-warning meeting'>ȸ�� ����</button>
                </div>
                <div class='container memoContent'>

                </div>
            </form>
        </div>

        <div class='container memobox shadow-sm' style = "position: absolute; left: 85px; top: 852px; z-index: 140">
            <form>
                <div class='container memo-top'>
                    <span class="date"></span>
                    <span class="section-name">�����</span>
                    <span class="material-icons delete float-right">delete</span>
                    <span class='material-icons float-right favorites'>stars</span>
                    <span class="material-icons float-right lock">lock_open</span>
                </div>
                <div class='container recommend'>
                    <span>Ȥ�� �޸��� ������ �̰��ΰ���?</span>
                    <span class='material-icons close'> close </span>

                    <br>
                    <button type=button class='btn btn-outline-warning tel'>��ȭ��ȣ</button>
                    &nbsp;
                    <button type=button class='btn btn-outline-warning todo'>�� ��</button>
                    <button type=button class='btn btn-outline-warning homework'>����</button>
                    <button type=button class='btn btn-outline-warning meeting'>ȸ�� ����</button>
                </div>
                <div class='container memoContent'>

                </div>
            </form>
        </div>
    </div>
    
</body>

</html>