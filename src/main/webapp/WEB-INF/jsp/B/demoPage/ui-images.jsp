<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: UI Element Basic</title>

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
            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>Hello, <span>Welcome Here</span></h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">UI-Images</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-title">
                                <h4>Rounded Corners</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.img-rounded</code> class
                                    adds rounded corners to an image (IE8 does not support rounded
                                    corners):</p>
                                <img src="${contextRoot}/static/back/assets/images/paris.jpg"
                                     class="img-rounded img-fluid"
                                     alt="Cinque Terre">
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-title">
                                <h4>Circle</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.img-circle</code> class
                                    shapes the image to a circle (IE8 does not support rounded
                                    corners):</p>
                                <img src="${contextRoot}/static/back/assets/images/newyork.jpg"
                                     class="img-circle img-fluid"
                                     alt="Cinque Terre">
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-title">
                                <h4>Thumbnail</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.img-thumbnail</code> class
                                    shapes the image to a thumbnail:</p>
                                <img src="${contextRoot}/static/back/assets/images/sanfran.jpg"
                                     class="img-thumbnail img-fluid"
                                     alt="Cinque Terre">
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-title">
                                <h4>Responsive Images</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">Create responsive images by adding an
                                    <code>.img-fluid</code> class to the <code>&lt;img&gt;</code>
                                    tag. The image will then scale nicely to the parent element.</p>
                                <img src="${contextRoot}/static/back/assets/images/lights.jpg"
                                     class=" img-fluid"
                                     alt="Cinque Terre">
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Image Gallery</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">You can also use Bootstrap's grid
                                    system in conjunction with the <code>.thumbnail</code> class to
                                    create an image gallery.</p>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="thumbnail">
                                            <a href="${contextRoot}/static/back/assets/images/lights.jpg">
                                                <img class="w-100"
                                                     src="${contextRoot}/static/back/assets/images/lights.jpg"
                                                     alt="Lights">
                                                <div class="caption">
                                                    <p>Lorem ipsum donec id elit non mi porta
                                                        gravida at eget metus.</p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="thumbnail">
                                            <a href="${contextRoot}/static/back/assets/images/nature.jpg">
                                                <img class="w-100"
                                                     src="${contextRoot}/static/back/assets/images/nature.jpg"
                                                     alt="Nature">
                                                <div class="caption">
                                                    <p>Lorem ipsum donec id elit non mi porta
                                                        gravida at eget metus.</p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="thumbnail">
                                            <a href="${contextRoot}/static/back/assets/images/fjords.jpg">
                                                <img class="w-100"
                                                     src="${contextRoot}/static/back/assets/images/fjords.jpg"
                                                     alt="Fjords">
                                                <div class="caption">
                                                    <p>Lorem ipsum donec id elit non mi porta
                                                        gravida at eget metus.</p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <!-- Footer -->
                <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>
            </section>
        </div>
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>

<!--  Chart js -->
<script src="${contextRoot}/static/back/assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/chart-js/chartjs-init.js"></script>
<!-- // Chart js -->

</body>

</html>
