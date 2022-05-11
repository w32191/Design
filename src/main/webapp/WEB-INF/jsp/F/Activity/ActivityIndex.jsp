<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>


<!Doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Design & Decor </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>

    <%--  CSS include page--%>
    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp"/>
</head>
<body>

<%--Header Page--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>
    <%--    活動輪播圖--%>
    <!-- slider area start -->
    <section class="slider__area p-relative">
        <div class="slider-active">
            <c:forEach items="${allActivity}" var="ac">
                <fmt:parseDate value="${ac.startDate}" pattern="yyyy-MM-dd" var="parsedStartDate" type="date"/>
                <fmt:parseDate value="${ac.endDate}" pattern="yyyy-MM-dd" var="parsedEndDate" type="date"/>
                <c:choose>
                    <c:when test="${ac.imgurImgs.size() == 0}">
                        <div class="single-slider slider__height d-flex align-items-center"
                             data-background="${contextRoot}/static/back/universal/images/no-image.jpeg">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-8 col-sm-10 col-12">
                                        <div class="slider__content">
                                            <h2 data-animation="fadeInUp"
                                                data-delay=".2s">${ac.subject}</h2>
                                            <p data-animation="fadeInUp"
                                               data-delay=".4s">${ac.content}</p>
                                            <p data-animation="fadeInUp" data-delay=".4s"> 限時折扣：<span class="font-weight-bold text-danger">${ac.discountPercentage}% !!!</span></p>
                                            <p data-animation="fadeInUp" class="text-danger font-weight-bold"
                                               data-delay=".4s">
                                                <fmt:formatDate value="${parsedStartDate}" pattern="MM/dd" /> ~
                                                <fmt:formatDate value="${parsedEndDate}" pattern="MM/dd" />
                                                    </p>
                                            <a href="/Design/F/Activity/productList/${ac.id}"
                                               class="os-btn os-btn-2"
                                               data-animation="fadeInUp" data-delay=".6s">手刀前往</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${ac.imgurImgs}" var="img" begin="0" end="0"
                                   step="1">
                            <div class="single-slider slider__height d-flex align-items-center"
                                 data-background="${img.link}">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xl-6 col-lg-6 col-md-8 col-sm-10 col-12">
                                            <div class="slider__content">
                                                <h2 data-animation="fadeInUp"
                                                    data-delay=".2s">${ac.subject}</h2>
                                                <p data-animation="fadeInUp"
                                                   data-delay=".4s">${ac.content}</p>
                                                <p data-animation="fadeInUp" data-delay=".4s"> 限時折扣：<span class="font-weight-bold text-danger">${ac.discountPercentage}% !!!</span></p>
                                                <p data-animation="fadeInUp" class="text-danger font-weight-bold"
                                                   data-delay=".4s">
                                                    <fmt:formatDate value="${parsedStartDate}" pattern="MM/dd" /> ~
                                                    <fmt:formatDate value="${parsedEndDate}" pattern="MM/dd" />
                                                </p>
                                                <a href="/Design/F/Activity/productList/${ac.id}"
                                                   class="os-btn os-btn-2"
                                                   data-animation="fadeInUp" data-delay=".6s">手刀前往</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </section>
    <!-- slider area end -->

    <!-- banner area start -->
    <div class="banner__area">
        <div class="container">
            <div class="banner__inner p-relative mt--95">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="banner__item mb-30 p-relative">
                            <div class="banner__thumb fix">
                                <a href="${contextRoot}/F/Design" class="w-img"><img
                                        src="${contextRoot}/static/front/assets/img/shop/banner/banner-sm-1.jpg"
                                        alt="banner"></a>
                            </div>
                            <div class="banner__content p-absolute transition-3">
                                <h2><a href="${contextRoot}/F/Design">找設計？</a>
                                </h2>
                                <a href="${contextRoot}/F/Design" class="link-btn">立刻前往</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="banner__item mb-30 p-relative">
                            <div class="banner__thumb fix">
                                <a href="${contextRoot}/F/Case" class="w-img"><img
                                        src="${contextRoot}/static/front/assets/img/shop/banner/banner-sm-2.jpg"
                                        alt="banner"></a>
                            </div>
                            <div class="banner__content p-absolute transition-3">
                                <h2><a href="${contextRoot}/F/Case">找案例？</a></h2>
                                <a href="${contextRoot}/F/Case" class="link-btn">立刻前往</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner area end -->

    <!-- product area start -->
    <section class="product__area pt-60 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section__title-wrapper text-center mb-55">
                        <div class="section__title mb-10">
                            <h2>折扣中商品</h2>
                        </div>
                        <div class="section__sub-title">
                            <p>限時促銷買到賺到！！！</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <c:choose>
                        <c:when test="${productList.size()==0}">
                            <div class="section__title-wrapper text-center mb-55">
                                <div class="section__title mb-10">
                                    <h2>現在暫無折扣中商品</h2>
                                </div>
                                <div class="section__sub-title">
                                    <p>沒有活動中商品！！！</p>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="product__slider owl-carousel">
                                <c:forEach begin="0" end="${productList.size()-1}" step="2" var="i">
                                    <div class="product__item">
                                        <div class="product__wrapper mb-60">
                                            <div class="product__thumb">
                                                <a href="/Design/F/product/product-details?id=${productList.get(i).id}"
                                                   class="w-img">
                                                    <img src="${productList.get(i).image01}"
                                                         alt="product-img">
                                                    <img class="product__thumb-2"
                                                         src="${productList.get(i).image02}"
                                                         alt="product-img">
                                                </a>
                                                <div class="product__sale">
                                                    <span class="new">折扣</span>
                                                    <span class="percent">-${productList.get(i).discountPercentage}%</span>
                                                </div>
                                            </div>
                                            <div class="product__content p-relative">
                                                <div class="product__content-inner">
                                                    <h4>
                                                        <a href="/Design/F/product/product-details?id=${productList.get(i).id}"></a>
                                                            ${productList.get(i).name}
                                                    </h4>
                                                    <div class="product__price transition-3">
                                                        <c:set var="dis"
                                                               value="${(100-productList.get(i).discountPercentage)/100}"/>
                                                        <span>$${(productList.get(i).price*dis).intValue()}</span>
                                                        <span class="old-price">$${productList.get(i).price}</span>
                                                    </div>
                                                </div>
                                                <div class="add-cart p-absolute transition-3">
                                                    <a id="newArrAddToCartBtn${productList.get(i).id}">+
                                                        Add to Cart</a>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${(i+1 )< productList.size()-1}">
                                            <div class="product__wrapper mb-60">
                                                <div class="product__thumb">
                                                    <a href="/Design/F/product/product-details?id=${productList.get(i+1).id}"
                                                       class="w-img">
                                                        <img src="${productList.get(i+1).image01}"
                                                             alt="product-img">
                                                        <img class="product__thumb-2"
                                                             src="${productList.get(i+1).image02}"
                                                             alt="product-img">
                                                    </a>
                                                    <div class="product__sale">
                                                        <span class="new">折扣</span>
                                                        <span class="percent">-${productList.get(i+1).discountPercentage}%</span>
                                                    </div>
                                                </div>
                                                <div class="product__content p-relative">
                                                    <div class="product__content-inner">
                                                        <h4>
                                                            <a href="/Design/F/product/product-details?id=${productList.get(i+1).id}"></a>${productList.get(i+1).name}
                                                        </h4>
                                                        <div class="product__price transition-3">
                                                            <c:set var="dis2"
                                                                   value="${(100-productList.get(i+1).discountPercentage)/100}"/>
                                                            <span>$${(productList.get(i+1).price*dis2).intValue()}</span>
                                                            <span class="old-price">$${productList.get(i+1).price}</span>
                                                        </div>
                                                    </div>
                                                    <div class="add-cart p-absolute transition-3">
                                                        <a id="newArrAddToCartBtn${productList.get(i+1).id}">+
                                                            Add to Cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <%--            <div class="row">--%>
            <%--                <div class="col-xl-12">--%>
            <%--                    <div class="product__load-btn text-center mt-25">--%>
            <%--                        <a href="#" class="os-btn os-btn-3">Load More</a>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
        </div>
    </section>
    <!-- product area end -->


    <!-- sale off area start -->
    <section class="sale__area pb-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section__title-wrapper text-center mb-55">
                        <div class="section__title mb-10">
                            <h2>新品推薦</h2>
                        </div>
                        <div class="section__sub-title">
                            <p>NEW ARRIVAL</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" id="na">

            </div>
        </div>
    </section>
    <!-- sale off area end -->

    <!-- client slider area start -->
    <section class="client__area pt-15 pb-140">
        <div class="container">
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- client slider area end -->

    <!-- blog area start -->
    <section class="blog__area pb-70">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section__title-wrapper text-center mb-55">
                        <div class="section__title mb-10">
                            <h2>Our Blog Posts</h2>
                        </div>
                        <div class="section__sub-title">
                            <p>Mirum est notare quam littera gothica quam nunc putamus parum
                                claram!</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="blog__slider owl-carousel">
                        <div class="blog__item mb-30">
                            <div class="blog__thumb fix">
                                <a href="blog-details.html" class="w-img"><img
                                        src="${contextRoot}/static/front/assets/img/blog/blog-1.jpg"
                                        alt="blog"></a>
                            </div>
                            <div class="blog__content">
                                <h4><a href="blog-details.html">Anteposuerit litterarum formas.</a>
                                </h4>
                                <div class="blog__meta">
                                    <span>By <a href="#">Shahnewaz Sakil</a></span>
                                    <span>/ September 14, 2017</span>
                                </div>
                                <p>Mirum est notare quam littera gothica, quam nunc putamus parum
                                    claram.</p>
                                <a href="blog-details.html" class="os-btn">read more</a>
                            </div>
                        </div>
                        <div class="blog__item mb-30">
                            <div class="blog__thumb fix">
                                <a href="blog-details.html" class="w-img"><img
                                        src="${contextRoot}/static/front/assets/img/blog/blog-2.jpg"
                                        alt="blog"></a>
                            </div>
                            <div class="blog__content">
                                <h4><a href="blog-details.html">Hanging fruit to identify</a></h4>
                                <div class="blog__meta">
                                    <span>By <a href="#">Shahnewaz Sakil</a></span>
                                    <span>/ September 14, 2017</span>
                                </div>
                                <p>Mirum est notare quam littera gothica, quam nunc putamus parum
                                    claram.</p>
                                <a href="blog-details.html" class="os-btn">read more</a>
                            </div>
                        </div>
                        <div class="blog__item mb-30">
                            <div class="blog__thumb fix">
                                <a href="blog-details.html" class="w-img"><img
                                        src="${contextRoot}/static/front/assets/img/blog/blog-3.jpg"
                                        alt="blog"></a>
                            </div>
                            <div class="blog__content">
                                <h4><a href="blog-details.html">The information highway will</a>
                                </h4>
                                <div class="blog__meta">
                                    <span>By <a href="#">Shahnewaz Sakil</a></span>
                                    <span>/ September 14, 2017</span>
                                </div>
                                <p>Mirum est notare quam littera gothica, quam nunc putamus parum
                                    claram.</p>
                                <a href="blog-details.html" class="os-btn">read more</a>
                            </div>
                        </div>
                        <div class="blog__item mb-30">
                            <div class="blog__thumb fix">
                                <a href="blog-details.html" class="w-img"><img
                                        src="${contextRoot}/static/front/assets/img/blog/blog-2.jpg"
                                        alt="blog"></a>
                            </div>
                            <div class="blog__content">
                                <h4><a href="blog-details.html">Additional clickthroughs from</a>
                                </h4>
                                <div class="blog__meta">
                                    <span>By <a href="#">Shahnewaz Sakil</a></span>
                                    <span>/ September 14, 2017</span>
                                </div>
                                <p>Mirum est notare quam littera gothica, quam nunc putamus parum
                                    claram.</p>
                                <a href="blog-details.html" class="os-btn">read more</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- blog area end -->

    <!-- subscribe area start -->
<%--    <section class="subscribe__area pb-100">--%>
<%--        <div class="container">--%>
<%--            <div class="subscribe__inner pt-95">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2">--%>
<%--                        <div class="subscribe__content text-center">--%>
<%--                            <h2>Get Discount Info</h2>--%>
<%--                            <p>Subscribe to the Outstock mailing list to receive updates on new--%>
<%--                                arrivals, special offers and other discount information.</p>--%>
<%--                            <div class="subscribe__form">--%>
<%--                                <form action="#">--%>
<%--                                    <input type="email"--%>
<%--                                           placeholder="Subscribe to our newsletter...">--%>
<%--                                    <button class="os-btn os-btn-2 os-btn-3">subscribe</button>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
    <!-- subscribe area end -->

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
                                                    <a href="#"
                                                       class="os-btn os-btn-black os-btn-3 mr-10">+
                                                        Add to Cart</a>
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
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/front/universal/ActivityIndex.js"></script>
</body>
</html>
