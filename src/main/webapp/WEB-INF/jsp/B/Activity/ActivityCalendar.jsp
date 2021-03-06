<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>活動行事曆 - DESIGN & DECOR</title>

    <!-- Calender -->
    <%--    <link href="${contextRoot}/static/back/assets/css/lib/calendar/fullcalendar.css"--%>
    <%--          rel="stylesheet"/>--%>
    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/fullcalendar-5.11.0/main.css"
          rel="stylesheet"/>
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>
    <link href="${contextRoot}/static/back/universal/css/Activity.css"
          rel="stylesheet"/>
</head>

<body>
<%--Left SideBar--%>
<jsp:include page="../IncludePage/layoutPage/leftSidebarPage.jsp"/>

<%--Header--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>


<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card outCard">
                            <div class="col-lg-12">
                                <div class="card bg-light mb-3">
                                    <div class="card-title">
                                        <h4>活動</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card-box">
                                                    <div id="calendar"></div>
                                                </div>
                                            </div>
                                            <!-- end col -->

                                            <!-- Modal Add Category -->
                                            <div class="modal fade none-border" id="add-category"
                                                 data-backdrop="static">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">

                                                            <h4 class="modal-title">
                                                                <strong>新增活動</strong>
                                                            </h4>
                                                            <button type="button"
                                                                    class="btn btn-warning"
                                                                    data-dismiss="modal"
                                                                    aria-hidden="true">
                                                                X
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">

                                                            <form enctype="multipart/form-data"
                                                                  id="insertActivityForm"
                                                                  class="form">
                                                                <div class="form-group">
                                                                    <label for="insertSubject">活動主題：</label>
                                                                    <input type="text"
                                                                           class="form-control form-control-lg"
                                                                           name="subject"
                                                                           id="insertSubject"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="insertContent">活動內容：</label>
                                                                    <textarea id="insertContent"
                                                                              class="form-control form-control-lg"
                                                                              style="height:100%"
                                                                              rows="4"></textarea>

                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-sm-6">
                                                                        <label for="insertdiscountPercentage">折扣：(
                                                                            %OFF)
                                                                        </label>
                                                                        <div>
                                                                            <input type="number"
                                                                                   value="0"
                                                                                   class="form-control"
                                                                                   min="1" max="99"
                                                                                   id="insertdiscountPercentage">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group col-sm-6">
                                                                        <label> 行事曆 顏色：
                                                                            <input type="color"
                                                                                   name="color"
                                                                                   id="insertColor"/>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="form-group col-sm-6">
                                                                        <label for="insertStartDate">開始日：
                                                                        </label>
                                                                        <input type="date"
                                                                               name="startDate"
                                                                               id="insertStartDate"
                                                                               class="form-control form-control-lg">
                                                                    </div>
                                                                    <div class="form-group col-sm-6">
                                                                        <label for="insertEndDate">結束日：</label>
                                                                        <input type="date"
                                                                               name="startDate"
                                                                               id="insertEndDate"
                                                                               class="form-control form-control-lg">
                                                                    </div>
                                                                </div>
                                                                <div class="custom-file">
                                                                    <input type="file"
                                                                           class="custom-file-input"
                                                                           id="insertUploadFile">
                                                                    <label class="custom-file-label"
                                                                           for="insertUploadFile">選擇檔案...</label>
                                                                    <img src="" alt="" hidden
                                                                         id="reviewImg"
                                                                         class="col-md-7 ml-auto rounded"/>
                                                                </div>
                                                            </form>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <%--                                                            <button id="oneKeyInputBtn"--%>
                                                            <%--                                                                    class="btn btn-danger waves-effect waves-light save-category"--%>
                                                            <%--                                                            >一鍵輸入--%>
                                                            <%--                                                            </button>--%>
                                                            <button type="button" id="insertBtn"
                                                                    class="btn btn-primary waves-effect waves-light save-category"
                                                                    data-dismiss="modal">新增活動
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END MODAL -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <!-- footer -->
                <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

            </section>

        </div>
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
<!-- jquery-ui -->
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<%--<script src="${contextRoot}/static/back/assets/js/lib/moment/moment.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/calendar/fullcalendar.min.js"></script>--%>
<%--<script src="${contextRoot}/static/back/universal/js/ActivityCalendar.js"></script>--%>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/static/back/universal/lib/fullcalendar-5.11.0/moment.min.js"></script>
<script src="${contextRoot}/static/back/universal/lib/fullcalendar-5.11.0/main.min.js"></script>
<script src="${contextRoot}/static/back/universal/lib/fullcalendar-5.11.0/locales-all.js"></script>
<script src="${contextRoot}/static/back/universal/js/ActivityCalendar.js"></script>

</body>

</html>
