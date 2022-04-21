<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:set var="contextRoot" value="${pageContext.request.contextPath}" />

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>CommonQuestion</title>

            <!-- Common Styles -->
            <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp" />

            <!-- JQuery 此src是讓DataTable最下方的function可以執行-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

            <!-- DataTable的外部連結 -->
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

            <script type="text/javascript" charset="utf8"
                src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

            <!-- RWD JavaScript 連結 -->
            <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>

            <!-- RWD 的CSS連結-->
            <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
            <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css">

            <!-- DataTable的內部CSS連結（此連結需要放在RWD的CSS連結後，才不會衝突） -->
            <link rel="stylesheet" href="dataTable.css">
            

        </head>

        <body>

            <%--Left SideBar--%>
                <jsp:include page="../IncludePage/layoutPage/leftSidebarPage.jsp" />
                <%--Header--%>
                    <jsp:include page="../IncludePage/layoutPage/headerPage.jsp" />
                    <div class="content-wrap">
                        <div class="main">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-8 p-r-0 title-margin-right">
                                        <div class="page-header">
                                            <div class="page-title">
                                                <h1>Hello,
                                                    <span>Welcome Here</span>
                                                </h1>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /# column -->
                                    <div class="col-lg-4 p-l-0 title-margin-left">
                                        <div class="page-header">
                                            <div class="page-title">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item">
                                                        <a href="#">Dashboard</a>
                                                    </li>
                                                    <li class="breadcrumb-item active">UI-Blank</li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /# column -->
                                </div>

                                <div class="container">
                                    <p />
                                    <div class="row justify-content-center">
                                        <div class="col-9">
                                            <div class="card">
                                                <div class="card-header">編輯訊息</div>
                                                <div class="card-body">
                                
                                                    <form:form class="form" method="POST" modelAttribute="commonQuestion">
                                                    
                                                     <form:input type="hidden" path="id" />
                                                     <form:input type="hidden" path="added" />
                                
                                                        <!-- form:errors  bindingResult 回傳的物件 -->
                                                        <form:errors path="text" />
                                
                                                        <div class="input-group">
                                                            <form:textarea path="text" class="form-control"></form:textarea>
                                                        </div>
                                
                                                        <input type="submit" name="submit" value="送出">
                                                    </form:form>
                                
                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                

                                <div class="container">
                                    <p />
                                    <div class="row justify-content-center">
                                        <div class="col-9">
                                            <div class="card">
                                                <div class="card-header">新增問題</div>
                                                <div class="card-body">
                                
                                                    <form:form class="form" method="POST" modelAttribute="commonQuestion">
                                
                                                        <!-- form:errors  bindingResult 回傳的物件 -->
                                                        <form:errors path="text" />
                                
                                                        <div class="input-group">
                                                            <form:textarea path="text" class="form-control"></form:textarea>
                                                        </div>
                                
                                                        <input type="submit" name="submit" value="新增問題">
                                                    </form:form>
                                
                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div class="row justify-content-center">
                                        <div class="col-9">
                                            <div class="card">                                                
                                                <div class="card-body">
                                                    <c:out value="${lastMessage.text}" />
                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            


                                <!-- /# row -->
                                <section id="main-content">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div id="extra-area-chart"></div>
                                            <div id="morris-line-chart"></div>
                                        </div>
                                    </div>
                                    <!-- Footer -->
                                    <jsp:include page="../IncludePage/layoutPage/footerPage.jsp" />
                                </section>
                            </div>
                        </div>
                    </div>


                    <!-- jQuery & Bootstrap-->
                    <jsp:include page="../IncludePage/staticPage/BackJsPage.jsp" />

                    <!-- Calender -->
                    <script src="${contextRoot}/static/back/assets/js/lib/jquery-ui/jquery-ui.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/moment/moment.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/calendar/fullcalendar.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/calendar/fullcalendar-init.js"></script>

                    <!--  Flot Chart -->
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/excanvas.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.pie.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.time.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.stack.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.resize.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.crosshair.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/curvedLines.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/flot-chart/flot-tooltip/jquery.flot.tooltip.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/flot-chart/flot-chart-init.js"></script>

                    <!--  Chartist -->
                    <script src="${contextRoot}/static/back/assets/js/lib/chartist/chartist.min.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/chartist/chartist-plugin-tooltip.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/chartist/chartist-init.js"></script>

                    <!--  Chartjs -->
                    <script src="${contextRoot}/static/back/assets/js/lib/chart-js/Chart.bundle.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/chart-js/chartjs-init.js"></script>

                    <!--  Knob -->
                    <script src="${contextRoot}/static/back/assets/js/lib/knob/jquery.knob.min.js "></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/knob/knob.init.js "></script>

                    <!--  Morris -->
                    <script src="${contextRoot}/static/back/assets/js/lib/morris-chart/raphael-min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/morris-chart/morris.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/morris-chart/morris-init.js"></script>

                    <!--  Peity -->
                    <script src="${contextRoot}/static/back/assets/js/lib/peitychart/jquery.peity.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/peitychart/peitychart.init.js"></script>

                    <!--  Sparkline -->
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/sparklinechart/jquery.sparkline.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/sparklinechart/sparkline.init.js"></script>

                    <!-- Select2 -->
                    <script src="${contextRoot}/static/back/assets/js/lib/select2/select2.full.min.js"></script>

                    <!--  Validation -->
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate.min.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate-init.js"></script>

                    <!--  Circle Progress -->
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/circle-progress/circle-progress.min.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/circle-progress/circle-progress-init.js"></script>

                    <!--  Vector Map -->
                    <script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.algeria.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.argentina.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.brazil.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.france.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.germany.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.greece.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.iran.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.iraq.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.russia.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.tunisia.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.europe.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.usa.js"></script>

                    <!--  Simple Weather -->
                    <script src="${contextRoot}/static/back/assets/js/lib/weather/jquery.simpleWeather.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/weather/weather-init.js"></script>

                    <!--  Owl Carousel -->
                    <script src="${contextRoot}/static/back/assets/js/lib/owl-carousel/owl.carousel.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/owl-carousel/owl.carousel-init.js"></script>


                    <!-- Datatable -->
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.flash.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables-init.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.dataTables.min.js"></script>

                    <!-- JS Grid -->
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/db.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.core.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.load-indicator.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.load-strategies.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.sort-strategies.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.field.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.text.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.number.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.select.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.checkbox.js"></script>
                    <script
                        src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.control.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid-init.js"></script>

                    <!--  Datamap -->
                    <script src="${contextRoot}/static/back/assets/js/lib/datamap/d3.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/datamap/topojson.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/datamap/datamaps.world.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/datamap/datamap-init.js"></script>

                    <!--  Nestable -->
                    <script src="${contextRoot}/static/back/assets/js/lib/nestable/jquery.nestable.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/nestable/nestable.init.js"></script>

                    <!--ION Range Slider JS-->
                    <script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/ion.rangeSlider.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/moment.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/moment-with-locales.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/rangeslider.init.js"></script>

                    <!-- Bar Rating-->
                    <script src="${contextRoot}/static/back/assets/js/lib/barRating/jquery.barrating.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/barRating/barRating.init.js"></script>

                    <!-- jRate -->
                    <script src="${contextRoot}/static/back/assets/js/lib/rating1/jRate.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/rating1/jRate.init.js"></script>

                    <!-- Sweet Alert -->
                    <script src="${contextRoot}/static/back/assets/js/lib/sweetalert/sweetalert.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/sweetalert/sweetalert.init.js"></script>

                    <!-- Toastr -->
                    <script src="${contextRoot}/static/back/assets/js/lib/toastr/toastr.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/toastr/toastr.init.js"></script>

                    <!--  Dashboard -->
                    <script src="${contextRoot}/static/back/assets/js/dashboard1.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/dashboard2.js"></script>

                    <!-- Calender 2 -->
                    <script src="${contextRoot}/static/back/assets/js/lib/calendar-2/moment.latest.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
                    <script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.init.js"></script>

                    <script>
                        $(document).ready(function () {
                            $('#table_id').DataTable({
                                //中文化
                                "language": {
                                    "processing": "處理中...",
                                    "loadingRecords": "載入中...",
                                    "lengthMenu": "顯示 _MENU_ 項結果",
                                    "zeroRecords": "沒有符合的結果",
                                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                                    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                                    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                                    "search": "搜尋:",
                                    "paginate": {
                                        "first": "第一頁",
                                        "previous": "上一頁",
                                        "next": "下一頁",
                                        "last": "最後一頁"
                                    },
                                    "aria": {
                                        "sortAscending": ": 升冪排列",
                                        "sortDescending": ": 降冪排列"
                                    },
                                    "emptyTable": "目前沒有資料",
                                    "datetime": {
                                        "previous": "上一頁",
                                        "next": "下一頁",
                                        "hours": "時",
                                        "minutes": "分",
                                        "seconds": "秒",
                                        "amPm": [
                                            "上午",
                                            "下午"
                                        ],
                                        "unknown": "未知",
                                        "weekdays": [
                                            "週日",
                                            "週一",
                                            "週二",
                                            "週三",
                                            "週四",
                                            "週五",
                                            "週六"
                                        ],
                                        "months": [
                                            "一月",
                                            "二月",
                                            "三月",
                                            "四月",
                                            "五月",
                                            "六月",
                                            "七月",
                                            "八月",
                                            "九月",
                                            "十月",
                                            "十一月",
                                            "十二月"
                                        ]
                                    },
                                    "searchBuilder": {
                                        "add": "新增條件",
                                        "condition": "條件",
                                        "deleteTitle": "刪除過濾條件",
                                        "button": {
                                            "_": "複合查詢 (%d)",
                                            "0": "複合查詢"
                                        },
                                        "clearAll": "清空",
                                        "conditions": {
                                            "array": {
                                                "contains": "含有",
                                                "empty": "為空",
                                                "equals": "等於",
                                                "not": "不為",
                                                "notEmpty": "不為空",
                                                "without": "排除"
                                            },
                                            "date": {
                                                "after": "大於",
                                                "before": "小於",
                                                "between": "在其中",
                                                "empty": "為空",
                                                "equals": "等於",
                                                "not": "不為",
                                                "notBetween": "不在其中",
                                                "notEmpty": "不為空"
                                            },
                                            "number": {
                                                "between": "在其中",
                                                "empty": "為空",
                                                "equals": "等於",
                                                "gt": "大於",
                                                "gte": "大於等於",
                                                "lt": "小於",
                                                "lte": "小於等於",
                                                "not": "不為",
                                                "notBetween": "不在其中",
                                                "notEmpty": "不為空"
                                            },
                                            "string": {
                                                "contains": "含有",
                                                "empty": "為空",
                                                "endsWith": "字尾為",
                                                "equals": "等於",
                                                "not": "不為",
                                                "notEmpty": "不為空",
                                                "startsWith": "字首為",
                                                "notContains": "不包含",
                                                "notStarts": "不為開頭",
                                                "notEnds": "不為結束"
                                            }
                                        },
                                        "data": "欄位",
                                        "leftTitle": "群組條件",
                                        "logicAnd": "且",
                                        "logicOr": "或",
                                        "rightTitle": "取消群組",
                                        "title": {
                                            "_": "複合查詢 (%d)",
                                            "0": "複合查詢"
                                        },
                                        "value": "內容"
                                    },
                                    "editor": {
                                        "close": "關閉",
                                        "create": {
                                            "button": "新增",
                                            "title": "建立新項目",
                                            "submit": "建立"
                                        },
                                        "edit": {
                                            "button": "編輯",
                                            "title": "編輯項目",
                                            "submit": "更新"
                                        },
                                        "remove": {
                                            "button": "刪除",
                                            "title": "刪除",
                                            "submit": "刪除",
                                            "confirm": {
                                                "_": "您確定要刪除 %d 筆資料嗎？",
                                                "1": "您確定要刪除 %d 筆資料嗎？"
                                            }
                                        },
                                        "multi": {
                                            "restore": "回復修改",
                                            "title": "每行有不同的價值",
                                            "info": "您選擇了多個項目，每項目都有不同的價值。如果您想所有選擇的項目都用同一個價值，可以在這裏輸入一個價值。要不然它們會保留原本各自的價值",
                                            "noMulti": "此列不容許同時編輯多個項目"
                                        },
                                        "error": {
                                            "system": "系統發生錯誤(更多資訊)"
                                        }
                                    },
                                    "autoFill": {
                                        "cancel": "取消"
                                    },
                                    "buttons": {
                                        "copySuccess": {
                                            "_": "複製了 %d 筆資料",
                                            "1": "複製了 1 筆資料"
                                        },
                                        "copyTitle": "已經複製到剪貼簿",
                                        "excel": "Excel",
                                        "pdf": "PDF",
                                        "print": "列印",
                                        "copy": "複製"
                                    },
                                    "searchPanes": {
                                        "collapse": {
                                            "_": "搜尋面版 (%d)",
                                            "0": "搜尋面版"
                                        },
                                        "emptyPanes": "沒搜尋面版",
                                        "loadMessage": "載入搜尋面版中...",
                                        "clearMessage": "清空"
                                    },
                                    "select": {
                                        "rows": {
                                            "_": "%d 列已選擇",
                                            "1": "%d 列已選擇"
                                        }
                                    },
                                    "stateRestore": {
                                        "emptyError": "名稱不能空白。"
                                    }
                                }

                            });
                        });
                    </script>

        </body>

        </html>