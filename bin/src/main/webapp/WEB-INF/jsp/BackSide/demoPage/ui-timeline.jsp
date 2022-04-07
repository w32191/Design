<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Timeline</title>

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
                                <li class="breadcrumb-item active">UI-Timeline</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Timeline</h4>

                            </div>
                            <div class="card-body">
                                <ul class="timeline">
                                    <li>
                                        <div class="timeline-badge primary"><i
                                                class="fa fa-smile-o"></i></div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h5 class="timeline-title">You deleted
                                                    homepage.psd</h5>
                                            </div>
                                            <div class="timeline-body">
                                                <p>10 minutes ago</p>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="timeline-badge warning"><i
                                                class="fa fa-sun-o"></i></div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h5 class="timeline-title">You change your profile
                                                    picture</h5>
                                            </div>
                                            <div class="timeline-body">
                                                <p>20 minutes ago</p>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="timeline-badge danger"><i
                                                class="fa fa-times-circle-o"></i></div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h5 class="timeline-title">You followed john
                                                    doe</h5>
                                            </div>
                                            <div class="timeline-body">
                                                <p>30 minutes ago</p>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="timeline-badge success"><i
                                                class="fa fa-check-circle-o"></i></div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h5 class="timeline-title">Some new content has been
                                                    added. </h5>
                                            </div>
                                            <div class="timeline-body">
                                                <p>15 minutes ago</p>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="timeline-badge default"><i
                                                class="fa fa-frown-o"></i></div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h5 class="timeline-title">favourited your
                                                    photo. </h5>
                                            </div>
                                            <div class="timeline-body">
                                                <p>40 minutes ago</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
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
</body>

</html>
