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


            <script src="${contextRoot}/static/back/assets/js/lib/jquery-3.5.1.min.js"></script>
            <link href="${contextRoot}/static/back/universal/lib/bootstrap.min.css" rel="stylesheet" />
            <script src="${contextRoot}/static/back/assets/js/lib/bootstrap.min.js"></script>
            <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css" rel="stylesheet" />
            <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
                rel="stylesheet" />
            <link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
            <script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script>
            <!-- Common Styles -->
            <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp" />


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
                                                <button type="button"
                                                    class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"
                                                    data-toggle="modal" data-target="#insertModal">
                                                    <i class="ti-plus"></i>新增
                                                </button>
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

                                <div id="main-content">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="col-lg-12">
                                                    <div class="card">
                                                        <div class="card-title">
                                                            <h4>常見問題</h4>
                                                        </div>
                                                        <%-- dataTable--%>
                                                            <div class="bootstrap-data-table-panel">
                                                                <div class="table-responsive">
                                                                    <table id="row-select"
                                                                        class="display table table-borderd table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th hidden="">序號</th>
                                                                                <th>問題類型</th>
                                                                                <th>問題</th>
                                                                                <th>回答</th>
                                                                                <th>編輯</th>
                                                                                <th>刪除</th>
                                                                            </tr>
                                                                        </thead>

                                                                        <tbody id="findAll">
                                                                            <c:forEach var="cq" items="${cqs}">
                                                                                <tr>
                                                                                    <td hidden="">${cq.id}</td>
                                                                                    <td>${cq.questionType.commonQuestionType}
                                                                                    </td>
                                                                                    <td>${cq.question}</td>
                                                                                    <td>${cq.answer}</td>
                                                                                    <td>
                                                                                        <button type="button"
                                                                                            class="btn btn-warning"
                                                                                            name="edit"
                                                                                            data-toggle="modal"
                                                                                            data-target="#editModal">編輯
                                                                                        </button>
                                                                                    </td>
                                                                                    <td>
                                                                                        <button type="button"
                                                                                            class="btn btn-danger deleteBtn"
                                                                                            id="deleteBtn">刪除
                                                                                        </button>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th hidden="">ID</th>
                                                                                <th>標題</th>

                                                                            </tr>
                                                                        </tfoot>
                                                                    </table>
                                                                </div>
                                                            </div>


                                                            <!-- 新增Modal -->
                                                            <div class="modal fade" id="insertModal" tabindex="-1"
                                                                aria-labelledby="insertModalLabel" aria-hidden="true">
                                                                <div
                                                                    class="modal-dialog modal-dialog-scrollable modal-lg">
                                                                    <div class="modal-content ">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title"
                                                                                id="insertModalLabel">新增問題</h5>
                                                                            <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form id="addCQForm" class="form-inline"
                                                                                method="post"
                                                                                action="${contextRoot}/B/CommonQuestion/insertCommonQuestion"
                                                                                enctype="multipart/form-data">

                                                                                <div class="input-group mb-3 col-sm-5">
                                                                                    <div class="input-group-prepend">
                                                                                        <label class="input-group-text"
                                                                                            for="contact"><span
                                                                                                style="color: red">*</span>問題類型</label>
                                                                                    </div>
                                                                                    <select class="form-control"
                                                                                        aria-describedby="question_type"
                                                                                        name="question_type"
                                                                                        id="question_type" required>
                                                                                        <option value=""
                                                                                            style="display: none">
                                                                                        </option>
                                                                                        <c:forEach items="${cqts}"
                                                                                            var="cqt">
                                                                                            <c:choose>
                                                                                                <c:when
                                                                                                    test="${cq.questionType.commonQuestionType == cqt.commonQuestionType}">
                                                                                                    <option
                                                                                                        value="${cqt.id}"
                                                                                                        selected="selected">
                                                                                                        ${cqt.commonQuestionType}
                                                                                                    </option>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                    <option
                                                                                                        value="${cqt.id}">
                                                                                                        ${cqt.commonQuestionType}
                                                                                                    </option>
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </div>


                                                                                <div class="input-group mb-3 col-sm-6">
                                                                                    <div class="input-group-prepend">
                                                                                        <label class="input-group-text"
                                                                                            for="addQuestion"><span
                                                                                                style="color: red">*</span>問題</label>
                                                                                    </div>
                                                                                    <input type="text"
                                                                                        class="form-control"
                                                                                        id="addQuestion"
                                                                                        name="addQuestion" size="10"
                                                                                        aria-describedby="addQuestion"
                                                                                        autocomplete="off" required><br>
                                                                                </div>

                                                                                <div class="input-group mb-3 col-sm-6">
                                                                                    <div class="input-group-prepend">
                                                                                        <label class="input-group-text"
                                                                                            for="addAnswer"><span
                                                                                                style="color: red">*</span>回答</label>
                                                                                    </div>
                                                                                    <textarea name="addAnswer"
                                                                                            id="addAnswer" cols="100"
                                                                                            rows="10"
                                                                                            placeholder=""></textarea>
                                                                                    <!-- <input type="text"
                                                                                        class="form-control"
                                                                                        id="addAnswer" name="addAnswer"
                                                                                        size="10"
                                                                                        aria-describedby="addAnswer"
                                                                                        autocomplete="off" required><br> -->
                                                                                </div>


                                                                            </form>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                    class="btn btn-success"
                                                                                    id="smartInput">一鍵輸入</button>
                                                                                <button type="button"
                                                                                    class="btn btn-secondary"
                                                                                    data-dismiss="modal">關閉</button>
                                                                                <button id="addBtn" name="addBtn"
                                                                                    type="button"
                                                                                    class="btn btn-primary">送出</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- end of modal -->

                                                            <!-- 修改常見問題Modal -->
                                                            <div class="modal fade" id="editModal" tabindex="-1"
                                                                aria-labelledby="editModalLabel" aria-hidden="true">
                                                                <div
                                                                    class="modal-dialog modal-dialog-scrollable modal-lg">
                                                                    <div class="modal-content ">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="editModalLabel">
                                                                                修改常見問題</h5>
                                                                            <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <!-- form -->
                                                                            <form id="editCQForm" class="form-inline"
                                                                                method="post"
                                                                                action="${contextRoot}/B/CommonQuestion/updateQuestionContent"
                                                                                enctype="multipart/form-data">
                                                                                <div class="col-sm-11">
                                                                                    <h3>常見問題</h3>
                                                                                    <input type="text" name="id"
                                                                                        id="editId" hidden="">
                                                                                </div>


                                                                                <div class="input-group mb-3 col-sm-12">
                                                                                    <div class="input-group-prepend">
                                                                                        <label class="input-group-text"
                                                                                            for="question_type_edit"><span
                                                                                                style="color: red">*</span>問題類型</label>
                                                                                    </div>
                                                                                    <select class="form-control"
                                                                                        aria-describedby="question_type_edit"
                                                                                        name="question_type_edit"
                                                                                        id="question_type_edit"
                                                                                        required>
                                                                                        <option value=""
                                                                                            style="display: none">
                                                                                        </option>
                                                                                        <c:forEach items="${cqts}"
                                                                                            var="cqt">
                                                                                            <c:choose>
                                                                                                <c:when
                                                                                                    test="${cq.questionType.commonQuestionType == cqt.commonQuestionType}">
                                                                                                    <option
                                                                                                        value="${cqt.id}"
                                                                                                        selected="selected">
                                                                                                        ${cqt.commonQuestionType}
                                                                                                    </option>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                    <option
                                                                                                        value="${cqt.id}">
                                                                                                        ${cqt.commonQuestionType}
                                                                                                    </option>
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                        </c:forEach>
                                                                                    </select>

                                                                                </div>


                                                                                <div class="input-group mb-3 col-sm-12">
                                                                                    <div class="input-group-prepend">
                                                                                        <label class="input-group-text"
                                                                                            for="question"><span
                                                                                                style="color: red">*</span>問題</label>
                                                                                    </div>
                                                                                    <input type="text"
                                                                                        class="form-control"
                                                                                        id="question" name="question"
                                                                                        size="30"
                                                                                        aria-describedby="question"
                                                                                        autocomplete="off" required><br>
                                                                                </div>


                                                                                <div class="input-group mb-3 col-sm-12">
                                                                                    <div class="input-group-prepend">
                                                                                        <label class="input-group-text"
                                                                                            for="answer"><span
                                                                                                style="color: red">*</span>回答</label>
                                                                                    </div>
                                                                                    <textarea name="answer"
                                                                                            id="answer" cols="100"
                                                                                            rows="10"
                                                                                            placeholder=""></textarea>
                                                                                    <!-- <input type="text"
                                                                                        class="form-control" id="answer"
                                                                                        name="answer" size="30"
                                                                                        aria-describedby="answer"
                                                                                        autocomplete="off" required><br> -->
                                                                                </div>



                                                                            </form>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                    class="btn btn-secondary"
                                                                                    data-dismiss="modal">關閉</button>
                                                                                <button id="editCommitBtn" type="button"
                                                                                    class="btn btn-primary">送出</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- end of modal -->




                                                            <!-- /# row -->
                                                            <section id="main-content">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div id="extra-area-chart"></div>
                                                                        <div id="morris-line-chart"></div>
                                                                    </div>
                                                                </div>
                                                                <!-- Footer -->
                                                                <jsp:include
                                                                    page="../IncludePage/layoutPage/footerPage.jsp" />
                                                            </section>
                                                    </div>
                                                </div>
                                            </div>



                                            <!-- jQuery & Bootstrap-->
                                            <jsp:include page="../IncludePage/staticPage/BackJsPage.jsp" />

                                            <!-- script init-->
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
                                            <script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.colVis.min.js"></script>
                                            <%--<script
                                                src="${contextRoot}/static/back/assets/js/lib/data-table/datatables-init.js">
                                                </script>--%>



                                                <script
                                                    src="${contextRoot}/static/back/universal/taiwan_districts.js"></script>
                                                <script
                                                    src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
                                                <script
                                                    src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
                                                <script src="${contextRoot}/static/back/universal/Question.js"></script>

        </body>

        </html>