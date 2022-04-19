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
             data-background="${contextRoot}/static/front/assets/img/page-title/page-title-2.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="page__title-inner text-center">
                        <h1>File Not Found</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"> 404
                                        Error page
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

    <!-- error area start -->
    <section class="error__area pt-60 pb-100">
        <div class="container">
            <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2">
                <div class="error__content text-center">
                    <div class="error__number">
                        <h1>404</h1>
                    </div>
                    <span>component not found</span>
                    <h2>Nothing To See Here!</h2>
                    <p>The page are looking for has been moved or doesn’t exist anymore, if you like
                        you can return to our homepage. If the problem persists, please send us an
                        email to <span class="highlight comment">basictheme@gmail.com</span></p>

                    <div class="error__search">
                        <input type="text" placeholder="Enter Your Text...">
                        <button type="submit" class="os-btn os-btn-3 os-btn-black">Search</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- error area end -->

</main>

<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
</body>
</html>
