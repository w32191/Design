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

    <title>商品</title>

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
                    <input type="file" class="imgur" accept="image/*" data-max-size="5000"/>

                </div>
                <!-- /# row -->
                <div class="row">


<%--                    品牌--%>

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-title">
                                <h4>品牌 Brand </h4>

                            </div>
                            <div class="recent-comment m-t-15" id="bnd">








                            </div>
                        </div>
                        <!-- /# card -->
                    </div>


                    <!-- /# column -->
                    <div class="col-lg-8" id="productList" >
                        <div class="card">
                            <div class="card-title">
                                <h4 id="h4ProductTitle">產品清單</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="productListTable">
                                        <thead>
                                        <tr>

                                            <th>
                                                <button class="btn btn-primary" id="selectAllBtn">
                                                    全選
                                                </button>
                                                <button class="btn btn-primary" id="unSelectAllBtn"
                                                        hidden>取消全選
                                                </button>
                                            </th>
                                            <th>圖片</th>
                                            <th>名稱</th>
                                            <th>分類</th>
                                            <th>價格</th>
                                            <th>庫存</th>
                                        </tr>
                                        </thead>


<%--                                        點選品牌後商品顯示在這裡--%>
                                        <tbody id="productTbody">
                                        </tbody>





                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->

                </div>
            </section>

        </div>
    </div>
</div>

<%-- 折扣商品的品牌選單 --%>


<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.flash.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>

<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<%-- jquery & Ajax & JS 都在裏面--%>
<script src="${contextRoot}/static/back/universal/js/Product.js"></script>
<script>




    $("document").ready(function () {
        $('input[type=file]').on("change", function () {
            var $files = $(this).get(0).files;
            var formData = new FormData();
            formData.append("file", $files[0]);

            $.ajax({
                url: '/Design/F/Product/uploadImg',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (res) {
                    console.log(res);
                },
                error: function (err) {
                    console.log(err);
                }
            });


            // if ($files.length) {
            //     // Reject big files
            //     if ($files[0].size > $(this).data("max-size") * 1024) {
            //         console.log("Please select a smaller file");
            //         return false;
            //     }
            //     // Replace {{Your Client ID }} with your own API key
            //     let apiUrl = 'https://api.imgur.com/3/upload';
            //     let token = '860455aafdde853bf8c57ee1b2572c861115a0e1';
            //     let settings = {
            //         "timeout": 0,
            //         "processData": false,
            //         "contentType": false,
            //         "method": "POST",
            //         "url": "https://api.imgur.com/3/upload",
            //         "headers": {
            //             "Authorization": "Client-ID "  + token,
            //         },
            //         "mimeType": "multipart/form-data",
            //         "data": formData
            //     }
            //
            //
            //     $.ajax(settings).done(function (res) {
            //
            //         console.log(res);
            //         obj=JSON.parse(res)
            //
            //         // $('body').append('<img src="' + obj.data.link + '" />');
            //     });

        });
    })
    ;

</script>

</body>

</html>
