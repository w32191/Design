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
    <!-- blog area start -->
    <section class="blog__area pt-55">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-8">
                    <div class="postbox__title mb-55">
                        <h1><a href="blog.html">Anteposuerit litterarum formas.</a></h1>
                        <div class="blog__meta">
                            <span>By <a href="#">Shahnewaz Sakil</a></span>
                            <span>/ September 14, 2017</span>
                        </div>
                    </div>
                    <div class="postbox__thumb w-img">
                        <img src="${contextRoot}/static/front/assets/img/blog/blog-big.jpg" alt="">
                    </div>
                    <div class="postbox__wrapper mb-70">
                        <div class="postbox__text mt-65">
                            <p>Diga, Koma and Torus are three kitchen utensils designed for <span
                                    class="highlight theme">Ommo</span>, a new design-oriented brand
                                introduced at the Ambiente show in February 2016. <span
                                        class="highlight">Minimalist approach, bright colors, stainless steel and matte plastic</span>,
                                abstract shapes and curved lines are the defining features of these
                                products designed to be extremely functional, user-friendly and fun.
                            </p>
                        </div>
                        <div class="postbox__text">
                            <p>Diga is a two-color melamine salad bowl where vegetables can be
                                washed, drained and served. The disk at the bottom of the bowl can
                                be turned counterclockwise to drain water when washing vegetables
                                and it can be turned clockwise to lock the drain and hold condiments
                                in the bowl when serving.</p>
                        </div>
                        <article class="postbox format-quote mt-45 mb-50">
                            <div class="postbox__quote">
                                <blockquote>
                                    <p><i class="fas fa-quote-right"></i> Many desktop publishing
                                        packages and web page editors now use Lorem Ipsum as their
                                        default model text, and a search for 'lorem ipsum' will
                                        uncover many web sites still in their infancy. </p>
                                </blockquote>
                            </div>
                        </article>
                        <div class="postbox__details-img w-img mb-60">
                            <img src="${contextRoot}/static/front/assets/img/blog/blog-details-sm.jpg" alt="">
                        </div>
                        <div class="postbox__text">
                            <p>Koma and Torus are two tea infusers, each with an original design and
                                a concealed function. Koma has a round base and a long stainless
                                steel-trimmed handle which offers a comfortable grip and allows.
                            </p>
                        </div>
                        <div class="postbox__text">
                            <p>And the brushed steel cover opens and closes at the touch of a finger
                                to easily fill and empty the infuser. The perfect way to enjoy
                                brewing tea. Torus is donut-shaped and can cling to any cup. It is
                                accompanied by a case that can contain up to three different
                                diffusers and can be used for dry storage of loose tea.
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
                    <div class="postbox__comments pt-90">
                        <div class="postbox__comment-title mb-30">
                            <h3>Comments (32)</h3>
                        </div>
                        <div class="latest-comments mb-30">
                            <ul>
                                <li>
                                    <div class="comments-box">
                                        <div class="comments-avatar">
                                            <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-1.png" alt="">
                                        </div>
                                        <div class="comments-text">
                                            <div class="avatar-name">
                                                <h5>Siarhei Dzenisenka</h5>
                                                <span> - 3 months ago </span>
                                                <a class="reply" href="#">Leave Reply</a>
                                            </div>
                                            <p>Many desktop publishing packages and web page editors
                                                now use Lorem Ipsum as their default model text, and
                                                a search for <span>“lorem ipsum”</span> will uncover
                                                many web sites still in their infancy. Various
                                                versions have evolved over the years, sometimes by
                                                accident, sometimes on purpose.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="children">
                                    <div class="comments-box">
                                        <div class="comments-avatar">
                                            <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-2.png" alt="">
                                        </div>
                                        <div class="comments-text">
                                            <div class="avatar-name">
                                                <h5>Julias Roy</h5>
                                                <span> - 6 months ago </span>
                                                <a class="reply" href="#">Leave Reply</a>
                                            </div>
                                            <p>Many desktop publishing packages and web page editors
                                                now use Lorem Ipsum as their default model text, and
                                                a search for <span>“lorem ipsum”</span> will uncover
                                                many web sites still in their infancy. </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="comments-box">
                                        <div class="comments-avatar">
                                            <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-3.png" alt="">
                                        </div>
                                        <div class="comments-text">
                                            <div class="avatar-name">
                                                <h5>Arista Williamson</h5>
                                                <span> - 6 months ago </span>
                                                <a class="reply" href="#">Leave Reply</a>
                                            </div>
                                            <p>Many desktop publishing packages and web page editors
                                                now use Lorem Ipsum as their default model text, and
                                                a search for <span>“lorem ipsum”</span> will uncover
                                                many web sites still in their infancy. Various
                                                versions have evolved over the years, sometimes by
                                                accident, sometimes on purpose.</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
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
                                <h3>Product Categories</h3>
                            </div>
                            <div class="sidebar__widget-content">
                                <div class="categories">
                                    <div id="accordion">
                                        <div class="card">
                                            <div class="card-header white-bg" id="accessories">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn"
                                                            data-toggle="collapse"
                                                            data-target="#collapseAccessories"
                                                            aria-expanded="true"
                                                            aria-controls="collapseAccessories">
                                                        Accessories
                                                    </button>
                                                </h5>
                                            </div>

                                            <div id="collapseAccessories" class="collapse show"
                                                 aria-labelledby="accessories"
                                                 data-parent="#accordion">
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
                                        <div class="card">
                                            <div class="card-header white-bg" id="cloth">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapsecloth"
                                                            aria-expanded="false"
                                                            aria-controls="collapsecloth">
                                                        Clothing
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapsecloth" class="collapse"
                                                 aria-labelledby="cloth" data-parent="#accordion">
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
                                        <div class="card">
                                            <div class="card-header white-bg" id="men">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapsemen"
                                                            aria-expanded="false"
                                                            aria-controls="collapsemen">
                                                        Men's
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
                                        <div class="card">
                                            <div class="card-header white-bg" id="music">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapsemusic"
                                                            aria-expanded="false"
                                                            aria-controls="collapsemusic">
                                                        Music
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapsemusic" class="collapse"
                                                 aria-labelledby="music" data-parent="#accordion">
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
                                        <div class="card">
                                            <div class="card-header white-bg" id="decoration">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapseDecoration"
                                                            aria-expanded="false"
                                                            aria-controls="collapseDecoration">
                                                        Decoration
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapseDecoration" class="collapse"
                                                 aria-labelledby="decoration"
                                                 data-parent="#accordion">
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
                                        <div class="card">
                                            <div class="card-header white-bg" id="chair">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapsechair"
                                                            aria-expanded="false"
                                                            aria-controls="collapsechair">
                                                        Chair
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapsechair" class="collapse"
                                                 aria-labelledby="chair" data-parent="#accordion">
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
                                        <div class="card">
                                            <div class="card-header white-bg" id="light">
                                                <h5 class="mb-0">
                                                    <button class="shop-accordion-btn collapsed"
                                                            data-toggle="collapse"
                                                            data-target="#collapselight"
                                                            aria-expanded="false"
                                                            aria-controls="collapselight">
                                                        Lighting
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapselight" class="collapse"
                                                 aria-labelledby="light" data-parent="#accordion">
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
                                                <div class="rc__meta">
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
                        <div class="sidebar__widget mb-55">
                            <div class="sidebar__widget-title mb-25">
                                <h3>Recent Comments</h3>
                            </div>
                            <div class="sidebar__widget-content">
                                <div class="rc__comments">
                                    <ul>
                                        <li class="d-flex mb-20">
                                            <div class="rc__comments-avater mr-15">
                                                <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-3.png"
                                                     alt="">
                                            </div>
                                            <div class="rc__comments-content">
                                                <h6>Salim Rana</h6>
                                                <p>Hi, this is a comment....</p>
                                                <span>on <span class="highlight comment"> Hello world!</span></span>
                                            </div>
                                        </li>
                                        <li class="d-flex mb-20">
                                            <div class="rc__comments-avater mr-15">
                                                <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-3.png"
                                                     alt="">
                                            </div>
                                            <div class="rc__comments-content">
                                                <h6>Shahnewaz Sakil</h6>
                                                <p>Hi, this is a comment....</p>
                                                <span>on <span class="highlight comment"> Hello world!</span></span>
                                            </div>
                                        </li>
                                        <li class="d-flex mb-20">
                                            <div class="rc__comments-avater mr-15">
                                                <img src="${contextRoot}/static/front/assets/img/blog/comments/avater-3.png"
                                                     alt="">
                                            </div>
                                            <div class="rc__comments-content">
                                                <h6>John Deo</h6>
                                                <p>Hi, this is a comment....</p>
                                                <span>on <span class="highlight comment"> Hello world!</span></span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__widget mb-55">
                            <div class="sidebar__widget-title mb-25">
                                <h3>Archives</h3>
                            </div>
                            <div class="sidebar__widget-content">
                                <div class="sidebar__links">
                                    <ul>
                                        <li><a href="#">December 2013</a></li>
                                        <li><a href="#"> November 2013</a></li>
                                        <li><a href="#"> September 2013</a></li>
                                        <li><a href="#">November 2012</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__widget mb-55">
                            <div class="sidebar__widget-title mb-25">
                                <h3>Meta</h3>
                            </div>
                            <div class="sidebar__widget-content">
                                <div class="sidebar__links">
                                    <ul>
                                        <li><a href="#">Log in</a></li>
                                        <li><a href="#"> Entries RSS</a></li>
                                        <li><a href="#"> Comments RSS</a></li>
                                        <li><a href="#">WordPress.org</a></li>
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
</main>

<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
</body>
</html>
