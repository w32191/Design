<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>庫存管理</title>

    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>
    <link href="${contextRoot}/static/back/universal/css/EditActivity.css" rel="stylesheet"/>
</head>

<body>

<%--Left SideBar--%>
<jsp:include page="../IncludePage/layoutPage/leftSidebarPage.jsp"/>

<%--Header--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title pr">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <h4>產品 Product</h4>
                                    </div>
                                    <div class="col-lg-3" id="addbtn">
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table class="table student-data-table ">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th></th>
                                                    <th>廠商名稱</th>
                                                    <th>缺貨品項</th>
                                                    <th>聯絡</th>
                                                </tr>
                                                </thead>
                                                <tbody id=bdlist>


                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="table-responsive">
                                            <table class="table student-data-table ">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>圖片</th>
                                                    <th>產品名稱</th>
                                                    <th>庫存</th>
                                                    <th>缺少數量</th>
                                                </tr>
                                                </thead>
                                                <tbody id="plist">



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

        </div>
    </div>
</div>

<%-- 折扣商品的品牌選單 --%>


<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.flash.min.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>--%>
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>--%>

<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<%-- jquery & Ajax & JS 都在裏面--%>
<script src="${contextRoot}/static/back/universal/js/StockManage.js"></script>
<script>


</script>

</body>

</html>
