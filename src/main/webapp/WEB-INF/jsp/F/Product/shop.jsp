<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DESIGN & DECOR</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
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
                        <h1>DECOR</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="/Design/F/Activity/index">首頁</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> Shop
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
    <%--    <section class="client__area pt-15 pb-140">--%>
    <%--        <div class="container">--%>
    <%--            <div class="row">--%>
    <%--                <div class="col-xl-12">--%>
    <%--                    <div class="client__slider owl-carousel text-center">--%>
    <%--                        <div class="client__thumb">--%>
    <%--                            <a href="/Design/F/product/productbybrand?brand=6"><img--%>
    <%--                                    src="https://i.imgur.com/dftzIxn.jpg"--%>
    <%--                                    alt="client"></a>--%>
    <%--                        </div>--%>
    <%--                        <div class="client__thumb">--%>
    <%--                            <a href="/Design/F/product/productbybrand?brand=15"><img--%>
    <%--                                    src="https://i.imgur.com/Aw91g70.jpg"--%>
    <%--                                    alt="client"></a>--%>
    <%--                        </div>--%>
    <%--                        <div class="client__thumb">--%>
    <%--                            <a href="/Design/F/product/productbybrand?brand=24"><img--%>
    <%--                                    src="https://i.imgur.com/P3jjoZj.jpg"--%>
    <%--                                    alt="client"></a>--%>
    <%--                        </div>--%>
    <%--                        <div class="client__thumb">--%>
    <%--                            <a href="/Design/F/product/productbybrand?brand=4"><img--%>
    <%--                                    src="https://i.imgur.com/jkzjZA2.jpg"--%>
    <%--                                    alt="client"></a>--%>
    <%--                        </div>--%>
    <%--                        <div class="client__thumb">--%>
    <%--                            <a href="/Design/F/product/productbybrand?brand=11"><img--%>
    <%--                                    src="https://i.imgur.com/jAgPxzR.jpg"--%>
    <%--                                    alt="client"></a>--%>
    <%--                        </div>--%>
    <%--                        <div class="client__thumb">--%>
    <%--                            <a href="/Design/F/product/productbybrand?brand=9"><img--%>
    <%--                                    src="https://i.imgur.com/8eclJGq.jpg"--%>
    <%--                                    alt="client"></a>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </section>--%>
    <!-- shop area start -->
    <section class="shop__area pt-100 pb-100">
        <div class="container">
            <%--            中間品牌廣告導覽             --%>
            <div class="row">
                <div class="col-xl-12">
                    <div class="client__slider owl-carousel text-center">
                        <div class="client__thumb">
                            <a href="/Design/F/product/productbybrand?brand=6"><img
                                    src="https://i.imgur.com/dftzIxn.jpg"
                                    alt="client"></a>
                        </div>
                        <div class="client__thumb">
                            <a href="/Design/F/product/productbybrand?brand=15"><img
                                    src="https://i.imgur.com/Aw91g70.jpg"
                                    alt="client"></a>
                        </div>
                        <div class="client__thumb">
                            <a href="/Design/F/product/productbybrand?brand=24"><img
                                    src="https://i.imgur.com/P3jjoZj.jpg"
                                    alt="client"></a>
                        </div>
                        <div class="client__thumb">
                            <a href="/Design/F/product/productbybrand?brand=4"><img
                                    src="https://i.imgur.com/jkzjZA2.jpg"
                                    alt="client"></a>
                        </div>
                        <div class="client__thumb">
                            <a href="/Design/F/product/productbybrand?brand=11"><img
                                    src="https://i.imgur.com/jAgPxzR.jpg"
                                    alt="client"></a>
                        </div>
                        <div class="client__thumb">
                            <a href="/Design/F/product/productbybrand?brand=9"><img
                                    src="https://i.imgur.com/8eclJGq.jpg"
                                    alt="client"></a>
                        </div>
                    </div><br><br><br>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-4">
                    <jsp:include page="../IncludePage/layoutPage/productLeftSideBar.jsp"/>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-8">
                    <div class="shop__content-area">

                        <div class="shop__header d-sm-flex justify-content-between align-items-center mb-40">
                            <div class="shop__header-left">
                                <div class="show-text">
                                    <span>Showing 1–20 of 20 results</span>
                                </div>
                            </div>
                            <div class="shop__header-right d-flex align-items-center justify-content-between justify-content-sm-end">
                                <div class="sort-wrapper mr-30 pr-25 p-relative">
                                    <select id="s1">
                                        <option value="1">商品排序</option>
                                        <option value="2">價格高至低</option>
                                        <option value="3">價格低至高</option>
                                        <option value="4">日期新至舊</option>
                                        <option value="5">日期舊至新</option>
                                    </select>
                                </div>
                                <ul class="nav nav-pills" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-grid-tab"
                                           data-toggle="pill" href="#pills-grid" role="tab"
                                           aria-controls="pills-grid" aria-selected="true"><i
                                                class="fas fa-th"></i></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-list-tab" data-toggle="pill"
                                           href="#pills-list" role="tab" aria-controls="pills-list"
                                           aria-selected="false"><i class="fas fa-list-ul"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-grid" role="tabpanel"
                                 aria-labelledby="pills-grid-tab">
                                <div class="row custom-row-10" id="pro">


                                    <%-- 一個商品--%>


                                </div>


                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-list" role="tabpanel"
                             aria-labelledby="pills-list-tab">
                            <div class="product__wrapper mb-40">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-4">
                                        <div class="product__thumb">
                                            <a href="product-details.html" class="w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-1.jpg"
                                                     alt="product-img">
                                                <img class="product__thumb-2"
                                                     src="${contextRoot}/static/front/assets/img/shop/product/product-10.jpg"
                                                     alt="product-img">
                                            </a>
                                            <div class="product__sale ">
                                                <span class="new">new</span>
                                                <span class="percent">-16%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8">
                                        <div class="product__content p-relative">
                                            <div class="product__content-inner list">
                                                <h4><a href="product-details.html">Wooden
                                                    container Bowl</a></h4>
                                                <div class="product__price-2 mb-10">
                                                    <span>$96.00</span>
                                                    <span class="old-price">$96.00</span>
                                                </div>
                                                <p>Typi non habent claritatem insitam, est usus
                                                    legentis in iis qui facit eorum claritatem.
                                                    Investigationes demonstraverunt lectores
                                                    legere me lius quod ii legunt saepius.
                                                    Claritas est etiam processus.</p>
                                                <div class="product__list mb-30">
                                                    <ul>
                                                        <li><span>Light green crewneck sweatshirt.</span>
                                                        </li>
                                                        <li><span>Hand pockets.</span></li>
                                                        <li><span>Relaxed fit.</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="add-cart-list d-sm-flex align-items-center">
                                                <a href="#" class="add-cart-btn mr-10">+ Add to
                                                    Cart</a>
                                                <div class="product__action-2 transition-3 mr-20">
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="Add to Wishlist">
                                                        <i class="fal fa-heart"></i>
                                                    </a>
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top" title="Compare">
                                                        <i class="fal fa-sliders-h"></i>
                                                    </a>
                                                    <!-- Button trigger modal -->
                                                    <a href="#" data-toggle="modal"
                                                       data-target="#productModalId">
                                                        <i class="fal fa-search"></i>
                                                    </a>

                                                </div>
                                            </div>
                                            <!-- shop modal start -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product__wrapper mb-40">
                                <div class="row">


                                    <div class="col-xl-4 col-lg-4">
                                        <div class="product__thumb">
                                            <a href="product-details.html" class="w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-2.jpg"
                                                     alt="product-img">
                                                <img class="product__thumb-2"
                                                     src="${contextRoot}/static/front/assets/img/shop/product/product-9.jpg"
                                                     alt="product-img">
                                            </a>
                                            <div class="product__sale ">
                                                <span class="new">new</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8">
                                        <div class="product__content p-relative">
                                            <div class="product__content-inner list">
                                                <h4><a href="product-details.html">Wooden
                                                    container Bowl</a></h4>
                                                <div class="product__price-2 mb-10">
                                                    <span>$60.00</span>
                                                </div>
                                                <p>Typi non habent claritatem insitam, est usus
                                                    legentis in iis qui facit eorum claritatem.
                                                    Investigationes demonstraverunt lectores
                                                    legere me lius quod ii legunt saepius.
                                                    Claritas est etiam processus.</p>
                                                <div class="product__list mb-30">
                                                    <ul>
                                                        <li><span>Light green crewneck sweatshirt.</span>
                                                        </li>
                                                        <li><span>Hand pockets.</span></li>
                                                        <li><span>Relaxed fit.</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="add-cart-list d-sm-flex align-items-center">
                                                <a href="#" class="add-cart-btn mr-10">+ Add to
                                                    Cart</a>
                                                <div class="product__action-2 transition-3 mr-20">
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="Add to Wishlist">
                                                        <i class="fal fa-heart"></i>
                                                    </a>
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top" title="Compare">
                                                        <i class="fal fa-sliders-h"></i>
                                                    </a>
                                                    <!-- Button trigger modal -->
                                                    <a href="#" data-toggle="modal"
                                                       data-target="#productModalId">
                                                        <i class="fal fa-search"></i>
                                                    </a>

                                                </div>
                                            </div>
                                            <!-- shop modal start -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product__wrapper mb-40">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-4">
                                        <div class="product__thumb">
                                            <a href="product-details.html" class="w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-3.jpg"
                                                     alt="product-img">
                                                <img class="product__thumb-2"
                                                     src="${contextRoot}/static/front/assets/img/shop/product/product-8.jpg"
                                                     alt="product-img">
                                            </a>
                                            <div class="product__sale ">
                                                <span class="new">new</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8">
                                        <div class="product__content p-relative">
                                            <div class="product__content-inner list">
                                                <h4><a href="product-details.html">Wooden
                                                    container Bowl</a></h4>
                                                <div class="product__price-2 mb-10">
                                                    <span>$50.00</span>
                                                </div>
                                                <p>Typi non habent claritatem insitam, est usus
                                                    legentis in iis qui facit eorum claritatem.
                                                    Investigationes demonstraverunt lectores
                                                    legere me lius quod ii legunt saepius.
                                                    Claritas est etiam processus.</p>
                                                <div class="product__list mb-30">
                                                    <ul>
                                                        <li><span>Light green crewneck sweatshirt.</span>
                                                        </li>
                                                        <li><span>Hand pockets.</span></li>
                                                        <li><span>Relaxed fit.</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="add-cart-list d-sm-flex align-items-center">
                                                <a href="#" class="add-cart-btn mr-10">+ Add to
                                                    Cart</a>
                                                <div class="product__action-2 transition-3 mr-20">
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="Add to Wishlist">
                                                        <i class="fal fa-heart"></i>
                                                    </a>
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top" title="Compare">
                                                        <i class="fal fa-sliders-h"></i>
                                                    </a>
                                                    <!-- Button trigger modal -->
                                                    <a href="#" data-toggle="modal"
                                                       data-target="#productModalId">
                                                        <i class="fal fa-search"></i>
                                                    </a>

                                                </div>
                                            </div>
                                            <!-- shop modal start -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product__wrapper mb-40">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-4">
                                        <div class="product__thumb">
                                            <a href="product-details.html" class="w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-4.jpg"
                                                     alt="product-img">
                                                <img class="product__thumb-2"
                                                     src="${contextRoot}/static/front/assets/img/shop/product/product-7.jpg"
                                                     alt="product-img">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8">
                                        <div class="product__content p-relative">
                                            <div class="product__content-inner list">
                                                <h4><a href="product-details.html">Wooden
                                                    container Bowl</a></h4>
                                                <div class="product__price-2 mb-10">
                                                    <span>$50.00</span>
                                                    <span class="old-price">$70</span>
                                                </div>
                                                <p>Typi non habent claritatem insitam, est usus
                                                    legentis in iis qui facit eorum claritatem.
                                                    Investigationes demonstraverunt lectores
                                                    legere me lius quod ii legunt saepius.
                                                    Claritas est etiam processus.</p>
                                                <div class="product__list mb-30">
                                                    <ul>
                                                        <li><span>Light green crewneck sweatshirt.</span>
                                                        </li>
                                                        <li><span>Hand pockets.</span></li>
                                                        <li><span>Relaxed fit.</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="add-cart-list d-sm-flex align-items-center">
                                                <a href="#" class="add-cart-btn mr-10">+ Add to
                                                    Cart</a>
                                                <div class="product__action-2 transition-3 mr-20">
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="Add to Wishlist">
                                                        <i class="fal fa-heart"></i>
                                                    </a>
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top" title="Compare">
                                                        <i class="fal fa-sliders-h"></i>
                                                    </a>
                                                    <!-- Button trigger modal -->
                                                    <a href="#" data-toggle="modal"
                                                       data-target="#productModalId">
                                                        <i class="fal fa-search"></i>
                                                    </a>

                                                </div>
                                            </div>
                                            <!-- shop modal start -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product__wrapper mb-40">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-4">
                                        <div class="product__thumb">
                                            <a href="product-details.html" class="w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-5.jpg"
                                                     alt="product-img">
                                                <img class="product__thumb-2"
                                                     src="${contextRoot}/static/front/assets/img/shop/product/product-11.jpg"
                                                     alt="product-img">
                                            </a>
                                            <div class="product__sale ">
                                                <span class="new">new</span>
                                                <span class="percent">-50%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8">
                                        <div class="product__content p-relative">
                                            <div class="product__content-inner list">
                                                <h4><a href="product-details.html">Wooden
                                                    container Bowl</a></h4>
                                                <div class="product__price-2 mb-10">
                                                    <span>$60.00</span>
                                                    <span class="old-price">$120.00</span>
                                                </div>
                                                <p>Typi non habent claritatem insitam, est usus
                                                    legentis in iis qui facit eorum claritatem.
                                                    Investigationes demonstraverunt lectores
                                                    legere me lius quod ii legunt saepius.
                                                    Claritas est etiam processus.</p>
                                                <div class="product__list mb-30">
                                                    <ul>
                                                        <li><span>Light green crewneck sweatshirt.</span>
                                                        </li>
                                                        <li><span>Hand pockets.</span></li>
                                                        <li><span>Relaxed fit.</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="add-cart-list d-sm-flex align-items-center">
                                                <a href="#" class="add-cart-btn mr-10">+ Add to
                                                    Cart</a>
                                                <div class="product__action-2 transition-3 mr-20">
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top"
                                                       title="Add to Wishlist">
                                                        <i class="fal fa-heart"></i>
                                                    </a>
                                                    <a href="#" data-toggle="tooltip"
                                                       data-placement="top" title="Compare">
                                                        <i class="fal fa-sliders-h"></i>
                                                    </a>
                                                    <!-- Button trigger modal -->
                                                    <a href="#" data-toggle="modal"
                                                       data-target="#productModalId">
                                                        <i class="fal fa-search"></i>
                                                    </a>

                                                </div>
                                            </div>
                                            <!-- shop modal start -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-40">
                        <div class="col-xl-12">
                            <div class="shop-pagination-wrapper d-md-flex justify-content-between align-items-center">
                                <div class="basic-pagination">
                                    <ul>
                                        <li><a href="#"><i class="fal fa-angle-left"></i></a>
                                        </li>
                                        <li><a href="#">01</a></li>
                                        <li class="active"><a href="#">02</a></li>
                                        <li><a href="#">03</a></li>
                                        <li><a href="#"><i class="fas fa-ellipsis-h"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fal fa-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop__header-left">
                                    <div class="show-text bottom">
                                        <span>Showing 1–20 of 20 results</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- shop area end -->

    <!-- shop modal start -->
    <!-- Modal -->
    <div class="modal fade" id="productModalId" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered product-modal" role="document">
            <div class="modal-content">
                <div class="product__modal-wrapper p-relative">
                    <div class="product__modal-close p-absolute">
                        <button data-dismiss="modal"><i class="fal fa-times"></i></button>
                    </div>
                    <div class="product__modal-inner">
                        <div class="row">
                            <div class="col-xl-5 col-lg-5 col-md-6 col-sm-12 col-12">
                                <div class="product__modal-box">
                                    <div class="tab-content mb-20" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home"
                                             role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div class="product__modal-img w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-big-1.jpg"
                                                     alt="">
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                             aria-labelledby="nav-profile-tab">
                                            <div class="product__modal-img w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-big-2.jpg"
                                                     alt="">
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-contact" role="tabpanel"
                                             aria-labelledby="nav-contact-tab">
                                            <div class="product__modal-img w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-big-3.jpg"
                                                     alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <nav>
                                        <div class="nav nav-tabs justify-content-between"
                                             id="nav-tab" role="tablist">
                                            <a class="nav-item nav-link active" id="nav-home-tab"
                                               data-toggle="tab" href="#nav-home" role="tab"
                                               aria-controls="nav-home" aria-selected="true">
                                                <div class="product__nav-img w-img">
                                                    <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-sm-1.jpg"
                                                         alt="">
                                                </div>
                                            </a>
                                            <a class="nav-item nav-link" id="nav-profile-tab"
                                               data-toggle="tab" href="#nav-profile" role="tab"
                                               aria-controls="nav-profile" aria-selected="false">
                                                <div class="product__nav-img w-img">
                                                    <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-sm-2.jpg"
                                                         alt="">
                                                </div>
                                            </a>
                                            <a class="nav-item nav-link" id="nav-contact-tab"
                                               data-toggle="tab" href="#nav-contact" role="tab"
                                               aria-controls="nav-contact" aria-selected="false">
                                                <div class="product__nav-img w-img">
                                                    <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-sm-3.jpg"
                                                         alt="">
                                                </div>
                                            </a>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-7 col-lg-7 col-md-6 col-sm-12 col-12">
                                <div class="product__modal-content">
                                    <h4><a href="product-details.html">Wooden container Bowl</a>
                                    </h4>
                                    <div class="rating rating-shop mb-15">
                                        <ul>
                                            <li><span><i class="fas fa-star"></i></span></li>
                                            <li><span><i class="fas fa-star"></i></span></li>
                                            <li><span><i class="fas fa-star"></i></span></li>
                                            <li><span><i class="fas fa-star"></i></span></li>
                                            <li><span><i class="fal fa-star"></i></span></li>
                                        </ul>
                                        <span class="rating-no ml-10">
													3 rating(s)
												</span>
                                    </div>
                                    <div class="product__price-2 mb-25">
                                        <span>$96.00</span>
                                        <span class="old-price">$96.00</span>
                                    </div>
                                    <div class="product__modal-des mb-30">
                                        <p>Claritas est etiam processus dynamicus, qui sequitur
                                            mutationem consuetudium lectorum. Mirum est notare quam
                                            littera gothica, quam nunc putamus parum claram.</p>
                                    </div>
                                    <div class="product__modal-form">
                                        <form action="#">
                                            <div class="product__modal-input size mb-20">
                                                <label>Size <i
                                                        class="fas fa-star-of-life"></i></label>
                                                <select>
                                                    <option>- Please select -</option>
                                                    <option> S</option>
                                                    <option> M</option>
                                                    <option> L</option>
                                                    <option> XL</option>
                                                    <option> XXL</option>
                                                </select>
                                            </div>
                                            <div class="product__modal-input color mb-20">
                                                <label>Color <i
                                                        class="fas fa-star-of-life"></i></label>
                                                <select>
                                                    <option>- Please select -</option>
                                                    <option> Black</option>
                                                    <option> Yellow</option>
                                                    <option> Blue</option>
                                                    <option> White</option>
                                                    <option> Ocean Blue</option>
                                                </select>
                                            </div>
                                            <div class="product__modal-required mb-5">
                                                <span>Repuired Fiields *</span>
                                            </div>
                                            <div class="pro-quan-area d-lg-flex align-items-center">
                                                <div class="product-quantity-title">
                                                    <label>Quantity</label>
                                                </div>
                                                <div class="product-quantity">
                                                    <div class="cart-plus-minus"><input type="text"
                                                                                        value="1"/>
                                                    </div>
                                                </div>
                                                <div class="pro-cart-btn ml-20">
                                                    <a href="#" class="add-cart-btn mr-10">+ Add to
                                                        Cart</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- shop modal end -->


</main>
<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>


<script>


</script>
<script src="${contextRoot}/static/front/universal/Product.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>

</body>
</html>

