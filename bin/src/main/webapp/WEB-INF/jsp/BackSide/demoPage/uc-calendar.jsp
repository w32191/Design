<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Calender</title>

    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>

    <link href="${contextRoot}/static/back/assets/css/lib/calendar2/semantic.ui.min.css"
          rel="stylesheet">
    <link href="${contextRoot}/static/back/assets/css/lib/calendar2/pignose.calendar.min.css"
          rel="stylesheet">

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
                                <li class="breadcrumb-item active">UC-Calendar</li>
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
                                <h4>Calender</h4>

                            </div>
                            <div class="card-body">
                                <div class="year-calendar"></div>
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

<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/moment.latest.min.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/semantic.ui.min.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/prism.min.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
<!-- scripit init-->
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.init.js"></script>
<!-- scripit init-->
</body>

</html>
