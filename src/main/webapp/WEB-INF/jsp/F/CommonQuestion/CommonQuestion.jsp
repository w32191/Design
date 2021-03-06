<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>常見問題 - DESIGN & DECOR</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--  CSS include page--%>
    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp"/>
</head>
<body>
<%--Header Page--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>

    <!-- page title area start -->
    <section class="page__title p-relative d-flex align-items-center"
             data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="page__title-inner text-center">
                        <h1>常見問題</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        常見問題
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



    <!-- common_question area start -->
    <section class="shop__area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="shop__content-area">
                        
                        <div class="sidebar__widget-content">
                            <div class="categories">
                                <div id="accordion">
                                    
                                    <c:forEach items="${cqs}" var="cq">
                                        <div class="card">
                                            <div class="card-header white-bg" id="test${cq.id}">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed" data-toggle="collapse" data-target="#collapsetest${cq.id}" aria-expanded="false" aria-controls="collapsetest${cq.id}">
                                                        /${cq.question}
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapsetest${cq.id}" class="collapse" aria-labelledby="test${cq.id}" data-parent="#accordion">
                                                <div class="card-body">
                                                    <div class="categories__list">
                                                        <ul>
                                                            <li style="background-color:#bc8246;color:white">${cq.answer}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>



                                    
                                </div>
                            </div>
                        </div>


                    
                    
                    
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- common_question area end -->


    <!-- Cart Area Strat-->
    <!-- <section class="cart-area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#">
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
                                <tr>
                                    <td class="product-thumbnail"><a
                                            href="product-details.html"><img
                                            src="${contextRoot}/static/front/assets/img/shop/product/product-1.jpg" alt=""></a>
                                    </td>
                                    <td class="product-name"><a href="product-details.html">Bakix
                                        Furniture</a></td>
                                    <td class="product-price"><span class="amount">$130.00</span>
                                    </td>
                                    <td class="product-quantity">
                                        <button class="os-btn os-btn-black" type="submit">Add TO
                                            Cart
                                        </button>
                                    </td>
                                    <td class="product-subtotal"><span class="amount">$130.00</span>
                                    </td>
                                    <td class="product-remove"><a href="#"><i
                                            class="fa fa-times"></i></a></td>
                                </tr>
                                <tr>
                                    <td class="product-thumbnail"><a
                                            href="product-details.html"><img
                                            src="${contextRoot}/static/front/assets/img/shop/product/product-10.jpg" alt=""></a>
                                    </td>
                                    <td class="product-name"><a href="product-details.html">Sujon
                                        Chair Set</a></td>
                                    <td class="product-price"><span class="amount">$120.50</span>
                                    </td>
                                    <td class="product-quantity">
                                        <button class="os-btn os-btn-black" type="submit">Add TO
                                            Cart
                                        </button>
                                    </td>
                                    <td class="product-subtotal"><span class="amount">$120.50</span>
                                    </td>
                                    <td class="product-remove"><a href="#"><i
                                            class="fa fa-times"></i></a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Cart Area End -->
</main>


<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
</body>

</html>
