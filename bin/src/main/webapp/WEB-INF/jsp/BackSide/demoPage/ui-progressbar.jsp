<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Progress Bar</title>

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
                                <li class="breadcrumb-item active">UI-Progressbar</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <!-- column -->
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Default Progress bars </h4>
                                <div class="progress m-t-30">
                                    <div class="progress-bar bg-danger"
                                         style="width: 60%; height:6px;" role="progressbar"><span
                                            class="sr-only">60% Complete</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Default Progress bars </h4>
                                <div class="progress m-t-20">
                                    <div class="progress-bar bg-success"
                                         style="width: 75%; height:15px;" role="progressbar">75%
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Striped Progress bar </h4>
                                <div class="progress m-t-20">
                                    <div class="progress-bar bg-info progress-bar-striped"
                                         aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 85%; height:10px;" role="progressbar"><span
                                            class="sr-only">85% Complete (success)</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">Colored bars </h4>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-danger"
                                                 style="width: 60%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-info"
                                                 style="width: 40%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-success"
                                                 style="width: 20%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-primary"
                                                 style="width: 30%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-warning"
                                                 style="width: 80%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-inverse"
                                                 style="width: 40%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">Different bar sizes </h4>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-danger"
                                                 style="width: 60%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-info"
                                                 style="width: 40%; height:8px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-success"
                                                 style="width: 20%; height:10px;"
                                                 role="progressbar"><span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-primary"
                                                 style="width: 30%; height:12px;"
                                                 role="progressbar"><span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-warning"
                                                 style="width: 80%; height:14px;"
                                                 role="progressbar"><span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">Animated Striped bar </h4>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar active progress-bar-striped bg-danger"
                                                 style="width: 60%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-info active progress-bar-striped"
                                                 style="width: 40%; height:8px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-success active progress-bar-striped"
                                                 style="width: 20%; height:10px;"
                                                 role="progressbar"><span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-primary active progress-bar-striped"
                                                 style="width: 30%; height:12px;"
                                                 role="progressbar"><span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-warning active progress-bar-striped"
                                                 style="width: 80%; height:14px;"
                                                 role="progressbar"><span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">Vertical Progress bars</h4>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-danger"
                                                 style="width:4px; height:60%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-info"
                                                 style="width:4px; height:80%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-success"
                                                 style="width:4px; height:60%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-primary"
                                                 style="width:4px; height:40%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-warning"
                                                 style="width:4px; height:30%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">From bottom</h4>
                                        <div class="progress progress-vertical-bottom m-t-30">
                                            <div class="progress-bar bg-danger"
                                                 style="width:4px; height:60%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical-bottom m-t-30">
                                            <div class="progress-bar bg-info"
                                                 style="width:4px; height:80%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical-bottom m-t-30">
                                            <div class="progress-bar bg-success"
                                                 style="width:4px; height:60%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical-bottom m-t-30">
                                            <div class="progress-bar bg-primary"
                                                 style="width:4px; height:40%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical-bottom m-t-30">
                                            <div class="progress-bar bg-warning"
                                                 style="width:4px; height:30%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">Different size Progress bars</h4>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-danger"
                                                 style="width:4px; height:60%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-info"
                                                 style="width:6px; height:80%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-success"
                                                 style="width:8px; height:60%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-primary"
                                                 style="width:10px; height:40%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress progress-vertical m-t-30">
                                            <div class="progress-bar bg-warning"
                                                 style="width:14px; height:30%;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">Animated bars </h4>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-danger wow animated progress-animated"
                                                 style="width: 60%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-info wow animated progress-animated"
                                                 style="width: 40%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-success wow animated progress-animated"
                                                 style="width: 20%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-primary wow animated progress-animated"
                                                 style="width: 30%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-warning wow animated progress-animated"
                                                 style="width: 80%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <div class="progress m-t-30">
                                            <div class="progress-bar bg-inverse wow animated progress-animated"
                                                 style="width: 40%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">SKILL BARS </h4>
                                        <h5 class="m-t-30">Photoshop<span
                                                class="pull-right">85%</span></h5>
                                        <div class="progress ">
                                            <div class="progress-bar bg-danger wow animated progress-animated"
                                                 style="width: 85%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <h5 class="m-t-30">Code editor<span
                                                class="pull-right">90%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-info wow animated progress-animated"
                                                 style="width: 90%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <h5 class="m-t-30">Illustrator<span
                                                class="pull-right">65%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-success wow animated progress-animated"
                                                 style="width: 65%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                    <div class="col-md-4 p-r-40 m-t-30 m-b-30">
                                        <h4 class="card-title">&nbsp;</h4>
                                        <h5 class="m-t-30">Dreamweaver<span
                                                class="pull-right">85%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-primary wow animated progress-animated"
                                                 style="width: 85%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <h5 class="m-t-30">Coral Draw<span
                                                class="pull-right">45%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning wow animated progress-animated"
                                                 style="width: 45%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                        <h5 class="m-t-30">Sketch<span class="pull-right">25%</span>
                                        </h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-inverse wow animated progress-animated"
                                                 style="width: 25%; height:6px;" role="progressbar">
                                                <span class="sr-only">60% Complete</span></div>
                                        </div>
                                    </div>
                                    <!-- Column -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>
            </section>
        </div>
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
</body>

</html>
