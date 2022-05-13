<%--<jsp:useBean id="aCase" scope="request" type="org.w3c.dom.html.HTMLDocument"/>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DESIGN & DECOR</title>
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

<%--Header Page--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>
    <!-- blog area start -->
    <section class="blog__area pt-55">
        <div class="container">
            <div class="row">
                <span hidden id="spanId">${aCase.id}</span>
                <div class="col-xl-9 col-lg-8">
                    <div class="row">
                        <div class="col-12">
                        </div>
                    </div>
                    <div class="postbox__title mb-55">
                        <c:if test="${aCase.fkMember.id eq memberId}">
                            <div id="table_tbody" class="coupon2">
                                <div class="coupon-all" style="margin-top: 0 ; padding-bottom: 25px">
                                    <a href="${contextRoot}/F/EditCase/${aCase.id} " id="editBtn" class="os-btn os-btn-black" name="add_cart" type="submit">
                                        編輯案件
                                    </a>
                                </div>
                            </div>
                        </c:if>
                        <h1><a href="blog.html">${aCase.title}</a></h1>
                        <div class="blog__meta">
                            <span>${aCase.location}</span><br/>
                            <span>${aCase.classification}</span><br/>
                            <span>By <a href="#">${aCase.name}</a></span>
                            <span>/ ${aCase.dateTime}</span>
                        </div>
                    </div>
                    <div class="postbox__thumb w-img">
                        <img src="${aCase.coverPhoto}" alt="">
                    </div>
                    <div class="postbox__wrapper mb-70">
                        <div class="postbox__text mt-65">
                            <p>
                            </p>
                        </div>
                        <div class="postbox__text">
                            <p>

                            </p>
                        </div>
                        <article class="postbox format-quote mt-45 mb-50">
                            <div class="postbox__quote">
                                <blockquote>
                                    <p><i class="fas fa-quote-right"></i>${aCase.message}</p>
                                </blockquote>
                            </div>
                        </article>
                        <div class="postbox__details-img w-img mb-60">
                            <img src="" alt="">
                        </div>
                        <div class="postbox__text">
                            <p>
                            </p>
                        </div>
                        <div class="postbox__text">
                            <p>
                            </p>
                        </div>
                    </div>
                    <div class="postbox__share mb-95">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="postbox__social">
                                    <span>Share to friends:</span>
                                    <ul>
                                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                                        <li><a href="#"><i class="fas fa-share-alt"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="postbox__tag f-right">
                                    <span>Tags :</span>
                                    <a href="#">Furniture,</a>
                                    <a href="#">Erentheme,</a>
                                    <a href="#">Chair, </a>
                                    <a href="#">Decor</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="postbox__related-title">
                        <h3>You Might Also Like</h3>
                    </div>
                    <div class="postbox__related-item">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="blog__item mb-30">
                                    <div class="blog__thumb fix">
                                        <a href="blog-details.html" class="w-img"><img
                                                src="${contextRoot}/static/front/assets/img/blog/blog-1.jpg" alt="blog"></a>
                                    </div>
                                    <div class="blog__content">
                                        <h4><a href="blog-details.html">Anteposuerit litterarum
                                            formas.</a></h4>
                                        <div class="blog__meta">
                                            <span>By <a href="#">Shahnewaz Sakil</a></span>
                                            <span>/ September 14, 2017</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6">
                                <div class="blog__item mb-30">
                                    <div class="blog__thumb fix">
                                        <a href="blog-details.html" class="w-img"><img
                                                src="${contextRoot}/static/front/assets/img/blog/blog-2.jpg" alt="blog"></a>
                                    </div>
                                    <div class="blog__content">
                                        <h4><a href="blog-details.html">Hanging fruit to identify a
                                            ballpark</a></h4>
                                        <div class="blog__meta">
                                            <span>By <a href="#">Shahnewaz Sakil</a></span>
                                            <span>/ September 14, 2017</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="postbox__line mt-65"></div>

                    <div class="postbox__line mb-95"></div>
                    <div class="post-comments-form mb-100">
                        <div class="post-comments-title mb-30">
                            <h3>Leave A Reply</h3>
                        </div>
                        <form id="contacts-form" class="conatct-post-form" action="#">
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
                                        <input type="text" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="contact-icon p-relative contacts-message">
                                                <textarea name="comments" id="comments" cols="30"
                                                          rows="10"
                                                          placeholder="Comments"></textarea>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <button class="os-btn os-btn-black" type="submit">Post comment
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4">
                    <div class="sidebar__wrapper">
                        <div class="sidebar__widget mb-55">
                            <div class="widget__search p-relative">
                                <form action="#">
                                    <input type="text" placeholder="Search...">
                                    <button type="submit"><i class="far fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                        <div class="sidebar__widget mb-55">
                            <div class="sidebar__widget-title mb-25">
                                <h3>Latest Posts</h3>
                            </div>
                            <div class="sidebar__widget-content">
                                <div class="rc__post-wrapper">
                                    <ul>
                                        <li class="d-flex">
                                            <div class="rc__post-thumb mr-20 ">
                                                <a href="blog-details.html"><img
                                                        src="${contextRoot}/static/front/assets/img/blog/sm/blog-sm-1.jpg"
                                                        alt="blog-1"></a>
                                            </div>
                                            <div class="rc__post-content">
                                                <h6>
                                                    <a href="blog-details.html">Make your life
                                                        easy</a>
                                                </h6>
                                                <div class="rc__meta">postbox__comments pt-90
                                                    <span> September 14, 2020</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="d-flex">
                                            <div class="rc__post-thumb mr-20 ">
                                                <a href="blog-details.html"><img
                                                        src="${contextRoot}/static/front/assets/img/blog/sm/blog-sm-2.jpg"
                                                        alt="blog-1"></a>
                                            </div>
                                            <div class="rc__post-content">
                                                <h6>
                                                    <a href="blog-details.html">Feel like home</a>
                                                </h6>
                                                <div class="rc__meta">
                                                    <span>October 01, 2020</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="d-flex">
                                            <div class="rc__post-thumb mr-20 ">
                                                <a href="blog-details.html"><img
                                                        src="${contextRoot}/static/front/assets/img/blog/sm/blog-sm-3.jpg"
                                                        alt="blog-1"></a>
                                            </div>
                                            <div class="rc__post-content">
                                                <h6>
                                                    <a href="blog-details.html">Best thing ever</a>
                                                </h6>
                                                <div class="rc__meta">
                                                    <span>October 05, 2020</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- blog area end -->

    <!-- Cart Area Strat-->
    <section id="editCaseDialog" class="cart-area pt-100 pb-100">
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
                                        <input id="editTitle" type="text"/>
                                    </td>
                                    <td><input id="editName" type="text"/></td>
                                    <td><select id="editClassification"></select></td>
                                    <td><select id="editLocation"></select></td>
                                    <td><input id="editEmail" type="email"></td>
                                    <td>
                                        <textarea name="editMessage" id="editMessage" class="form-control" rows="3"
                                                  placeholder="Text input" style="width: 300px"></textarea>
                                    </td>
                                    <td class="product-thumbnail" id="editImgDiv">
                                        <input type="file" id="editFile" class="imgur" accept="image/*"
                                               data-max-size="5000"/>
                                        <img src="" id="editCoverPhoto" width="200"/>
                                    </td>
                                    <%--                                    <td class="product-thumbnail"><a href="product-details.html"><img src="${contextRoot}/static/front/assets/img/shop/product/product-2.jpg" alt=""></a></td>--%>
                                    <td><input id="editExpiryDate" type="date"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="coupon2">
                                    <button id="editCaseBtn" class="os-btn os-btn-black" style="margin-top: 25px"
                                            name="add_case" type="submit">編輯需求
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
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/static/front/universal/Case.js"></script>
</body>
</html>
