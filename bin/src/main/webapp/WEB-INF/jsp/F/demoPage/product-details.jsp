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
                        <h1>Product Details</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> Product
                                        details
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


    <!-- shop details area start -->
    <section class="shop__area pb-65">
        <div class="shop__top grey-bg-6 pt-100 pb-90">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <div class="product__modal-box d-flex">
                            <div class="product__modal-nav mr-20">
                                <nav>
                                    <div class="nav nav-tabs" id="product-details" role="tablist">
                                        <a class="nav-item nav-link active" id="pro-one-tab"
                                           data-toggle="tab" href="#pro-one" role="tab"
                                           aria-controls="pro-one" aria-selected="true">
                                            <div class="product__nav-img w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/details/details-sm-1.jpg"
                                                     alt="">
                                            </div>
                                        </a>
                                        <a class="nav-item nav-link" id="pro-two-tab"
                                           data-toggle="tab" href="#pro-two" role="tab"
                                           aria-controls="pro-two" aria-selected="false">
                                            <div class="product__nav-img w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-sm-2.jpg"
                                                     alt="">
                                            </div>
                                        </a>
                                        <a class="nav-item nav-link" id="pro-three-tab"
                                           data-toggle="tab" href="#pro-three" role="tab"
                                           aria-controls="pro-three" aria-selected="false">
                                            <div class="product__nav-img w-img">
                                                <img src="${contextRoot}/static/front/assets/img/shop/product/quick-view/quick-sm-3.jpg"
                                                     alt="">
                                            </div>
                                        </a>
                                    </div>
                                </nav>
                            </div>
                            <div class="tab-content mb-20" id="product-detailsContent">
                                <div class="tab-pane fade show active" id="pro-one" role="tabpanel"
                                     aria-labelledby="pro-one-tab">
                                    <div class="product__modal-img product__thumb w-img">
                                        <img src="${contextRoot}/static/front/assets/img/shop/product/details/details-big-1.jpg"
                                             alt="">
                                        <div class="product__sale ">
                                            <span class="new">new</span>
                                            <span class="percent">-16%</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pro-two" role="tabpanel"
                                     aria-labelledby="pro-two-tab">
                                    <div class="product__modal-img product__thumb w-img">
                                        <img src="${contextRoot}/static/front/assets/img/shop/product/details/details-big-2.jpg"
                                             alt="">
                                        <div class="product__sale ">
                                            <span class="new">new</span>
                                            <span class="percent">-16%</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pro-three" role="tabpanel"
                                     aria-labelledby="pro-three-tab">
                                    <div class="product__modal-img product__thumb w-img">
                                        <img src="${contextRoot}/static/front/assets/img/shop/product/details/details-big-3.jpg"
                                             alt="">
                                        <div class="product__sale ">
                                            <span class="new">new</span>
                                            <span class="percent">-16%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="product__modal-content product__modal-content-2">
                            <h4><a href="product-details.html">Wooden container Bowl</a></h4>
                            <div class="rating rating-shop mb-15">
                                <ul>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fas fa-star"></i></span></li>
                                    <li><span><i class="fal fa-star"></i></span></li>
                                </ul>
                                <span class="rating-no ml-10 rating-left">
                                            3 rating(s)
                                        </span>
                                <span class="review rating-left"><a
                                        href="#">Add your Review</a></span>
                            </div>
                            <div class="product__price-2 mb-25">
                                <span>$96.00</span>
                                <span class="old-price">$96.00</span>
                            </div>
                            <div class="product__modal-des mb-30">
                                <p>Claritas est etiam processus dynamicus, qui sequitur mutationem
                                    consuetudium lectorum. Mirum est notare quam littera gothica,
                                    quam nunc putamus parum claram.</p>
                            </div>
                            <div class="product__modal-form mb-30">
                                <form action="#">
                                    <div class="product__modal-input size mb-20">
                                        <label>Size <i class="fas fa-star-of-life"></i></label>
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
                                        <label>Color <i class="fas fa-star-of-life"></i></label>
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
                                    <div class="pro-quan-area d-sm-flex align-items-center">
                                        <div class="product-quantity-title">
                                            <label>Quantity</label>
                                        </div>
                                        <div class="product-quantity mr-20 mb-20">
                                            <div class="cart-plus-minus"><input type="text"
                                                                                value="1"/></div>
                                        </div>
                                        <div class="pro-cart-btn">
                                            <a href="#" class="add-cart-btn mb-20">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="product__tag mb-25">
                                <span>Category:</span>
                                <span><a href="#">Accessories,</a></span>
                                <span><a href="#">Gaming,</a></span>
                                <span><a href="#">PC Computers,</a></span>
                                <span><a href="#">Ultrabooks</a></span>
                            </div>
                            <div class="product__share">
                                <span>Share :</span>
                                <ul>
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-behance"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="shop__bottom">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="product__details-tab">
                            <div class="product__details-tab-nav text-center mb-45">
                                <nav>
                                    <div class="nav nav-tabs justify-content-start justify-content-sm-center"
                                         id="pro-details" role="tablist">
                                        <a class="nav-item nav-link active" id="des-tab"
                                           data-toggle="tab" href="#des" role="tab"
                                           aria-controls="des" aria-selected="true">Description</a>
                                        <a class="nav-item nav-link" id="add-tab" data-toggle="tab"
                                           href="#add" role="tab" aria-controls="add"
                                           aria-selected="false">Additional Information</a>
                                        <a class="nav-item nav-link" id="review-tab"
                                           data-toggle="tab" href="#review" role="tab"
                                           aria-controls="review" aria-selected="false">Reviews
                                            (4)</a>
                                    </div>
                                </nav>
                            </div>
                            <div class="tab-content" id="pro-detailsContent">
                                <div class="tab-pane fade show active" id="des" role="tabpanel">
                                    <div class="product__details-des">
                                        <p>Lorem Ipsum is simply dummy text of the printing and
                                            typesetting industry. Lorem Ipsum has been the
                                            industry's standard dummy text ever since the 1500s,
                                            when anunknown printer took a galley of type and
                                            scrambled it to make a type specimen book. It has
                                            survived not only five centuries, but also the leap into
                                            electronic typesetting, remaining essentially unchanged.
                                            It was popularised in the 1960s with the release of
                                            Letraset sheets containing Lorem Ipsum passages.</p>

                                        <div class="product__details-des-list mb-20">
                                            <ul>
                                                <li>
                                                    <span>Claritas est etiam processus dynamicus.</span>
                                                </li>
                                                <li><span>Qui sequitur mutationem consuetudium lectorum.</span>
                                                </li>
                                                <li>
                                                    <span>Claritas est etiam processus dynamicus.</span>
                                                </li>
                                                <li><span>Qui sequitur mutationem consuetudium lectorum.</span>
                                                </li>
                                                <li>
                                                    <span>Claritas est etiam processus dynamicus.</span>
                                                </li>
                                                <li><span>Qui sequitur mutationem consuetudium lectorum.</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <p>It has survived not only five centuries, but also the
                                            leap into electronic typesetting, remaining essentially
                                            unchanged. It was popularised in the 1960s with the
                                            release.</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="add" role="tabpanel">
                                    <div class="product__details-add">
                                        <ul>
                                            <li><span>Weight</span></li>
                                            <li><span>.25 KG</span></li>
                                            <li><span>Dimention</span></li>
                                            <li><span>62 × 56 × 12 cm</span></li>
                                            <li><span>Size</span></li>
                                            <li><span>XL, XXL, LG, SM, MD</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="review" role="tabpanel">
                                    <div class="product__details-review">
                                        <div class="postbox__comments">
                                            <div class="postbox__comment-title mb-30">
                                                <h3>Reviews (32)</h3>
                                            </div>
                                            <div class="latest-comments mb-30">
                                                <ul>
                                                    <li>
                                                        <div class="comments-box">
                                                            <div class="comments-avatar">
                                                                <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-1.png"
                                                                     alt="">
                                                            </div>
                                                            <div class="comments-text">
                                                                <div class="avatar-name">
                                                                    <h5>Siarhei Dzenisenka</h5>
                                                                    <span> - 3 months ago </span>
                                                                    <a class="reply" href="#">Leave
                                                                        Reply</a>
                                                                </div>
                                                                <div class="user-rating">
                                                                    <ul>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fal fa-star"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <p>Many desktop publishing packages
                                                                    and web page editors now use
                                                                    Lorem Ipsum as their default
                                                                    model text, and a search for
                                                                    <span>“lorem ipsum”</span> will
                                                                    uncover many web sites still in
                                                                    their infancy. Various versions
                                                                    have evolved over the years,
                                                                    sometimes by accident, sometimes
                                                                    on purpose.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="children">
                                                        <div class="comments-box">
                                                            <div class="comments-avatar">
                                                                <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-2.png"
                                                                     alt="">
                                                            </div>
                                                            <div class="comments-text">
                                                                <div class="avatar-name">
                                                                    <h5>Julias Roy</h5>
                                                                    <span> - 6 months ago </span>
                                                                    <a class="reply" href="#">Leave
                                                                        Reply</a>
                                                                </div>
                                                                <div class="user-rating">
                                                                    <ul>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fal fa-star"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <p>Many desktop publishing packages
                                                                    and web page editors now use
                                                                    Lorem Ipsum as their default
                                                                    model text, and a search for
                                                                    <span>“lorem ipsum”</span> will
                                                                    uncover many web sites still in
                                                                    their infancy. </p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="comments-box">
                                                            <div class="comments-avatar">
                                                                <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-3.png"
                                                                     alt="">
                                                            </div>
                                                            <div class="comments-text">
                                                                <div class="avatar-name">
                                                                    <h5>Arista Williamson</h5>
                                                                    <span> - 6 months ago </span>
                                                                    <a class="reply" href="#">Leave
                                                                        Reply</a>
                                                                </div>
                                                                <div class="user-rating">
                                                                    <ul>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fas fa-star"></i></a>
                                                                        </li>
                                                                        <li><a href="#"><i
                                                                                class="fal fa-star"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <p>Many desktop publishing packages
                                                                    and web page editors now use
                                                                    Lorem Ipsum as their default
                                                                    model text, and a search for
                                                                    <span>“lorem ipsum”</span> will
                                                                    uncover many web sites still in
                                                                    their infancy. Various versions
                                                                    have evolved over the years,
                                                                    sometimes by accident, sometimes
                                                                    on purpose.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="post-comments-form mb-100">
                                            <div class="post-comments-title mb-30">
                                                <h3>Your Review</h3>
                                            </div>
                                            <form id="contacts-form" class="conatct-post-form"
                                                  action="#">
                                                <div class="row">
                                                    <div class="col-xl-6 col-lg-6 col-md-6">
                                                        <div class="contact-icon p-relative contacts-name">
                                                            <input type="text" placeholder="Name">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6 col-lg-6 col-md-6">
                                                        <div class="contact-icon p-relative contacts-name">
                                                            <input type="email" placeholder="Email">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12">
                                                        <div class="contact-icon p-relative contacts-email">
                                                            <input type="text"
                                                                   placeholder="Subject">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12">
                                                        <div class="contact-icon p-relative contacts-message">
                                                                    <textarea name="comments"
                                                                              id="comments"
                                                                              cols="30" rows="10"
                                                                              placeholder="Comments"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12">
                                                        <button class="os-btn os-btn-black"
                                                                type="submit">Post comment
                                                        </button>
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
    </section>
    <!-- shop details area end -->

    <!-- related products area start -->
    <section class="related__product pb-60">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section__title-wrapper text-center mb-55">
                        <div class="section__title mb-10">
                            <h2>Trending Products</h2>
                        </div>
                        <div class="section__sub-title">
                            <p>Mirum est notare quam littera gothica quam nunc putamus parum
                                claram!</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="product__wrapper mb-60">
                        <div class="product__thumb">
                            <a href="product-details.html" class="w-img">
                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-1.jpg" alt="product-img">
                                <img class="product__thumb-2"
                                     src="${contextRoot}/static/front/assets/img/shop/product/product-10.jpg" alt="product-img">
                            </a>
                            <div class="product__action transition-3">
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Add to Wishlist">
                                    <i class="fal fa-heart"></i>
                                </a>
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Compare">
                                    <i class="fal fa-sliders-h"></i>
                                </a>
                                <!-- Button trigger modal -->
                                <a href="javascript:void(0);" data-toggle="modal"
                                   data-target="#productModalId">
                                    <i class="fal fa-search"></i>
                                </a>

                            </div>
                            <div class="product__sale">
                                <span class="new">new</span>
                                <span class="percent">-16%</span>
                            </div>
                        </div>
                        <div class="product__content p-relative">
                            <div class="product__content-inner">
                                <h4><a href="product-details.html">Wooden container Bowl</a></h4>
                                <div class="product__price transition-3">
                                    <span>$96.00</span>
                                    <span class="old-price">$96.00</span>
                                </div>
                            </div>
                            <div class="add-cart p-absolute transition-3">
                                <a href="#">+ Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="product__wrapper mb-60">
                        <div class="product__thumb">
                            <a href="product-details.html" class="w-img">
                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-2.jpg" alt="product-img">
                                <img class="product__thumb-2"
                                     src="${contextRoot}/static/front/assets/img/shop/product/product-8.jpg" alt="product-img">
                            </a>
                            <div class="product__action transition-3">
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Add to Wishlist">
                                    <i class="fal fa-heart"></i>
                                </a>
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Compare">
                                    <i class="fal fa-sliders-h"></i>
                                </a>
                                <!-- Button trigger modal -->
                                <a href="javascript:void(0);" data-toggle="modal"
                                   data-target="#productModalId">
                                    <i class="fal fa-search"></i>
                                </a>

                            </div>
                            <div class="product__sale">
                                <span class="new">new</span>
                            </div>
                        </div>
                        <div class="product__content p-relative">
                            <div class="product__content-inner">
                                <h4><a href="product-details.html">Wooden container Bowl</a></h4>
                                <div class="product__price transition-3">
                                    <span>$35.00</span>
                                </div>
                            </div>
                            <div class="add-cart p-absolute transition-3">
                                <a href="#">+ Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="product__wrapper mb-60">
                        <div class="product__thumb">
                            <a href="product-details.html" class="w-img">
                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-3.jpg" alt="product-img">
                                <img class="product__thumb-2"
                                     src="${contextRoot}/static/front/assets/img/shop/product/product-7.jpg" alt="product-img">
                            </a>
                            <div class="product__action transition-3">
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Add to Wishlist">
                                    <i class="fal fa-heart"></i>
                                </a>
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Compare">
                                    <i class="fal fa-sliders-h"></i>
                                </a>
                                <!-- Button trigger modal -->
                                <a href="javascript:void(0);" data-toggle="modal"
                                   data-target="#productModalId">
                                    <i class="fal fa-search"></i>
                                </a>
                            </div>
                        </div>
                        <div class="product__content p-relative">
                            <div class="product__content-inner">
                                <h4><a href="product-details.html">Wooden container Bowl</a></h4>
                                <div class="product__price transition-3">
                                    <span>$40.00</span>
                                    <span class="old-price">$70.00</span>
                                </div>
                            </div>
                            <div class="add-cart p-absolute transition-3">
                                <a href="#">+ Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="product__wrapper mb-60">
                        <div class="product__thumb">
                            <a href="product-details.html" class="w-img">
                                <img src="${contextRoot}/static/front/assets/img/shop/product/product-4.jpg" alt="product-img">
                                <img class="product__thumb-2"
                                     src="${contextRoot}/static/front/assets/img/shop/product/product-6.jpg" alt="product-img">
                            </a>
                            <div class="product__action transition-3">
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Add to Wishlist">
                                    <i class="fal fa-heart"></i>
                                </a>
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="Compare">
                                    <i class="fal fa-sliders-h"></i>
                                </a>
                                <!-- Button trigger modal -->
                                <a href="javascript:void(0);" data-toggle="modal"
                                   data-target="#productModalId">
                                    <i class="fal fa-search"></i>
                                </a>

                            </div>
                            <div class="product__sale">
                                <span class="new">new</span>
                            </div>
                        </div>
                        <div class="product__content p-relative">
                            <div class="product__content-inner">
                                <h4><a href="product-details.html">Wooden container Bowl</a></h4>
                                <div class="product__price transition-3">
                                    <span>$50.00</span>
                                </div>
                            </div>
                            <div class="add-cart p-absolute transition-3">
                                <a href="#">+ Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- related products area end -->

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
