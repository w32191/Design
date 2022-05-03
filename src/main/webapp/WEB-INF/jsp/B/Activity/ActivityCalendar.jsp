<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin Dashboard</title>

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
                        <div class="card">
                            <div class="card-title">
                                <h4>活動</h4>

                                <button data-toggle="modal" data-target="#add-category"
                                        class="btn btn-lg btn-primary waves-effect waves-light">
                                    <i class="fa fa-plus"></i> Create New
                                </button>
                                <a href="findAll" class="btn btn-lg btn-success">Table</a>

                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-box">
                                            <div id="calendar"></div>
                                        </div>
                                    </div>
                                    <!-- end col -->
                                    <!-- BEGIN MODAL -->
                                    <div class="modal fade none-border" id="event-modal">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close"
                                                            data-dismiss="modal" aria-hidden="true">
                                                        &times;
                                                    </button>
                                                    <h4 class="modal-title">
                                                        <strong>Add New Event</strong>
                                                    </h4>
                                                </div>
                                                <div class="modal-body"></div>
                                                <div class="modal-footer">
                                                    <button type="button"
                                                            class="btn btn-default waves-effect"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                    <button type="button"
                                                            class="btn btn-success save-event waves-effect waves-light">
                                                        Create event
                                                    </button>
                                                    <button type="button"
                                                            class="btn btn-danger delete-event waves-effect waves-light"
                                                            data-dismiss="modal">Delete
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal Add Category -->
                                    <div class="modal fade none-border" id="add-category"
                                         data-backdrop="static">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">

                                                    <h4 class="modal-title">
                                                        <strong>Add a category </strong>
                                                    </h4>
                                                    <button type="button" class="btn btn-warning"
                                                            data-dismiss="modal" aria-hidden="true">
                                                        X
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="row">
                                                            <%--                                                            <div class="col-md-6">--%>
                                                            <%--                                                                <label class="control-label">Category--%>
                                                            <%--                                                                    Name</label>--%>
                                                            <%--                                                                <input class="form-control form-white"--%>
                                                            <%--                                                                       placeholder="Enter name"--%>
                                                            <%--                                                                       type="text"--%>
                                                            <%--                                                                       name="category-name"/>--%>
                                                            <%--                                                            </div>--%>
                                                            <%--                                                            <div class="col-md-6">--%>
                                                            <%--                                                                <label class="control-label">Choose--%>
                                                            <%--                                                                    Category Color</label>--%>
                                                            <%--                                                                <select class="form-control form-white"--%>
                                                            <%--                                                                        data-placeholder="Choose a color..."--%>
                                                            <%--                                                                        name="category-color">--%>
                                                            <%--                                                                    <option value="success">--%>
                                                            <%--                                                                        Success--%>
                                                            <%--                                                                    </option>--%>
                                                            <%--                                                                    <option value="danger">Danger--%>
                                                            <%--                                                                    </option>--%>
                                                            <%--                                                                    <option value="info">Info--%>
                                                            <%--                                                                    </option>--%>
                                                            <%--                                                                    <option value="pink">Pink--%>
                                                            <%--                                                                    </option>--%>
                                                            <%--                                                                    <option value="primary">--%>
                                                            <%--                                                                        Primary--%>
                                                            <%--                                                                    </option>--%>
                                                            <%--                                                                    <option value="warning">--%>
                                                            <%--                                                                        Warning--%>
                                                            <%--                                                                    </option>--%>
                                                            <%--                                                                </select>--%>
                                                            <%--                                                            </div>--%>
                                                            <form enctype="multipart/form-data"
                                                                  id="insertActivityForm">
                                                                <div class="form-group">
                                                                    <label>活動主題：
                                                                        <input type="text"
                                                                               class="form-control"
                                                                               name="subject"
                                                                               id="insertSubject"/>
                                                                    </label>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>活動內容：
                                                                        <textarea id="insertContent"
                                                                                  class="form-control"
                                                                                  rows="3"></textarea>
                                                                    </label>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>折扣％：
                                                                        <input type="number"
                                                                               placeholder="％"
                                                                               class="form-control"
                                                                               id="insertdiscountPercentage">
                                                                    </label>
                                                                </div>
                                                                <label>開始日：
                                                                    <input type="date"
                                                                           name="startDate"
                                                                           id="insertStartDate"
                                                                           class="form-control">
                                                                </label><br/>
                                                                <label>結束日：
                                                                    <input type="date"
                                                                           name="startDate"
                                                                           id="insertEndDate"
                                                                           class="form-control">
                                                                </label><br/>
                                                                <label>上傳圖片：
                                                                    <input type="file" name="files"
                                                                           id="insertUploadFile"
                                                                           class="form-control">
                                                                </label><br/>
                                                            </form>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" id="insertBtn"
                                                            class="btn btn-danger waves-effect waves-light save-category"
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