<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Flot Chart</title>
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
                                <li class="breadcrumb-item active">Chart-Flot</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Real Chart</h4>
                            </div>
                            <div class="flot-container">
                                <div id="cpu-load" class="cpu-load"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Line Chart</h4>
                            </div>
                            <div class="flot-container">
                                <div id="flot-line" class="flot-line"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Pie Chart</h4>
                            </div>
                            <div class="flot-container">
                                <div id="flot-pie" class="flot-pie-container"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Line Chart</h4>
                            </div>
                            <div class="flot-container">
                                <div id="chart1"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Bar Chart</h4>
                            </div>
                            <div class="flot-container">
                                <div id="flotBar"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Curve Line</h4>
                            </div>
                            <div class="flot-container">
                                <div id="flotCurve"></div>
                            </div>
                        </div>
                        <!-- /# card -->
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


<div id="search">
    <button type="button" class="close">×</button>
    <form>
        <input type="search" value="" placeholder="type keyword(s) here"/>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>

<!--  flot-chart js -->
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/excanvas.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.pie.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.time.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.stack.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.resize.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/jquery.flot.crosshair.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/curvedLines.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/flot-tooltip/jquery.flot.tooltip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/flot-chart/flot-chart-init.js"></script>


</body>

</html>
