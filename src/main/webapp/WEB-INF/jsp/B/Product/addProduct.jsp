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

    <title>新增商品 - DESIGN & DECOR</title>

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
                            <div class="row">
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px" id="img01" class="img01">
                                    <p>圖片一(主圖)</p>
                                    <input type="file" name="image01" id="image01">
                                </div>
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px" id="img02">
                                    <p>圖片二(副圖)</p>
                                    <input type="file" name="image02" id="image02">
                                </div>
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px" id="img03">
                                    <p>圖片三</p>
                                    <input type="file" name="image03" id="image03">
                                </div>
                                <div class="col-lg-3">
                                    <img src="https://i.imgur.com/5tsTQt8.jpg" width="200px" id="img04">
                                    <p>圖片四</p>
                                    <input type="file" name="image01" id="image04">
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
                                                    <input type="text" class="form-control" name="name"
                                                           value="" id="inputName01">
                                                </div>
                                                <div class="form-group">
                                                    <p>品牌</p>
                                                    <input type="text" class="form-control" name="fkBrand" id="fkBrand"
                                                           value="" disabled>
                                                </div>
                                                <div class="form-group">
                                                    <p>價格</p>
                                                    <input type="text" class="form-control" name="price" id="price"
                                                           value="">
                                                </div>
                                                <div class="form-group">
                                                    <p>種類</p>
                                                    <input type="text" class="form-control" name="categories"
                                                           id="categories"
                                                           value=" ">
                                                </div>
                                                <div class="form-group">
                                                    <p>庫存</p>
                                                    <input type="text" class="form-control" name="stock" id="stock"
                                                           value="">
                                                </div>


                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <p>規格</p>
                                                    <input type="text" class="form-control" name="model" id="model"
                                                           value="">
                                                </div>

                                                <div class="form-group">
                                                    <p>產品描述</p>
                                                    <textarea rows="10" name="description" class="form-control"
                                                              style="height:100%" id="description"
                                                              placeholder="請輸入商品詳細描述"></textarea>
                                                </div>
                                                <div class="form-group">

                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="row">

                    <div class="col-lg-4">


                    </div>
                    <div class="col-lg-2">
                        <div>
                            <a id="savebtn" class="btn btn-warning">送出</a>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div>
                            <a id="onekey" class="btn btn-default">一鍵</a>
                        </div>
                    </div>
                    <div class="col-lg-4">


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
<script src="${contextRoot}/static/back/universal/js/AddProduct.js"></script>
<script>





</script>

</body>

</html>
