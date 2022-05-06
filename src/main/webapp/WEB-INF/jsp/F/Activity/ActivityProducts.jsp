<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.lang.Math" %>
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
<%--Header Page--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>
    <c:forEach items="${activity.imgurImgs}" var="img">
        <section class="page__title p-relative d-flex align-items-center"
                 data-background="${img.link}">
    </c:forEach>

    <!-- page title area start -->
<%--    <section class="page__title p-relative d-flex align-items-center"--%>
<%--             data-background="">--%>
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="page__title-inner text-center">
                        <h1>${activity.subject}</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item">${activity.startDate}</li>
                                    <li class="breadcrumb-item active" aria-current="page">${activity.endDate}
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

    <!-- shop area start -->
    <section class="shop__area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="shop__content-area">
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-grid" role="tabpanel"
                                 aria-labelledby="pills-grid-tab">
                                <div class="row custom-row-10">
                                    <c:forEach items="${activity.products}" var="product">
                                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 custom-col-10">
                                            <div class="product__wrapper mb-60">
                                                <div class="product__thumb">
                                                    <a href="${contextRoot}/F/product/product-details?id=${product.id}"
                                                       class="w-img">
                                                        <c:choose>
                                                            <c:when test="${product.image01 == null}">
                                                                <img src="${contextRoot}/static/back/universal/images/no-image.jpeg"
                                                                     alt="product-img">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${product.image01}"
                                                                     alt="product-img">
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${product.image02 == null}">
                                                                <img class="product__thumb-2"
                                                                     src="${contextRoot}/static/back/universal/images/no-image.jpeg"
                                                                     alt="product-img">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img class="product__thumb-2"
                                                                     src="${product.image02}"
                                                                     alt="product-img">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </a>
                                                    <div class="product__sale">
                                                        <span class="new">折扣</span>
                                                        <span class="percent">-${activity.discountPercentage}%</span>
                                                    </div>
                                                </div>
                                                <div class="product__content p-relative">
                                                    <div class="product__content-inner">
                                                        <h4>
                                                            <a href="${contextRoot}/F/product/product-details?id=${product.id}">${product.name}</a>
                                                        </h4>
                                                        <div class="product__price transition-3">
                                                            <c:set var="dis"
                                                                   value="${(100-activity.discountPercentage)/100}"/>
                                                            <span>$${(product.price*dis).intValue()}</span>
                                                            <span class="old-price">$${product.price}</span>
                                                        </div>
                                                    </div>
<%--                                                    <div class="add-cart p-absolute transition-3">--%>
<%--                                                            &lt;%&ndash; SamWang to-do: 加入購物車連結未解決&ndash;%&gt;--%>
<%--                                                        <a href="">+ Add to Cart</a>--%>
<%--                                                    </div>--%>
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

</body>
</html> 
