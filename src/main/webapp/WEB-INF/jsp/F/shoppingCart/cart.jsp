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

    <%-- CSS include page--%>
    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp"/>

</head>

<body>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>
    <!-- page title area start -->
    <section class="page__title p-relative d-flex align-items-center"
             data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="page__title-inner text-center">
                        <h1>Your Cart</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> Cart
                                    </li>
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
                <div class="col-12">
                    <form action="checkoutorderlist" method="POST">
                        <div class="table-content table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="product-thumbnail">Images</th>
                                    <th class="cart-product-name">Product</th>
                                    <th class="product-price">Unit Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                                </thead>
                                <tbody id="theTBody">

                                <c:forEach var="cart" items="${cartList}">
                                    <tr>
                                        <td class="product-thumbnail">
                                                <%--   <a href="product-details.html"--%>
                                                <%--   data-product-id="${cart.fkProduct.id}">--%>
                                                <%--   <img src="${cart.fkProduct.image01}">--%>
                                                <%--   </a>--%>
                                            <div class="product__modal-img product__thumb w-img">
                                                <a href="product-details.html"
                                                   data-product-id="${cart.fkProduct.id}">
                                                    <img src="${cart.fkProduct.image01}"
                                                         style="border: 1px #0c0c0c solid"
                                                         alt="圖片異常">
                                                </a>
                                                <c:if test='${discountMap.containsKey(cart.fkProduct.id)}'>
                                                    <div class="product__sale ">
                                                        <span class="new">活動</span>
                                                        <span class="percent">-${discountMap.get(cart.fkProduct.id)}%</span>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </td>

                                        <td class="product-name" name="pname">
                                            <a href="product-details.html">${cart.fkProduct.name}</a>
                                        </td>


                                        <td class="product-price product__price-2">
                                            <c:choose>
                                                <c:when test='${discountMap.containsKey(cart.fkProduct.id)}'>
                                                    $<span
                                                    class="price currentPrice">${(cart.fkProduct.price*(100-discountMap.get(cart.fkProduct.id))/100).intValue()}</span>
                                                    <br>
                                                    <span class="old-price">$${cart.fkProduct.price}</span>
                                                    <br>
                                                    <span class="text-danger">限時活動:</span>
                                                    <br>
                                                    <span class="text-danger">${discountMap.get(cart.fkProduct.id)}% OFF</span>
                                                </c:when>
                                                <c:otherwise>
                                                    $<span
                                                    class="price currentPrice">${cart.fkProduct.price}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="product-quantity">
                                            <div class="cart-plus-minus">
                                                <input type="text" class="amount"
                                                       value="${cart.tempMount}" name="uamount"/>
                                            </div>
                                        </td>

                                        <td class="product-subtotal">
                                            <c:choose>
                                                <c:when test='${discountMap.containsKey(cart.fkProduct.id)}'>
                                                    $<span id="tprice"
                                                    name="tprice">${(cart.fkProduct.price*(100-discountMap.get(cart.fkProduct.id))/100*cart.tempMount).intValue()}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    $<span id="tprice"
                                                    name="tprice">${cart.fkProduct.price*cart.tempMount}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="product-remove">
                                            <!-- <a href="deleteshoppingcart?id=${cart.id}"> -->
                                            <i class="fa fa-times"></i>
                                            <!--  </a> -->
                                        </td>

                                        <td class="product-cartid" hidden="">
                                            <input type="hidden" id="cartid" class="cartid"
                                                   value="${cart.id}" name="cartid"/>
                                        </td>

                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="coupon-all">
                                    <div class="coupon">
                                        <input id="coupon_code" class="input-text"
                                               name="coupon_code" value="" placeholder="Coupon code"
                                               type="text">
                                        <button class="os-btn os-btn-black" id="submit"
                                                name="apply_coupon" type="submit">Apply coupon
                                        </button>
                                    </div>
                                    <!-- <div class="coupon2">
                                    <button class="os-btn os-btn-black" name="update_cart" type="submit">Update
                                        cart</button>
                                </div> -->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div style="margin-top: 10px; margin-left: 20px; color: brown;">
                                <span class="text-danger" id="couponContext"></span>
                            </div>
                            <div class="col-md-5 ml-auto">
                                <div class="cart-page-total">
                                    <h2>Cart totals</h2>
                                    <ul class="mb-20">
                                        <li>Subtotal <span id="subtotal"></span></li>
                                        <li>Discount <span><input
                                                style="border: none; outline: none; text-align: right; color: #6F7172;"
                                                type="text" id="discount" name="discount"
                                                value="$0"></span></li>
                                        <li>Total <span id="total"></span></li>
                                    </ul>
                                    <button class="os-btn" type="submit">Proceed to checkout
                                    </button>
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


<script src="${contextRoot}/static/front/universal/ShoppingCart.js"></script>
</body>

</html>
