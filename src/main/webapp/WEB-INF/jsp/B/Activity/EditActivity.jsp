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

    <title>活動</title>

    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
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
                            <div class="card-body">
                                <div class="user-profile">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="user-photo m-b-30">
                                                <c:choose>
                                                    <c:when test="${activity.imgurImgs.size() != 0}">
                                                        <c:forEach items="${activity.imgurImgs}"
                                                                   var="img"
                                                                   begin="0" end="0" step="1">
                                                            <img class="img-fluid" src="${img.link}"
                                                                 alt="Image Error"/>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="img-fluid"
                                                             src="${contextRoot}/static/back/universal/images/no-image.jpeg"
                                                             alt="Image Error"/>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                            <div class="user-work">
                                                <p>
                                                    <span>開始日期：</span>
                                                    <input type="date"
                                                           value="${activity.startDate}">
                                                </p>

                                            </div>
                                            <div class="work-content">
                                                <p>
                                                    <span>結束日期：</span>
                                                    <input type="date" value="${activity.endDate}">
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="user-profile-name">
                                                <h1>${activity.subject}</h1>
                                            </div>
                                            <div class="user-send-message">
                                                <button class="btn btn-primary btn-addon"
                                                        type="button">
                                                    <i class="ti-email"></i>編輯
                                                </button>
                                            </div>
                                            <div class="custom-tab user-profile-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active">
                                                        <a href="#1" aria-controls="1" role="tab"
                                                           data-toggle="tab">內容</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane active"
                                                         id="1">
                                                        <div class="contact-information">
                                                            <div class="phone-content">
                                                                <span class="contact-title">活動內容:</span>
                                                                <textarea
                                                                        rows="10">${activity.content}</textarea>
                                                            </div>
                                                            <div>
                                                                <span class="contact-title">折扣％：</span>
                                                                <input type="number"
                                                                       value="${activity.discountPercentage}"
                                                                       placeholder="%">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>活動產品</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover ">
                                        <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Price</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${activity.products}" var="product">
                                            <c:forEach items="${product.fkBrand}" var="brand">
                                                <tr>
                                                    <td>
                                                            ${brand}
                                                    </td>
                                                </tr>

                                            </c:forEach>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Recent Comments </h4>

                            </div>
                            <div class="recent-comment">
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object"
                                                 src="${contextRoot}/static/back/assets/images/avatar/1.jpg"
                                                 alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">john doe</h4>
                                        <p>Cras sit amet nibh libero, in gravida nulla. </p>
                                        <div class="comment-action">
                                            <div class="badge badge-success">Approved</div>
                                            <span class="m-l-10">
                          <a href="#">
                            <i class="ti-check color-success"></i>
                          </a>
                          <a href="#">
                            <i class="ti-close color-danger"></i>
                          </a>
                          <a href="#">
                            <i class="fa fa-reply color-primary"></i>
                          </a>
                        </span>
                                        </div>
                                        <p class="comment-date">October 21, 2017</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object"
                                                 src="${contextRoot}/static/back/assets/images/avatar/2.jpg"
                                                 alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Mr. John</h4>
                                        <p>Cras sit amet nibh libero, in gravida nulla. </p>
                                        <div class="comment-action">
                                            <div class="badge badge-warning">Pending</div>
                                            <span class="m-l-10">
                          <a href="#">
                            <i class="ti-check color-success"></i>
                          </a>
                          <a href="#">
                            <i class="ti-close color-danger"></i>
                          </a>
                          <a href="#">
                            <i class="fa fa-reply color-primary"></i>
                          </a>
                        </span>
                                        </div>
                                        <p class="comment-date">October 21, 2017</p>
                                    </div>
                                </div>
                                <div class="media no-border">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object"
                                                 src="${contextRoot}/static/back/assets/images/avatar/3.jpg"
                                                 alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Mr. John</h4>
                                        <p>Cras sit amet nibh libero, in gravida nulla. </p>
                                        <div class="comment-action">
                                            <div class="badge badge-danger">Rejected</div>
                                            <span class="m-l-10">
                          <a href="#">
                            <i class="ti-check color-success"></i>
                          </a>
                          <a href="#">
                            <i class="ti-close color-danger"></i>
                          </a>
                          <a href="#">
                            <i class="fa fa-reply color-primary"></i>
                          </a>
                        </span>
                                        </div>
                                        <div class="comment-date">October 21, 2017</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
            </section>
        </div>
    </div>
</div>

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
</body>

</html>
