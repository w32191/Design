<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${activity.subject}</title>
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
                                    <li class="breadcrumb-item active"
                                        aria-current="page">${activity.endDate}
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
                                                    <div class="add-cart p-absolute transition-3">
                                                        <a id="newArrAddToCartBtn${product.id}">+
                                                            Add to Cart</a>
                                                    </div>
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



</main>

<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>

<script>
  $('body').on('click', 'a[id^=newArrAddToCartBtn]', function () {

    let id = $(this).attr('id').split("newArrAddToCartBtn")[1];

    $.get("/Design/F/addshoppingcart", {"fkProduct": id, "amount": 1})
    {
      Swal.fire({
        text: '已加入購物車',
        showConfirmButton: false,
        timer: 1000
      })

    }
  })
</script>
</body>
</html> 
