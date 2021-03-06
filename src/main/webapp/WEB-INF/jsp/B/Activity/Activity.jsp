<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>活動管理 - DESIGN & DECOR</title>
    <!-- Datatable -->
    <link href="${contextRoot}/static/back/assets/css/lib/data-table/dataTables.bootstrap.min.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/assets/css/lib/data-table/buttons.bootstrap.min.css"
          rel="stylesheet"/>

    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
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
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card outCard">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-title">
                                        <div class="row">
                                            <div class="col-lg-3 p-r-0 title-margin-right">
                                                <button data-toggle="modal"
                                                        data-target="#add-category"
                                                        class="btn btn-primary waves-effect waves-light">
                                                    <i class="fa fa-plus"></i> 新增活動
                                                </button>
                                                <button class="btn btn-danger waves-effect waves-light"
                                                        id="deleteBatchBtn">
                                                    <i class="fa fa-minus"></i> 批次刪除
                                                </button>
                                            </div>
                                            <div class="col-lg-3">
                                                <h2>活動管理</h2>
                                            </div>
                                            <div class="col-lg-6 .bg-light rounded text-primary p-l-0 title-margin-left">
                                                篩選：
                                                <label>主題:
                                                    <input type="text"
                                                           class="form-control border border-primary"
                                                           id="searchName">
                                                </label>
                                                <label for="searchStart" id="searchStartLabel"> 開始日期：
                                                    <input type="date"
                                                           class="form-control border border-primary"
                                                           id="searchStart"/>
                                                </label>
                                                <label for="searchEnd" id="searchEndLabel"> 結束日期：
                                                    <input type="date"
                                                           class="form-control border border-primary"
                                                           id="searchEnd"/>
                                                </label>
                                                <button class="btn btn-success" id="cleanSearch"><i
                                                        class="fa fa-minus"></i> 清空篩選
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="table_data">
                                                <thead>
                                                <tr>
                                                    <th>
                                                        <button class="btn btn-primary"
                                                                id="selectBtn">
                                                            全選
                                                        </button>
                                                    </th>
                                                    <th id="idTh"><span
                                                            class="ti-angle-double-down"> 編號</span>
                                                    </th>
                                                    <th><span
                                                            class="ti-angle-double-down"> 主題</span>
                                                    </th>
                                                    <th><span
                                                            class="ti-angle-double-down"> 圖片</span>
                                                    </th>
                                                    <th id="discountTh"><span
                                                            class="ti-angle-double-down"> 折扣 </span>
                                                    </th>
                                                    <th id="startTh"><span
                                                            class="ti-angle-double-down"> 起始日</span>
                                                    </th>
                                                    <th id="endTh"><span
                                                            class="ti-angle-double-down"> 結束日</span>
                                                    </th>
                                                    <th><span
                                                            class="ti-angle-double-down"> 編輯</span>
                                                    </th>
                                                    <th><span
                                                            class="ti-angle-double-down"> 刪除</span>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody id="theTbody">
                                                <c:forEach items="${activities.content}" var="ac">
                                                    <tr>
                                                        <td><input type="checkbox"
                                                                   id="checkbox${ac.id}"
                                                                   class="form-control checks">
                                                        </td>
                                                        <td class="showId">${ac.id}</td>
                                                        <td><p style="border-bottom: solid ${ac.color} 5px">${ac.subject}</p></td>
                                                        <c:choose>
                                                            <c:when test="${ac.imgurImgs.size() != 0 }">
                                                                <c:forEach items="${ac.imgurImgs}"
                                                                           var="img"
                                                                           begin="0" end="0">
                                                                    <td>
                                                                        <img src="${img.link}"
                                                                             alt=""
                                                                             width="100"/>
                                                                    </td>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td>
                                                                    <img src="${contextRoot}/static/back/universal/images/no-image.jpeg"
                                                                         alt="沒有圖片" width="100"
                                                                         height="100"/>
                                                                </td>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <td class="color-danger">${ac.discountPercentage}%</td>
                                                        <td>${ac.startDate}</td>
                                                        <td>${ac.endDate}</td>
                                                        <td>
                                                            <a href="editActivity/${ac.id}"
                                                               class="btn btn-warning">編輯</a>
                                                        </td>
                                                        <td>
                                                            <button type="button"
                                                                    class="btn btn-danger delete">刪除
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <nav aria-label="...">
                                                    <ul class="pagination" id="pageUl">
                                                        <li class="page-item disabled">
                                                            <button class="page-link"
                                                                    id="prePageBtn">
                                                                前一頁
                                                            </button>
                                                        </li>
                                                        <li class="page-item active">
                                                            <button class="page-link numBtn">1
                                                            </button>
                                                        </li>
                                                        <c:forEach begin="2"
                                                                   end="${activities.totalPages}"
                                                                   var="i">
                                                            <li class="page-item">
                                                                <button class="page-link numBtn">${i}</button>
                                                            </li>
                                                        </c:forEach>
                                                        <li class="page-item">
                                                            <button class="page-link"
                                                                    id="nextPageBtn">
                                                                後一頁
                                                            </button>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                            <div class="col-lg-6">
                                                <h4 class="text-primary text-lg-left"
                                                    id="totalElements">共 ${activities.totalElements}
                                                    筆</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /# card -->
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->


                <!-- Modal Add Category -->
                <div class="modal fade none-border" id="add-category"
                     data-backdrop="static">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title">
                                    <strong>新增活動</strong>
                                </h4>
                                <button type="button" class="btn btn-warning"
                                        data-dismiss="modal" aria-hidden="true">
                                    X
                                </button>
                            </div>
                            <div class="modal-body">

                                <form enctype="multipart/form-data"
                                      id="insertActivityForm" class="form">
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
                                                  class="form-control"
                                                  style="height:100%"
                                                  rows="4"></textarea>

                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="insertdiscountPercentage">折扣：(
                                                %OFF)
                                            </label>
                                            <div>
                                                <input type="number" value="0"
                                                       class="form-control"
                                                       min="1" max="99"
                                                       id="insertdiscountPercentage">
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label> 行事曆 顏色：
                                                <input type="color" name="color" id="insertColor"/>
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
                                               for="insertUploadFile">選擇圖片...</label>
                                        <img src="" alt="" hidden id="reviewImg"
                                             class="col-md-7 ml-auto rounded"/>
                                    </div>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <%--                                <button id="oneKeyInputBtn"--%>
                                <%--                                        class="btn btn-danger waves-effect waves-light save-category"--%>
                                <%--                                >一鍵輸入--%>
                                <%--                                </button>--%>
                                <button type="button" id="insertBtn"
                                        class="btn btn-primary waves-effect waves-light save-category"
                                        data-dismiss="modal">新增活動
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MODAL -->

                <!-- Footer -->
                <%--  <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/> --%>
            </section>
        </div>
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
<!-- DataTable -->
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.flash.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables-init.js"></script>

<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<%-- jquery & Ajax & JS 都在裏面--%>
<script src="${contextRoot}/static/back/universal/js/Activity.js"></script>
</body>

</html>
