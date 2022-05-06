<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin Dashboard</title>


    <!-- Toastr -->
    <link href="${contextRoot}/static/back/assets/css/lib/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${contextRoot}/static/back/assets/css/lib/sweetalert/sweetalert.css"
          rel="stylesheet">
    <!-- Range Slider -->
    <link href="${contextRoot}/static/back/assets/css/lib/rangSlider/ion.rangeSlider.css"
          rel="stylesheet">
    <link href="${contextRoot}/static/back/assets/css/lib/rangSlider/ion.rangeSlider.skinFlat.css"
          rel="stylesheet">
    <!-- Bar Rating -->
    <link href="${contextRoot}/static/back/assets/css/lib/barRating/barRating.css" rel="stylesheet">
    <!-- Nestable -->
    <link href="${contextRoot}/static/back/assets/css/lib/nestable/nestable.css" rel="stylesheet">
    <!-- JsGrid -->
    <link href="${contextRoot}/static/back/assets/css/lib/jsgrid/jsgrid-theme.min.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/assets/css/lib/jsgrid/jsgrid.min.css" type="text/css"
          rel="stylesheet"/>
    <!-- Datatable -->
    <link href="${contextRoot}/static/back/assets/css/lib/datatable/dataTables.bootstrap.min.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/assets/css/lib/data-table/buttons.bootstrap.min.css"
          rel="stylesheet"/>
    <!-- Calender 2 -->
    <link href="${contextRoot}/static/back/assets/css/lib/calendar2/pignose.calendar.min.css"
          rel="stylesheet">
    <!-- Weather Icon -->
    <link href="${contextRoot}/static/back/assets/css/lib/weather-icons.css" rel="stylesheet"/>
    <!-- Owl Carousel -->
    <link href="${contextRoot}/static/back/assets/css/lib/owl.carousel.min.css" rel="stylesheet"/>
    <link href="${contextRoot}/static/back/assets/css/lib/owl.theme.default.min.css"
          rel="stylesheet"/>
    <!-- Select2 -->
    <link href="${contextRoot}/static/back/assets/css/lib/select2/select2.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link href="${contextRoot}/static/back/assets/css/lib/chartist/chartist.min.css"
          rel="stylesheet">
    <!-- Calender -->
    <link href="${contextRoot}/static/back/assets/css/lib/calendar/fullcalendar.css"
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
            </div>
            <!-- /# row -->
                                            <div class="user-send-message">
                                                <button class="btn btn-primary btn-addon"
                                                        type="button">
                                                    <i class="ti-email"></i>Send Message
                                                </button>
                                            </div>
                                            <div class="custom-tab user-profile-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active">
                                                        <a  aria-controls="1" role="tab"
                                                           data-toggle="tab" >個人資料</a>
                                                    </li>
                                                </ul>
                                                <br>
                                                <br>
                                             				
                                             				<div class="name-content">
                                                                <span class="contact-title">姓名:</span>
                                                                <input class="mail-address" type="text" name="names" value="${member.names}" >
                                                            </div>
                                                            <br>
                                                            <div class="phone-content">
                                                                <span class="contact-title">電話:</span>
                                                                <input class="phone-number" type="tel" name="phone" value="${member.phone}">
                                                            </div>
                                                            <br>
                                                            <div class="address-content">
                                                                <span class="contact-title">地址:</span>
                                                                <input class="mail-address" type="text" name="address" value="${member.address}">
                                                            </div>
                                                            <br>
                                                            <div class="email-content">
                                                                <span class="contact-title">信箱:</span>
                                                                <input class="contact-email" type="email" name="email" value="${account.email}">
                                                            </div>
                                                             <div class="password-content">
                                                                <span class="contact-title">密碼:</span>
                                                                <input class="contact-email" type="text" name="pwd" value="${account.pwd}">
                                                            </div>
                                                            <br>
                                                        </div>

                                                        </div>
                                                    </div>
                                                </div>
                                       
                
                
                                

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
<!-- Calender -->
<script src="${contextRoot}/static/back/assets/js/lib/jquery-ui/jquery-ui.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/moment/moment.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/calendar/fullcalendar.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/calendar/fullcalendar-init.js"></script>

<!--  Flot Chart -->
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

<!--  Chartist -->
<script src="${contextRoot}/static/back/assets/js/lib/chartist/chartist.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/chartist/chartist-plugin-tooltip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/chartist/chartist-init.js"></script>

<!--  Chartjs -->
<script src="${contextRoot}/static/back/assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/chart-js/chartjs-init.js"></script>

<!--  Knob -->
<script src="${contextRoot}/static/back/assets/js/lib/knob/jquery.knob.min.js "></script>
<script src="${contextRoot}/static/back/assets/js/lib/knob/knob.init.js "></script>

<!--  Morris -->
<script src="${contextRoot}/static/back/assets/js/lib/morris-chart/raphael-min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/morris-chart/morris.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/morris-chart/morris-init.js"></script>

<!--  Peity -->
<script src="${contextRoot}/static/back/assets/js/lib/peitychart/jquery.peity.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/peitychart/peitychart.init.js"></script>

<!--  Sparkline -->
<script src="${contextRoot}/static/back/assets/js/lib/sparklinechart/jquery.sparkline.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/sparklinechart/sparkline.init.js"></script>

<!-- Select2 -->
<script src="${contextRoot}/static/back/assets/js/lib/select2/select2.full.min.js"></script>

<!--  Validation -->
<script src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate-init.js"></script>

<!--  Circle Progress -->
<script src="${contextRoot}/static/back/assets/js/lib/circle-progress/circle-progress.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/circle-progress/circle-progress-init.js"></script>

<!--  Vector Map -->
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.algeria.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.argentina.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.brazil.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.france.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.germany.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.greece.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.iran.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.iraq.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.russia.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.tunisia.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.europe.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/vector-map/country/jquery.vmap.usa.js"></script>

<!--  Simple Weather -->
<script src="${contextRoot}/static/back/assets/js/lib/weather/jquery.simpleWeather.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/weather/weather-init.js"></script>

<!--  Owl Carousel -->
<script src="${contextRoot}/static/back/assets/js/lib/owl-carousel/owl.carousel.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/owl-carousel/owl.carousel-init.js"></script>

<!--  Calender 2 -->
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/moment.latest.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/calendar-2/pignose.init.js"></script>


<!-- Datatable -->
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.dataTables.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.flash.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables-init.js"></script>

<!-- JS Grid -->
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/db.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.core.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.load-indicator.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.load-strategies.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.sort-strategies.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid.field.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.text.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.number.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.select.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.checkbox.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/fields/jsgrid.field.control.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/jsgrid/jsgrid-init.js"></script>

<!--  Datamap -->
<script src="${contextRoot}/static/back/assets/js/lib/datamap/d3.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/datamap/topojson.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/datamap/datamaps.world.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/datamap/datamap-init.js"></script>

<!--  Nestable -->
<script src="${contextRoot}/static/back/assets/js/lib/nestable/jquery.nestable.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/nestable/nestable.init.js"></script>

<!--ION Range Slider JS-->
<script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/ion.rangeSlider.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/moment.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/moment-with-locales.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/rangeSlider/rangeslider.init.js"></script>

<!-- Bar Rating-->
<script src="${contextRoot}/static/back/assets/js/lib/barRating/jquery.barrating.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/barRating/barRating.init.js"></script>

<!-- jRate -->
<script src="${contextRoot}/static/back/assets/js/lib/rating1/jRate.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/rating1/jRate.init.js"></script>

<!-- Sweet Alert -->
<script src="${contextRoot}/static/back/assets/js/lib/sweetalert/sweetalert.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/sweetalert/sweetalert.init.js"></script>

<!-- Toastr -->
<script src="${contextRoot}/static/back/assets/js/lib/toastr/toastr.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/toastr/toastr.init.js"></script>

<!--  Dashboard 1 -->
<script src="${contextRoot}/static/back/assets/js/dashboard1.js"></script>
<script src="${contextRoot}/static/back/assets/js/dashboard2.js"></script>

</body>

</html>
