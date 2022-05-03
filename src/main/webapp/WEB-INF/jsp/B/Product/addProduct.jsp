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

    <title>新增商品</title>

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
            <section id="main-content" id="edit">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="row">
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px">
                                    <p>圖片一(主圖)</p>
                                </div>
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px">
                                    <p>圖片二(副圖)</p>
                                </div>
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px">
                                    <p>圖片三</p>
                                </div>
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px">
                                    <p>圖片四</p>
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
                                <div class="basic-elements">
                                    <form>
                                        <div class="row">

                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <p>名稱</p>
                                                    <input type="text" class="form-control"
                                                           value="">
                                                </div>
                                                <div class="form-group">
                                                    <p>品牌</p>
                                                    <input type="text" class="form-control"
                                                           value="">
                                                </div>
                                                <div class="form-group">
                                                    <p>價格</p>
                                                    <input type="text" class="form-control"
                                                           value="">
                                                </div>
                                                <div class="form-group">
                                                    <p>種類</p>
                                                    <input type="text" class="form-control"
                                                           value=" ">
                                                </div>
                                                <div class="form-group">
                                                    <p>庫存</p>
                                                    <input type="text" class="form-control"
                                                           value="">
                                                </div>



                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <p>產品描述</p>
                                                    <textarea class="form-control" rows="5"
                                                              placeholder="請輸入商品詳細描述"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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
<script src="${contextRoot}/static/back/universal/js/EditProduct.js"></script>
<script>

    // imgur圖片上傳
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
        });
    })
    ;

</script>

</body>

</html>
