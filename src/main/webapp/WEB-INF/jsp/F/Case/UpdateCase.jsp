<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Outstock - Clean, Minimal eCommerce HTML5 Template </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--  CSS include page--%>
    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp"/>
    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
</head>
<body>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>
    <!-- page title area start -->
    <section class="page__title p-relative d-flex align-items-center" data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="page__title-inner text-center">
                        <h1>Your Cart</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> Cart</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- page title area end -->

    <!-- Cart Area Strat-->
    <section class="cart-area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg">
                    <form action="#">
                        <div class="table-content table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="product-thumbnail">標題</th>
                                    <th class="cart-product-name">名字</th>
                                    <th class="product-price">工程類別</th>
                                    <th class="product-quantity">所在地區</th>
                                    <th class="product-subtotal">E-mail</th>
                                    <th class="product-remove">資訊</th>
                                    <th class="product-remove">照片</th>
                                    <th class="product-remove">結案時間</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <input id="casetitle" type="text"/>
                                    </td>
                                    <td><input id="caseName" type="text"/></td>
                                    <td><select id="classification"></select></td>
                                    <td><select id="location"></select></td>
                                    <td><input id="Email" type="email"></td>
                                    <td>
                                        <textarea name="message" id="message" class="form-control" rows="3"
                                                  placeholder="Text input" style="width: 300px"></textarea>
                                    </td>
                                    <td class="product-thumbnail" id="imgDiv">
                                        <input type="file" id="insertFile" class="imgur" accept="image/*" data-max-size="5000"/>
                                        <img src="" id="insertCoverPhoto" width="200"/>
                                    </td>
<%--                                    <td class="product-thumbnail"><a href="product-details.html"><img src="${contextRoot}/static/front/assets/img/shop/product/product-2.jpg" alt=""></a></td>--%>
                                    <td><input id="stopCaseTime" type="date"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                    <div class="coupon2">
                                        <button  id ="addCaseBtn" class="os-btn os-btn-black" style="margin-top: 25px" name="add_case" type="submit">新增案件</button>
                                    </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Cart Area End-->
</main>

<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/static/front/universal/Case.js"></script>

</body>

</html>
