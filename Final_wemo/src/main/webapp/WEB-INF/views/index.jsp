<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">

    <link rel="stylesheet" href="vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='vendor/css/select2.min.css' />
    <link rel="stylesheet" href='vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="css/main.css">

</head>

<body>
    <div class="container">

        <!-- ì¼ì í´ë¦­ì ë©ë´ì¤í -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">ì¹´íê³ ë¦¬1</a></li>
                <li><a tabindex="-1" href="#">ì¹´íê³ ë¦¬2</a></li>
                <li><a tabindex="-1" href="#">ì¹´íê³ ë¦¬3</a></li>
                <li><a tabindex="-1" href="#">ì¹´íê³ ë¦¬4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- ì¼ì  ì¶ê° MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">íë£¨ì¢ì¼</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">ì¼ì ëª</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">ìì</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">ë</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">êµ¬ë¶</label>
                                <select class="inputModal" name="edit-type" id="edit-type">
                                    <option value="ì¹´íê³ ë¦¬1">ì¹´íê³ ë¦¬1</option>
                                    <option value="ì¹´íê³ ë¦¬2">ì¹´íê³ ë¦¬2</option>
                                    <option value="ì¹´íê³ ë¦¬3">ì¹´íê³ ë¦¬3</option>
                                    <option value="ì¹´íê³ ë¦¬4">ì¹´íê³ ë¦¬4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">ìì</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">ë¹¨ê°ì</option>
                                    <option value="#9775fa" style="color:#9775fa;">ë³´ë¼ì</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">ì£¼í©ì</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">íëì</option>
                                    <option value="#f06595" style="color:#f06595;">íí¬ì</option>
                                    <option value="#63e6be" style="color:#63e6be;">ì°ëì</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">ì´ë¡ì</option>
                                    <option value="#4d638c" style="color:#4d638c;">ë¨ì</option>
                                    <option value="#495057" style="color:#495057;">ê²ì ì</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">ì¤ëª</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ì·¨ì</button>
                        <button type="button" class="btn btn-primary" id="save-event">ì ì¥</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ë«ê¸°</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">ì­ì </button>
                        <button type="button" class="btn btn-primary" id="updateEvent">ì ì¥</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">íí°</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">êµ¬ë¶ë³</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="ì¹´íê³ ë¦¬1">ì¹´íê³ ë¦¬1</option>
                            <option value="ì¹´íê³ ë¦¬2">ì¹´íê³ ë¦¬2</option>
                            <option value="ì¹´íê³ ë¦¬3">ì¹´íê³ ë¦¬3</option>
                            <option value="ì¹´íê³ ë¦¬4">ì¹´íê³ ë¦¬4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">ë±ë¡ìë³</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="ì ì°"
                                checked>ì ì°</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="ë¤í"
                                checked>ë¤í</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="ì¬ë"
                                checked>ì¬ë</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="ëì°"
                                checked>ëì°</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="ì§í¨"
                                checked>ì§í¨</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->

    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/moment.min.js"></script>
    <script src="vendor/js/fullcalendar.min.js"></script>
    <script src="vendor/js/ko.js"></script>
    <script src="vendor/js/select2.min.js"></script>
    <script src="vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/addEvent.js"></script>
    <script src="js/editEvent.js"></script>
    <script src="js/etcSetting.js"></script>
</body>

</html>