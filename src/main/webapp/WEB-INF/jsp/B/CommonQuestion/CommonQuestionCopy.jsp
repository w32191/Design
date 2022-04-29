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

                                <div class="container" align="center">
                                    <table id="table_id" class="display">
                                        <thead>
                                            <tr>
                                                <th width="100px">序號
                                                <th width="100px">問題類型
                                                <th width="200px">問題
                                                <th width="400px">回答
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${cqs}" var="cq">
                                                <tr>
                                                    <td>${cq.id}
                                                    <td>${cq.questionType.commonQuestionType}
                                                    <td>${cq.question}
                                                    <td>${cq.answer}
                                                    <td><button type="button" class="btn btn-info" name='edit'
                                                            data-toggle="modal" data-target="#editModal">更新</button>
                                                    </td>
                                                    <td><button id="deleteButton" type="button"
                                                            class="btn btn-cq-danger delete">刪除</button></a>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>


                                <div class="container">
                                    <p />
                                    <div class="row justify-content-center">
                                        <div class="col-9">
                                            <div class="card">
                                                <div class="card-header">新增問題</div>
                                                <div class="card-body">

                                                    <form:form class="form" method="POST"
                                                        modelAttribute="commonQuestion">

                                                        <!-- form:errors  bindingResult 回傳的物件 -->
                                                        <form:errors path="text" />

                                                        <div class="input-group">
                                                            <form:textarea path="text" class="form-control">
                                                            </form:textarea>
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

                    <script
                        src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
                    <script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
                    <script src="${contextRoot}/static/back/universal/Question.js"></script>



                    <!-- 修改常見問題Modal -->
                    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable modal-lg">
                            <div class="modal-content ">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">修改常見問題</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- form -->
                                    <form id="editCQForm" class="form-inline" method="post"
                                        action="${contextRoot}/B/CommonQuestion/updateQuestionContent"
                                        enctype="multipart/form-data">
                                        <div class="col-sm-11">
                                            <h3>常見問題</h3>
                                        </div>


                                        <div class="input-group mb-3 col-sm-12">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="question_type"><span
                                                        style="color: red">*</span>問題類型</label>
                                            </div>
                                            <select class="form-control" aria-describedby="question_type"
                                                name="question_type" id="question_type_e" required>
                                                <option value="" style="display: none"></option>
                                                <c:forEach items="${cqts}" var="cqt">
                                                    <c:choose>
                                                        <c:when
                                                            test="${cq.questionType.commonQuestionType == cqt.commonQuestionType}">
                                                            <option value="${cqt.id}" selected="selected">
                                                                ${cqt.commonQuestionType}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${cqt.id}">${cqt.commonQuestionType}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>

                                        </div>


                                        <div class="input-group mb-3 col-sm-12">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="question"><span
                                                        style="color: red">*</span>問題</label>
                                            </div>
                                            <input type="text" class="form-control" id="question_e" name="question"
                                                size="30" aria-describedby="question" autocomplete="off" required><br>
                                        </div>

                                        <div class="textarea-group mb-12 col-sm-12">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="answer"><span
                                                        style="color: red">*</span>答案</label>
                                            </div>
                                            <textarea rows="80" cols="80" type="text" class="form-control" id="answer_e"
                                                name="answer" aria-describedby="answer" autocomplete="off"
                                                required></textarea><br>
                                        </div>

                                    </form>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
                                        <button id="editBtn" type="button" class="btn btn-primary">送出</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end of modal -->

                    <script>
        < !--修改-->

                            $('body').on('click', 'button[name="edit"]', function () {
                                let id = $(this).parent().parent().find("td").html();
                                console.log(id);
                                $.ajax({
                                    url: "CommonQuestion/updateQuestion?id=" + id, //這個url是用來呼叫controller裡面的方法
                                    method: "get",
                                    success: function (data) {
                                        $('#id_e').val(data.id);
                                        $('#question_type_e').val(data.questionType.commonQuestionType);
                                        console.log(data.questionType.commonQuestionType);
                                        $('#question_e').val(data.question);
                                        $('#answer_e').val(data.answer);

                                    }
                                });
                            });

                        $("#question_type_e").change(function () {
                            ajaxSupervisor2();
                        })

                            < !--ajax更新常見問題類型選項(修改)-->
                                function ajaxSupervisor2() {
                                    let departId = $("#fkDepartment_e").val();
                                    let titleId = $("#fkTitleId_e").val();
                                    let empID = $("#empId_e").val();
                                    if (departId != "" || titleId != "") {
                                        $.ajax({
                                            url: 'http://localhost:8080/GroupOne/api/getSupervisorEdit?departId=' + departId + '&titleId=' +
                                                titleId + '&empId=' + empID,
                                            dataType: 'json',
                                            method: 'get',
                                            success: function (data) {
                                                $('#superiorName_e').html("");
                                                let superiorOption = "";
                                                superiorOption += '<option value="" style="display: none"></option>';
                                                for (i = 0; i < data.length; i++) {
                                                    if (i == 0) {
                                                        superiorOption += '<option value= "' + data[i].username
                                                        + '" selected>' + data[i].username + '</option>';
                                                    } else {
                                                        superiorOption += '<option value= "' +
                                                        data[i].username + '">' + data[i].username + '</option>';
                                                    }
                                                }
                                                $('#superiorName_e').append(superiorOption);
                                            }, error: function (err) {
                                                console.log(err)
                                                alert('發生錯誤1')
                                            }
                                        })
                                    } // end of if } <!--驗證並送出-->
                                    $('#editBtn').click(function () {
                                        let form = $('#editCQForm');
                                        let reportValidity = form[0].reportValidity();

                                        if (reportValidity) {
                                            $('#editCQForm').submit();
                                        }
                                    });






                                    // 刪除按鈕功能
                                    $('.btn.btn-cq-danger.delete').click(function () {
                                        let id = $(this).parent().parent().find("td").html();
                                        let urlStr = "CommonQuestion/deleteQuestion?id=" + id;
                                        swal.fire({
                                            title: '你確定要刪除嗎？',
                                            text: "此動作無法復原！",
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#3085d6',
                                            cancelButtonColor: '#d33',
                                            confirmButtonText: '確定刪除',
                                            cancelButtonText: '取消'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                $.ajax({
                                                    url: urlStr,
                                                    method: 'get',
                                                    beforeSend: function () {
                                                        swal.fire({
                                                            html: '<h5>刪除中...</h5>',
                                                            showConfirmButton: false,
                                                            onRender: function () {
                                                                // there will only ever be one sweet alert open.
                                                                // $('.swal2-content').prepend(sweet_loader);
                                                            }
                                                        });
                                                    },
                                                    success: function (res) {
                                                        console.log(res);
                                                        swal.fire({
                                                            icon: 'success',
                                                            html: '<h5>刪除成功!</h5>'
                                                        }).then(function () {
                                                            location.reload();
                                                        });

                                                    },
                                                    error: function (res) {
                                                        console.log(res);
                                                        // window.alert('刪除失敗');
                                                        swal.fire({
                                                            icon: 'error',
                                                            html: '<h5>刪除失敗!</h5>'
                                                        }).then(function () {
                                                            location.reload();
                                                        });
                                                    }
                                                });
                                            }
                                        })

                                    });



                    </script>



        </body>

        </html>