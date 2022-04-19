<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Vector Map</title>


    <!-- Styles -->
    <link href="${contextRoot}/static/back/assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
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
                <div class="col-md-8">
                    <h1>Hello, <span>Welcome Here</span></h1>
                </div>
                <div class="col-md-4">
                    <nav class="float-right">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Library</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>World</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Algeria</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap2" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Argentina</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap3" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Brazil</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap4" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>France</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap5" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Germany</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap6" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Greece</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap7" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->


                <div class="row">
                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Russia</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap10" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Tunasia</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap11" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Europe</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap12" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>USA</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap13" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Turkey</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap14" class="vmap"></div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

                    <div class="col-lg-6">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <h4>Inactive Regions</h4>
                                <div class="card-title-right-icon">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                            <div class="Vector-map-js">
                                <div id="vmap15" class="vmap"></div>
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

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>

<script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.algeria.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.argentina.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.brazil.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.france.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.germany.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.greece.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.iran.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.iraq.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.russia.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.tunisia.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.europe.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.usa.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.turkey.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/vector.init.js"></script>
<!-- scripit init-->
</body>

</html>
