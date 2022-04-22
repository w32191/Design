<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-title">
                                            <h4>Table Basic </h4>

                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <th><a href="${contextRoot}/B/Case/CaseMessage">#</a></th>
                                                        <th>標題</th>
                                                        <th><select style="appearance: none ; border:none " id="classificationData" class="btn-group"></select></th>
                                                        <th><select style="appearance: none ; border:none " id="locationData" class="btn-group"></select></th>
                                                        <th>E-mail</th>
                                                        <th>資訊</th>
                                                        <th>
                                                            <a href="${contextRoot}/B/Case/CaseMessagedatetimeDesc">創建時間</a>
                                                        </th>
                                                        <th>結束時間</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="caseMessage" items="${findAll}">
                                                        <tr>
                                                            <th>${caseMessage.id}</th>
                                                            <td>${caseMessage.title}</td>
                                                            <td>${caseMessage.classification}</td>
                                                            <td>${caseMessage.location}</td>
                                                            <td>${caseMessage.caseEmail}</td>
                                                            <td>${caseMessage.message}</td>
                                                            <td><fmt:formatDate pattern="yyyyMMdd"
                                                                                value="${caseMessage.dateTime}"/>
                                                            </td>
                                                            <td><fmt:formatDate pattern="yyyyMMdd"
                                                                                value="${caseMessage.expiryDate}"/>
                                                            </td>


                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
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
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/db.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/jsgrid.core.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/jsgrid.load-indicator.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/jsgrid.load-strategies.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/jsgrid.sort-strategies.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/jsgrid.field.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/fields/jsgrid.field.text.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/fields/jsgrid.field.number.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/fields/jsgrid.field.select.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/fields/jsgrid.field.checkbox.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/fields/jsgrid.field.control.js"></script>
<script src="${contextRoot}/static/back/universal/BacksideCaseMessagePage/jsgrid/jsgrid-init.js"></script>
<!-- JS Grid Scripts End-->
<script src="${contextRoot}/static/back/universal/taiwan_districts.js"></script>
<script src="${contextRoot}/static/back/universal/Case.js"></script>
<script>
    //1.
    // v
    //2.


    function ajax_get() {
        $.ajax({
            type: "GET",
            url: "taiwan_districts.json",
            dataType: "json",

            success: function (data) {
                var html;
                $.each(data, function (key, Info) {
                    var name = Info['name'];
                    html += '<option>' + name + '</option>';
                });
                $('.location').html(data);
            },
            error: function () {
                console.log("沒有拿到地區資料");
            }
        })
    }


</script>
<%--<script>--%>
<%--    console.log(Taiwan_districts);--%>
<%--</script>--%>

</body>

</html>
