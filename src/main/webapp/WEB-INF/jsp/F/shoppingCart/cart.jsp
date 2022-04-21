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
                <div class="col-12">
                    <form action="editshoppingcart" method="post">
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
                                <tbody>
                                
                               <c:forEach var="cart" items="${cart}">
                               <div>${cart.fkProduct.image001}</div>
                                <tr>
                                	<input type="hidden" value="${cart.id}" name="cartid"/>
                                    <td class="product-thumbnail"><a href="product-details.html"><img src="data:image/jpeg;base64,${cart.fkProduct.image001}" alt=""></a></td>
                                    <td class="product-name"><a href="product-details.html">${cart.fkProduct.name}</a></td>
                                    <td class="product-price"><span class="price" id="price">$${cart.fkProduct.price}</span></td>
                                    <td class="product-quantity">
                                        <div class="cart-plus-minus"><input type="text" class="amount" value="${cart.tempMount}" name="uamount"/></div>
                                    </td>
                                    <td class="product-subtotal"><span class="tprice" id="tprice"></span></td>
                                    <td class="product-remove"><a href="deleteshoppingcart?id=${cart.id}"><i class="fa fa-times"></i></a></td>
                                </tr>
                               </c:forEach>
                               
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="coupon-all">
                                    <div class="coupon">
                                        <input id="coupon_code" class="input-text" name="coupon_code" value=""
                                               placeholder="Coupon code" type="text">
                                        <button class="os-btn os-btn-black" name="apply_coupon" type="submit">Apply
                                            coupon</button>
                                    </div>
                                    <div class="coupon2">
                                        <button class="os-btn os-btn-black" name="update_cart" type="submit">Update cart</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                        <div class="row">
                            <div class="col-md-5 ml-auto">
                                <div class="cart-page-total">
                                    <h2>Cart totals</h2>
                                    <ul class="mb-20">
                                        <li>Subtotal <span>$250.00</span></li>
                                        <li>Total <span>$250.00</span></li>
                                    </ul>
                                    <a class="os-btn" href="checkout.html">Proceed to checkout</a>
                                </div>
                            </div>
                        </div>
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

<script>
        /* $(document).ready(function(){
           
           let ProductRow=$(".amount").closest("tr"); //找到目前數量所屬tr
            console.log(ProductRow);
            let qty=$(".amount").val();  //數量
            let price=ProductRow.find(".price").text();  //單價
            console.log(qty,price);
            let s_price=price*qty; //金額
            ProductRow.find(".tprice").text(s_price); //小計
    
        }); */
        
        $(".amount").on("change keyup", function(){
            console.log(this);
            let ProductRow=$(this).closest("tr"); //找到目前數量所屬tr
             console.log(ProductRow);
             let qty=$(this).val();  //數量
             let price=ProductRow.find(".price").text();  //單價
             console.log(qty,price);
             let s_price=price*qty; //金額
             let total=0;
             ProductRow.find(".tprice").text(s_price);

             console.log($(".tprice"));

             
         });
</script>

</body>

</html>
