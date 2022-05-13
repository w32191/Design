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
                <span hidden id="spanId">${Design.id}</span>
                <div class="col-xl-9 col-lg-8">
                    <div class="row">
                        <div class="col-12">
                        </div>
                    </div>
                    <div class="postbox__title mb-55">


                        <c:if test="${Design.fkMember.id eq memberId}">
                            <div id="table_tbody" class="coupon2">
                                <div class="coupon-all" style="margin-top: 0 ; padding-bottom: 25px">
                                    <button id="editDesignBtn"
                                            onclick="location.href='${contextRoot}/F/editDesignService/${Design.id}'"
                                            class="os-btn os-btn-black" name="add_cart" type="submit">
                                        編輯案件
                                    </button>
                                </div>
                            </div>
                        </c:if>

                        <h1><a href="">${Design.title}</a></h1>
                        <div class="blog__meta">
                            <span>${Design.location}</span><br/>
                            <span>${Design.style}</span><br/>
                            <span>By <a href="">${Design.name}</a></span>
                            <span>/ ${Design.createTime}</span>
                        </div>
                    </div>
                    <div class="postbox__thumb w-img">
                        <img src="${Design.coverPhoto}" alt="">
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
                                    <p><i class="fas fa-quote-right"></i>${Design.message}</p>
                                </blockquote>
                            </div>
                            <div class="postbox__thumb w-img">
                                <img src="${Design.photo_1}" alt="">
                            </div>
                            <br/>
                            <div class="postbox__thumb w-img">
                                <img src="${Design.photo_2}" alt="">
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
                                    <%--                                    <c:forEach items="Design" var="design"--%>
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
                                        <c:forEach items="${DesignList}" var="design" begin="0" end="10">
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
                                                        <a href="${design.id}">
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
                                        <%--                                        <li class="d-flex">--%>
                                        <%--                                            <div class="rc__post-thumb mr-20 ">--%>
                                        <%--                                                <a href="blog-details.html"><img--%>
                                        <%--                                                        src="${contextRoot}/static/front/assets/img/blog/sm/blog-sm-2.jpg"--%>
                                        <%--                                                        alt="blog-1"></a>--%>
                                        <%--                                            </div>--%>
                                        <%--                                            <div class="rc__post-content">--%>
                                        <%--                                                <h6>--%>
                                        <%--                                                    <a href="blog-details.html">Feel like home</a>--%>
                                        <%--                                                </h6>--%>
                                        <%--                                                <div class="rc__meta">--%>
                                        <%--                                                    <span>October 01, 2020</span>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </li>--%>
                                        <%--                                        <li class="d-flex">--%>
                                        <%--                                            <div class="rc__post-thumb mr-20 ">--%>
                                        <%--                                                <a href="blog-details.html"><img--%>
                                        <%--                                                        src="${contextRoot}/static/front/assets/img/blog/sm/blog-sm-3.jpg"--%>
                                        <%--                                                        alt="blog-1"></a>--%>
                                        <%--                                            </div>--%>
                                        <%--                                            <div class="rc__post-content">--%>
                                        <%--                                                <h6>--%>
                                        <%--                                                    <a href="blog-details.html">Best thing ever</a>--%>
                                        <%--                                                </h6>--%>
                                        <%--                                                <div class="rc__meta">--%>
                                        <%--                                                    <span>October 05, 2020</span>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>

    </section>
    <!-- blog area end -->

    <!-- Cart Area Strat-->

    <!-- Cart Area End-->

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
