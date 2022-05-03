<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: JS Grid Table</title>


    <!-- Styles -->
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>

    <link href="${contextRoot}/static/back/assets/css/lib/jsgrid/jsgrid-theme.min.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/assets/css/lib/jsgrid/jsgrid.min.css" type="text/css"
          rel="stylesheet"/>
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
                                <li class="breadcrumb-item active">Table-Jsgrid</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <div id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="jsgrid-table-panel">
                                <div id="jsGrid" class="jsgrid" style="position: relative; height: 100%; width: 100%;">
                                   <div class="jsgrid-grid-header">
                                       <table class="jsgrid-table">
                                           <tr class="jsgrid-header-row">
                                               <th class="jsgrid-header-cell jsgrid-header-sortable" style="width: 150px;">Name</th>
                                               <th class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable" style="width: 50px;">Age</th>
                                               <th class="jsgrid-header-cell jsgrid-header-sortable" style="width: 200px;">Address</th>
                                               <th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable jsgrid-header-sort jsgrid-header-sort-asc" style="width: 100px;">Country</th>
                                               <th class="jsgrid-header-cell jsgrid-align-center" style="width: 100px;">Is Married</th>
                                               <th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center" style="width: 50px;"><span class="jsgrid-button jsgrid-mode-button jsgrid-insert-mode-button ti-plus" type="button" title=""></span></th>
                                           </tr>
                                           <tr class="jsgrid-filter-row" style="display: none;">
                                               <td class="jsgrid-cell" style="width: 150px;"><input type="text"></td>
                                               <td class="jsgrid-cell jsgrid-align-right" style="width: 50px;">
                                                   <input type="number">
                                               </td>
                                               <td class="jsgrid-cell" style="width: 200px;">
                                                   <input type="text">
                                               </td>
                                               <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">
                                                   <select><option value="0"></option>
                                                           <option value="1">United States</option>
                                                           <option value="2">Canada</option>
                                                           <option value="3">United Kingdom</option>
                                                           <option value="4">France</option>
                                                           <option value="5">Brazil</option>
                                                           <option value="6">China</option>
                                                           <option value="7">Russia</option></select>
                                                </td>
                                                <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">
                                                    <input type="checkbox" readonly="">
                                                </td>
                                                <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center" style="width: 50px;">
                                                     <span class="jsgrid-button jsgrid-search-button ti-search" type="button" title="Search"></span>
                                                     <span class="jsgrid-button jsgrid-clear-filter-button" type="button" title="Clear filter"></span>
                                                </td>
                                            </tr>
                                            </table>
                                    </div>
                                    <div class="jsgrid-grid-body" style="height: 541px;">
                                        <table class="jsgrid-table">
                                            <tbody>
                                                <tr class="jsgrid-row">
                                                    <td class="jsgrid-cell" style="width: 150px;">Timothy Henson</td>
                                                    <td class="jsgrid-cell jsgrid-align-right" style="width: 50px;">78</td>
                                                    <td class="jsgrid-cell" style="width: 200px;">911-5143 Luctus Ave</td>
                                                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">United States</td>
                                                    <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">
                                                        <input type="checkbox" disabled="">
                                                    </td>
                                                    <td class="jsgrid-cell jsgrid-control-field jsgrid-align-center" style="width: 50px;">
                                                        <span class="jsgrid-button jsgrid-edit-button ti-pencil" type="button" title="Edit"></span>
                                                        <span class="jsgrid-button jsgrid-delete-button ti-trash" type="button" title="Delete"></span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="jsgrid-pager-container" style="">
                                        <div class="jsgrid-pager">Pages:
                                            <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a href="javascript:void(0);">First</a></span> 
                                            <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a href="javascript:void(0);">Prev</a></span> 
                                            <span class="jsgrid-pager-page jsgrid-pager-current-page">1</span>
                                            <span class="jsgrid-pager-page"><a href="javascript:void(0);">2</a></span>
                                            <span class="jsgrid-pager-page"><a href="javascript:void(0);">3</a></span>
                                            <span class="jsgrid-pager-page"><a href="javascript:void(0);">4</a></span>
                                            <span class="jsgrid-pager-page"><a href="javascript:void(0);">5</a></span>
                                            <span class="jsgrid-pager-nav-button"><a href="javascript:void(0);">...</a></span> 
                                            <span class="jsgrid-pager-nav-button"><a href="javascript:void(0);">Next</a></span> 
                                            <span class="jsgrid-pager-nav-button"><a href="javascript:void(0);">Last</a></span> 
                                            &nbsp;&nbsp; 1 of 7 
                                        </div>
                                    </div>
                                    <div class="jsgrid-load-shader" style="display: none; position: absolute; inset: 0px; z-index: 1000;"></div>
                                    <div class="jsgrid-load-panel" style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">Please, wait...</div>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <!-- Footer -->
                <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>
            </div>
        </div>
    </div>
</div>


<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>

<!-- JS Grid Scripts Start-->
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
<!-- JS Grid Scripts End-->


</body>

</html>
