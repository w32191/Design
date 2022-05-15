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
                        <h1>找設計</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="${contextRoot}/F/Activity/index">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        <a href="${contextRoot}/F/Design"> Design</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%--    <c:if test="${account != null}">--%>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="coupon-all" style="margin-top: 25px;padding-bottom: 25px">
                        <div class="coupon2">
                            <button onclick="location.href='${contextRoot}/F/addDesignService'" class="os-btn os-btn-black"
                                    name="add_cart" type="submit">新增設計
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--    </c:if>--%>
    <!-- page title area end -->

    <!-- blog area start -->
    <section class="blog__area pt-100 pb-100" style="padding-top: 28px">
        <div class="container">

            <div class="row">
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
                                <h3>Categories</h3>
                            </div>
                            <div class="sidebar__widget-content">
                                <div class="categories">
                                    <div id="accordion">
                                        <div class="card">
                                            <div class="card-header white-bg" id="style">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn"
                                                            data-toggle="collapse"
                                                            data-target="#collapseAccessories"
                                                            aria-expanded="false"
                                                            aria-controls="collapsecloth">
                                                        風格
                                                    </button>
                                                </h5>
                                            </div>

                                            <div id="collapseAccessories" class="collapse"
                                                 aria-labelledby="style"
                                                 data-parent="#accordion">
                                                <div class="card-body">
                                                    <div class="categories__list">
                                                        <ul id="styleList">
                                                            <%--                                                            <li><a href="#">Catagories 1</a></li>--%>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header white-bg" id="location">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapsecloth"
                                                            aria-expanded="false"
                                                            aria-controls="collapsecloth">
                                                        地區
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapsecloth" class="collapse"
                                                 aria-labelledby="cloth" data-parent="#accordion">
                                                <div class="card-body">
                                                    <div class="categories__list">
                                                        <ul id="locationList">
<%--                                                            <li><a href="#">Catagories 1</a></li>--%>
<%--                                                            <li><a href="#">Catagories 2</a></li>--%>
<%--                                                            <li><a href="#">Catagories 3</a></li>--%>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header white-bg" id="men">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapsemen"
                                                            aria-expanded="false"
                                                            aria-controls="collapsemen">
                                                        設計團隊
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapsemen" class="collapse"
                                                 aria-labelledby="men" data-parent="#accordion">
                                                <div class="card-body">
                                                    <div class="categories__list">
                                                        <ul>
                                                            <li><a href="#">Catagories 1</a></li>
                                                            <li><a href="#">Catagories 2</a></li>
                                                            <li><a href="#">Catagories 3</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__widget mb-55">
                            <div class="sidebar__widget-title mb-25">
                                <h3>New Design</h3>
                            </div>
                            <div class="sidebar__widget-content">
                                <div class="rc__post-wrapper">
                                    <ul>
                                        <c:forEach items="${DesignStyleList}" var="design" begin="0" end="10">
                                            <li class="d-flex">
                                                    <%--                                                <div class="rc__post-thumb mr-20 ">--%>
                                                    <%--                                                    <a href="blog-details.html">--%>
                                                <img href="${design.id}"
                                                     src="${design.coverPhoto}" width="50%"
                                                     alt="blog-1"
                                                     STYLE="margin-right: 10px">
                                                    <%--                                                    </a>--%>
                                                    <%--                                                </div>--%>
                                                <div class="rc__post-content">
                                                    <h6>
                                                        <a href="${contextRoot}/F/viewDesignService/${design.id}">
                                                                ${design.title}</a>
                                                    </h6>
                                                    <div class="rc__meta">
                                                        <span>${design.name}</span>
                                                        <span>${design.style}</span>
                                                        <span>${design.createTime}</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-8">
                    <div class="blog__wrapper" id="designBlog">
                        <div class="blog__item blog__border-bottom mb-60 pb-60">
                            <div class="blog__thumb fix">
                                <a href="blog-details.html" class="w-img" id="designCoverPhoto"><img
                                        src="${contextRoot}/static/front/assets/img/blog/blog-big-2.jpg" alt="blog"></a>
                            </div>
                            <div class="blog__content">
                                <h4 class="blog__title" id="designTitle"><a href="blog-details.html">Anteposuerit
                                    litterarum formas.</a></h4>
                                <div class="blog__meta">
                                    <span>By <a href="#" id="designName">Shahnewaz Sakil</a></span>
                                    <span id="designCreateTime">/ September 14, 2017</span>
                                </div>
                                <p id="designMessage">A Capitalize on low hanging fruit to identify a ballpark value
                                    added activity to beta test. Override the digital divide with
                                    additional clickthroughs from DevOps. Nanotechnology immersion
                                    along the information highway will close the [...]</p>
                                <a href="blog-details.html" class="os-btn" id="designReadMoreBtn">read more</a>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-xl-12">
                                <div class="shop-pagination-wrapper">
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
                                </div>
                            </div>
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
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/static/front/universal/DesignService.js"></script>
</body>
</html>
