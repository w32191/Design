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
    <link href="${contextRoot}/static/back/assets/css/lib/data-table/dataTables.bootstrap.min.css"
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
                                <li class="breadcrumb-item active">App-Email</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="compose-email">
                                    <div class="mail-box">
                                        <aside class="sm-side">
                                            <div class="user-head">
                                                <a class="inbox-avatar" href="javascript:;">
                                                    <img src="${contextRoot}/static/back/assets/images/user.jpg"
                                                         alt="">
                                                </a>
                                                <div class="user-name">
                                                    <h5><a href="#">john doe</a></h5>
                                                    <span><a href="#">example@gmail.com</a></span>
                                                </div>
                                            </div>
                                            <div class="inbox-body text-center">
                                                <a href="#myModal" data-toggle="modal"
                                                   title="Compose" class="btn btn-compose">
                                                    Compose</a>
                                                <!-- Modal -->
                                                <div aria-hidden="true" role="dialog" tabindex="-1"
                                                     id="myModal" class="modal fade">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content text-left">
                                                            <div class="modal-header">
                                                                <button aria-hidden="true"
                                                                        data-dismiss="modal"
                                                                        class="close" type="button">
                                                                    <i class="ti-close"></i>
                                                                </button>
                                                                <h4 class="modal-title">Compose</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form class="form-horizontal">
                                                                    <div class="form-group">
                                                                        <label class="col-lg-2 control-label">To</label>
                                                                        <div class="col-lg-10">
                                                                            <input type="text"
                                                                                   placeholder=""
                                                                                   id="inputEmail1"
                                                                                   class="form-control">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-lg-2 control-label">Cc
                                                                            / Bcc</label>
                                                                        <div class="col-lg-10">
                                                                            <input type="text"
                                                                                   placeholder=""
                                                                                   id="cc"
                                                                                   class="form-control">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-lg-2 control-label">Subject</label>
                                                                        <div class="col-lg-10">
                                                                            <input type="text"
                                                                                   placeholder=""
                                                                                   id="inputPassword1"
                                                                                   class="form-control">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-lg-2 control-label">Message</label>
                                                                        <div class="col-lg-10">
                                                                            <textarea rows="10"
                                                                                      cols="30"
                                                                                      class="form-control"
                                                                                      id="texarea1"
                                                                                      name="texarea"></textarea>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="col-lg-offset-2 col-lg-10">
                                          <span class="btn green fileinput-button"><i
                                                  class="fa fa-plus fa fa-white"></i>
																	<span>Attachment</span>
                                          <input type="file" name="files[]" multiple="">
                                          </span>
                                                                            <button class="btn btn-primary"
                                                                                    type="submit">
                                                                                Send
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <!-- /.modal-content -->
                                                    </div>
                                                    <!-- /.modal-dialog -->
                                                </div>
                                                <!-- /.modal -->
                                            </div>
                                            <ul class="inbox-nav inbox-divider">
                                                <li class="breadcrumb-item active">
                                                    <a href="#"><i class="fa fa-inbox"></i> Inbox
                                                        <span class="badge badge-success pull-right m-t-12">2</span></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-envelope-o"></i>
                                                        Sent Mail</a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-bookmark-o"></i>
                                                        Important</a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class=" fa fa-external-link"></i>
                                                        Drafts <span
                                                                class="badge badge-info pull-right m-t-12">30</span></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class=" fa fa-trash-o"></i> Trash</a>
                                                </li>
                                            </ul>


                                            <div class="inbox-body text-center">
                                                <div class="btn-group">
                                                    <a class="btn mini btn-primary"
                                                       href="javascript:;">
                                                        <i class="fa fa-plus"></i>
                                                    </a>
                                                </div>
                                                <div class="btn-group">
                                                    <a class="btn mini btn-success"
                                                       href="javascript:;">
                                                        <i class="fa fa-phone"></i>
                                                    </a>
                                                </div>
                                                <div class="btn-group">
                                                    <a class="btn mini btn-info"
                                                       href="javascript:;">
                                                        <i class="fa fa-cog"></i>
                                                    </a>
                                                </div>
                                            </div>

                                        </aside>
                                        <aside class="lg-side">
                                            <div class="inbox-head">
                                                <h3 class="input-text">Inbox</h3>
                                                <form action="#" class="pull-right position">
                                                    <div class="input-append inner-append">
                                                        <input type="text" class="sr-input"
                                                               placeholder="Search Mail">
                                                        <button class="btn sr-btn append-btn"
                                                                type="button"><i
                                                                class="fa fa-search"></i></button>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="mail-option">
                                                <div class="chk-all chk-group">
                                                    <input type="checkbox"
                                                           class="mail-checkbox mail-group-checkbox"
                                                           id="checkAll"/>
                                                    <div class="btn-group">
                                                        <a data-toggle="dropdown" href="#"
                                                           class="btn mini all m-l-10"
                                                           aria-expanded="false">All<i
                                                                class="fa fa-angle-down "></i></a>
                                                        <ul class="card-option-dropdown dropdown-menu">
                                                            <li><a href="#"> None</a></li>
                                                            <li><a href="#"> Read</a></li>
                                                            <li><a href="#"> Unread</a></li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="btn-group">
                                                    <a data-original-title="Refresh"
                                                       data-placement="top" data-toggle="dropdown"
                                                       href="#" class="btn mini tooltips">
                                                        <i class=" fa fa-refresh"></i>
                                                    </a>
                                                </div>
                                                <div class="btn-group hidden-phone">
                                                    <a data-toggle="dropdown" href="#"
                                                       class="btn mini blue" aria-expanded="false">
                                                        More<i class="fa fa-angle-down "></i></a>

                                                    <ul class="card-option-dropdown dropdown-menu">
                                                        <li><a href="#"><i class="ti-pencil"></i>
                                                            Mark as Read</a></li>
                                                        <li><a href="#"><i class="ti-menu-alt"></i>Spam</a>
                                                        </li>
                                                        <li><a href="#"><i class="ti-trash"></i>Delete</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="btn-group">
                                                    <a data-toggle="dropdown" href="#"
                                                       class="btn mini blue">Move to<i
                                                            class="fa fa-angle-down "></i></a>
                                                    <ul class="card-option-dropdown dropdown-menu">
                                                        <li><a href="#">Draft</a></li>
                                                        <li><a href="#">Spam</a></li>
                                                        <li><a href="#"> Delete</a></li>
                                                    </ul>
                                                </div>

                                                <ul class="unstyled inbox-pagination pagination-list">
                                                    <li><span>1-50 of 234</span></li>
                                                    <li>
                                                        <a class="np-btn" href="#"><i
                                                                class="fa fa-angle-left  pagination-left"></i></a>
                                                    </li>
                                                    <li>
                                                        <a class="np-btn" href="#"><i
                                                                class="fa fa-angle-right pagination-right"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-inbox table-hover table-responsive">
                                                    <tbody>
                                                    <tr class="unread">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message  dont-show">
                                                            PHPClass
                                                        </td>
                                                        <td class="view-message ">Added a new class:
                                                            Login Class Fast Site
                                                        </td>
                                                        <td class="view-message  inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message  text-right">9:27
                                                            AM
                                                        </td>
                                                    </tr>
                                                    <tr class="unread">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">Google
                                                            Webmaster
                                                        </td>
                                                        <td class="view-message">Improve the search
                                                            presence of WebSite
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">March
                                                            15
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">JW
                                                            Player
                                                        </td>
                                                        <td class="view-message">Last Chance:
                                                            Upgrade to Pro for
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">March
                                                            15
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">Tim Reid,
                                                            S P N
                                                        </td>
                                                        <td class="view-message">Boost Your Website
                                                            Traffic
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">April
                                                            01
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star inbox-started"></i>
                                                        </td>
                                                        <td class="view-message dont-show">
                                                            Freelancer.com <span
                                                                class="badge badge-danger pull-right m-t-6">urgent</span>
                                                        </td>
                                                        <td class="view-message">Stop wasting your
                                                            visitors
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">May 23
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star inbox-started"></i>
                                                        </td>
                                                        <td class="view-message dont-show">WOW
                                                            Slider
                                                        </td>
                                                        <td class="view-message">New WOW Slider v7.8
                                                            - 67% off
                                                        </td>
                                                        <td class="view-message inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message text-right">March
                                                            14
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star inbox-started"></i>
                                                        </td>
                                                        <td class="view-message dont-show">LinkedIn
                                                            Pulse
                                                        </td>
                                                        <td class="view-message">The One Sign Your
                                                            Co-Worker Will Stab
                                                        </td>
                                                        <td class="view-message inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message text-right">Feb 19
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">Drupal
                                                            Community<span
                                                                    class="badge badge-success pull-right m-t-6">megazine</span>
                                                        </td>
                                                        <td class="view-message view-message">
                                                            Welcome to the Drupal Community
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">March
                                                            04
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">
                                                            Facebook
                                                        </td>
                                                        <td class="view-message view-message">
                                                            Somebody requested a new password
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">June
                                                            13
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">Skype
                                                            <span class="badge badge-info pull-right m-t-6">family</span>
                                                        </td>
                                                        <td class="view-message view-message">
                                                            Password successfully changed
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">March
                                                            24
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star inbox-started"></i>
                                                        </td>
                                                        <td class="view-message dont-show">Google+
                                                        </td>
                                                        <td class="view-message">alireza, do you
                                                            know
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">March
                                                            09
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star inbox-started"></i>
                                                        </td>
                                                        <td class="dont-show">Zoosk</td>
                                                        <td class="view-message">7 new singles we
                                                            think you'll like
                                                        </td>
                                                        <td class="view-message inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message text-right">May 14
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">
                                                            LinkedIn
                                                        </td>
                                                        <td class="view-message">Alireza: Nokia
                                                            Networks, System Group and
                                                        </td>
                                                        <td class="view-message inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message text-right">February
                                                            25
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="dont-show">Facebook</td>
                                                        <td class="view-message view-message">Your
                                                            account was recently logged into
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">March
                                                            14
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">Twitter
                                                        </td>
                                                        <td class="view-message">Your Twitter
                                                            password has been changed
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">April
                                                            07
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">
                                                            InternetSeer Website Monitoring
                                                        </td>
                                                        <td class="view-message">
                                                            http://golddesigner.org/ Performance
                                                            Report
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">July
                                                            14
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star inbox-started"></i>
                                                        </td>
                                                        <td class="view-message dont-show">
                                                            AddMe.com
                                                        </td>
                                                        <td class="view-message">Submit Your Website
                                                            to the AddMe Business Directory
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">August
                                                            10
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">Terri
                                                            Rexer, S P N
                                                        </td>
                                                        <td class="view-message view-message">Forget
                                                            Google AdWords: Un-Limited Clicks fo
                                                        </td>
                                                        <td class="view-message inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message text-right">April
                                                            14
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">Bertina
                                                        </td>
                                                        <td class="view-message">IMPORTANT: Don't
                                                            lose your domains!
                                                        </td>
                                                        <td class="view-message inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message text-right">June
                                                            16
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star inbox-started"></i>
                                                        </td>
                                                        <td class="view-message dont-show">Laura
                                                            Gaffin, S P N
                                                        </td>
                                                        <td class="view-message">Your Website On
                                                            Google (Higher Rankings Are Better)
                                                        </td>
                                                        <td class="view-message inbox-small-cells"></td>
                                                        <td class="view-message text-right">August
                                                            10
                                                        </td>
                                                    </tr>
                                                    <tr class="">
                                                        <td class="inbox-small-cells">
                                                            <input type="checkbox"
                                                                   class="mail-checkbox">
                                                        </td>
                                                        <td class="inbox-small-cells"><i
                                                                class="ti-star"></i></td>
                                                        <td class="view-message dont-show">
                                                            Facebook
                                                        </td>
                                                        <td class="view-message view-message">john
                                                            doe Login faild
                                                        </td>
                                                        <td class="view-message inbox-small-cells">
                                                            <i class="fa fa-paperclip"></i></td>
                                                        <td class="view-message text-right">feb 14
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </aside>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer -->
                <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>
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
