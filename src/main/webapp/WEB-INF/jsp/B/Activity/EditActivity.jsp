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

    <title>編輯活動 - DESIGN & DECOR</title>

    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>
    <link href="${contextRoot}/static/back/universal/css/EditActivity.css" rel="stylesheet"/>
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
                            <div class="card-body">
                                <div class="user-profile">
                                    <form id="updateForm">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <h4 id="activityID">${activity.id}</h4>
                                                <div class="user-photo m-b-30">
                                                    <c:choose>
                                                        <c:when test="${activity.imgurImgs.size() != 0}">
                                                            <c:forEach
                                                                    items="${activity.imgurImgs}"
                                                                    var="img"
                                                                    begin="0" end="0" step="1">
                                                                <img class="img-fluid"
                                                                     id="activityImg"
                                                                     src="${img.link}"
                                                                     alt="Image Error"/>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="img-fluid"
                                                                 id="activityImg"
                                                                 src="${contextRoot}/static/back/universal/images/no-image.jpeg"
                                                                 alt="Image Error"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                                <div class="custom-file">
                                                    <%--                                                    <span>更換圖片:</span>--%>
                                                    <label class="custom-file-label"
                                                           for="updateImg">更換圖片</label>
                                                    <input type="file" name="updateImg"
                                                           id="updateImg"
                                                           class="custom-file-input">
                                                </div>
                                            </div>
                                            <div class="col-lg-7">
                                                <div class="user-profile-name">
                                                    <h1><input type="text"
                                                               value="${activity.subject}"
                                                               name="subject"
                                                               id="updateSubject">

                                                    </h1>
                                                </div>
                                                <div class="user-send-message">
                                                    <button class="btn btn-primary btn-addon"
                                                            type="button" id="updateBtn">
                                                        <i class="ti-email"></i>編輯完成
                                                    </button>
                                                    <button class="btn btn-secondary btn-addon"
                                                            type="button" id="openProducts">
                                                        <i class="ti-layout-grid3-alt"></i>商品清單
                                                    </button>
                                                    <button class="btn btn-secondary btn-addon"
                                                            type="button" id="closeProducts"
                                                            hidden>
                                                        <i class="ti-layout-grid3-alt"></i>關閉清單
                                                    </button>
                                                    <a class="btn btn-warning btn-addon"
                                                       href="${contextRoot}/B/Activity/findAll">
                                                        <i class="ti-back-left"></i>回活動清單
                                                    </a>
                                                </div>
                                                <div class="custom-tab user-profile-tab">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li role="presentation" class="active">
                                                            <a href="#1" aria-controls="1"
                                                               role="tab"
                                                               data-toggle="tab">內容</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div role="tabpanel"
                                                             class="tab-pane active"
                                                             id="1">
                                                            <div class="contact-information">
                                                                <div class="phone-content">
                                                                    <span class="contact-title">活動內容:</span>
                                                                    <textarea id="updateContent"
                                                                              name="content"
                                                                              style="height:100%"
                                                                              class="form-control"
                                                                              rows="4">${activity.content}</textarea>
                                                                </div>
                                                                <%--                                                                <div class="contact-information">--%>
                                                                <%--                                                                    <span class="contact-title">折扣％：</span>--%>
                                                                <%--                                                                    <input type="number"--%>
                                                                <%--                                                                           class="form-control-sm"--%>
                                                                <%--                                                                           placeholder="%"--%>
                                                                <%--                                                                           name="discountPercentage"--%>
                                                                <%--                                                                           value="${activity.discountPercentage}"--%>
                                                                <%--                                                                           id="updatediscountPercentage">--%>
                                                                <%--                                                                    <span class="contact-website"> % OFF </span>--%>
                                                                <%--                                                                </div>--%>
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <label for="updatediscountPercentage">折扣：(
                                                                            %OFF)
                                                                            <input type="number"
                                                                                   class="form-control"
                                                                                   placeholder="%"
                                                                                   name="discountPercentage"
                                                                                   value="${activity.discountPercentage}"
                                                                                   id="updatediscountPercentage"/>
                                                                        </label>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <label> 行事曆 顏色：
                                                                            <input type="color"
                                                                                   name="color"
                                                                                   id="updateColor"
                                                                                   value="${activity.color}"/>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group col-sm-6">
                                                                <label for="updateStartDate">開始日：
                                                                </label>
                                                                <input type="date"
                                                                       value="${activity.startDate}"
                                                                       name="startDate"
                                                                       id="updateStartDate"
                                                                       class="form-control form-control-lg">

                                                            </div>
                                                            <div class="form-group col-sm-6">
                                                                <label for="updateEndDate">結束日：</label>
                                                                <input type="date"
                                                                       name="endDate"
                                                                       value="${activity.endDate}"
                                                                       id="updateEndDate"
                                                                       class="form-control form-control-lg">
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- /# row -->
                <div class="row">

                    <div class="col-lg-4" id="brandsList" hidden>
                        <div class="card">
                            <div class="card-title">
                                <h4>品牌清單</h4>
                            </div>
                            <div class="recent-comment" id="brandContent">
                                <%--  點了商品清單按鈕後，品牌清單顯示在這邊--%>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>

                    <!-- /# column -->

                    <div class="col-lg-8" id="productList" hidden>
                        <div class="card">
                            <div class="card-title">
                                <h4 id="h4ProductTitle">產品清單</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="productListTable">
                                        <thead>
                                        <tr>

                                            <th>
                                                <button class="btn btn-primary"
                                                        id="selectAllBtn">
                                                    全選
                                                </button>
                                                <button class="btn btn-primary"
                                                        id="unSelectAllBtn"
                                                        hidden>取消全選
                                                </button>
                                            </th>
                                            <th>圖片</th>
                                            <th>名稱</th>
                                            <th>分類</th>
                                            <th>價格</th>
                                            <th>庫存</th>
                                        </tr>
                                        </thead>
                                        <tbody id="productTbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->

                </div>
            </section>

        </div>
    </div>
</div>

<%-- 折扣商品的品牌選單 --%>


<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.flash.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>

<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<%-- jquery & Ajax & JS 都在裏面--%>
<script src="${contextRoot}/static/back/universal/js/EditActivity.js"></script>
</body>

</html>
