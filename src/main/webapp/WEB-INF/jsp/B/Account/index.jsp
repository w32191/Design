<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DESIGN & DECOR</title>

    <!-- calendar2 -->
    <link href="${contextRoot}/static/back/assets/css/lib/calendar2/pignose.calendar.min.css"
          rel="stylesheet">
    <!-- chartist -->
    <link href="${contextRoot}/static/back/assets/css/lib/chartist/chartist.min.css"
          rel="stylesheet">
    <!-- weather-icons.css -->
    <link href="${contextRoot}/static/back/assets/css/lib/weather-icons.css" rel="stylesheet"/>
    <!-- Owl Carousel -->
    <link href="${contextRoot}/static/back/assets/css/lib/owl.carousel.min.css" rel="stylesheet"/>
    <link href="${contextRoot}/static/back/assets/css/lib/owl.theme.default.min.css"
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
        
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>

<!-- calendar-2 -->
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/moment.latest.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.init.js"></script>
<!-- weather -->
<script src="${contextRoot}/static/back/assets/js/lib/weather/jquery.simpleWeather.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/weather/weather-init.js"></script>
<!-- circle-progress -->
<script src="${contextRoot}/static/back/assets/js/lib/circle-progress/circle-progress.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/circle-progress/circle-progress-init.js"></script>
<!-- chartist -->
<script src="${contextRoot}/static/back/assets/js/lib/chartist/chartist.min.js"></script>
<!-- sparklinechart -->
<script src="${contextRoot}/static/back/assets/js/lib/sparklinechart/jquery.sparkline.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/sparklinechart/sparkline.init.js"></script>
<!-- owl-carousel -->
<script src="${contextRoot}/static/back/assets/js/lib/owl-carousel/owl.carousel.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/owl-carousel/owl.carousel-init.js"></script>
<!--  Dashboard -->
<script src="${contextRoot}/static/back/assets/js/dashboard2.js"></script>
</body>

</html>
