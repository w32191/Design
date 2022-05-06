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
                        <h1>News & Blog</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> Blog 3
                                        Column
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

    <!-- blog area start -->
    <section class="blog__area pt-0 pb-100" style="padding-top: 0">
        <div class="row">
            <div class="col-12">
                <div class="coupon-all" style="margin-top: 25px;padding-bottom: 25px">
                    <div class="coupon2">
                        <button id="SearchAllCases" class="os-btn os-btn-black" name="add_cart" type="submit">所有案件</button>
                        <button onclick="location.href='${contextRoot}/F/UpdateCase'" class="os-btn os-btn-black" name="add_cart" type="submit">新增案件</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row" id = "blogCase">
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="blog__wrapper">
                        <div class="blog__item blog__border-bottom mb-60 pb-60">
                            <div class="blog__thumb fix">
                                <a href="blog-details.html" class="w-img"><img
                                        src="${contextRoot}/static/front/assets/img/blog/blog-big-2.jpg" alt="blog"></a>
                            </div>
                            <div class="blog__content">
                                <h4><a href="blog-details.html">Anteposuerit litterarum formas.</a>
                                </h4>
                                <div class="blog__meta">
                                    <span>By <a href="#">Shahnewaz Sakil</a></span>
                                    <span>/ September 14, 2017</span>
                                </div>
                                <p>A Capitalize on low hanging fruit to identify a ballpark value
                                    added activity to beta test. Override the digital divide with
                                    [...]</p>
                                <a href="blog-details.html" class="os-btn">read more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="blog__item blog__border-bottom mb-60 pb-60">
                        <div class="blog__thumb fix">
                            <a href="blog-details.html" class="w-img"><img
                                    src="${contextRoot}/static/front/assets/img/blog/blog-big-3.jpg" alt="blog"></a>
                        </div>
                        <div class="blog__content">
                            <h4><a href="blog-details.html">Hanging fruit to identify a ballpark</a>
                            </h4>
                            <div class="blog__meta">
                                <span>By <a href="#">Shahnewaz Sakil</a></span>
                                <span>/ September 14, 2017</span>
                            </div>
                            <p>A Capitalize on low hanging fruit to identify a ballpark value added
                                activity to beta test. Override the digital divide with [...]</p>
                            <a href="blog-details.html" class="os-btn">read more</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="shop-pagination-wrapper">
                        <div class="basic-pagination">
                            <ul>
                                <li><a href="#"><i class="fal fa-angle-left"></i></a></li>
                                <li><a href="#">01</a></li>
                                <li class="active"><a href="#">02</a></li>
                                <li><a href="#">03</a></li>
                                <li><a href="#"><i class="fas fa-ellipsis-h"></i></a></li>
                                <li><a href="#"><i class="fal fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- blog area end -->
</main>

<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
<script src="${contextRoot}/static/front/universal/Case.js"></script>

</body>
</html>
