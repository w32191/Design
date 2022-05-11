<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <!doctype html>
            <html class="no-js" lang="zxx">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="x-ua-compatible" content="ie=edge">
                <title>Outstock - Clean, Minimal eCommerce HTML5 Template </title>
                <meta name="description" content="">
                <meta name="viewport" content="width=device-width, initial-scale=1">

                <%-- CSS include page--%>
                    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp" />
                    <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
                    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <link href="css/jquery-ui.min.css" rel="stylesheet" />
                    <link href="css/custom.css" rel="stylesheet" />
                    <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
                    <style type="text/css">
                        tr.detail {
                            display: none;
                            width: 100%;
                        }

                        tr.detail div {
                            display: none;
                        }

                        .showmore:hover {
                            cursor: pointer;
                        }

                        th {
                            text-align: center;
                        }

                        #showadd {
                            position: relative;
                            display: inline-block;
                        }

                        #showadd:hover {
                            cursor: pointer;
                        }

                        #showadd:hover:before {
                            content: attr(data-showtip);
                            display: inline-block;
                            background: #222;
                            color: #fff;
                            padding: 10px;
                            border-radius: .4em;
                            position: absolute;
                            left: 100;
                            bottom: 100%;
                            margin-left: 8px;
                            font-size: .9em;
                            white-space: pre;
                        }

                        #showadd:hover:after {
                            content: "";
                            position: absolute;
                            top: -40%;
                            left: 70%;
                            width: 0;
                            height: 0;
                            border: 17px solid transparent;
                            border-top-color: #222;
                            border-bottom: 0;
                            border-left: 0;
                            margin-left: -10px;
                            margin-bottom: -20px;
                        }
                    </style>

            </head>

            <body>
                <%--Header Page--%>
                    <jsp:include page="../IncludePage/layoutPage/headerPage.jsp" />

                    <main>

                        <!-- page title area start -->
                        <section class="page__title p-relative d-flex align-items-center"
                            data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="page__title-inner text-center">
                                            <h1>Order Record</h1>
                                            <div class="page__title-breadcrumb">
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb justify-content-center">
                                                        <li class="breadcrumb-item"><a href="index.html" style="color: #323232;">Home</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">
                                                            Order Record
                                                        </li>
                                                    </ol>
                                                    <c:choose>
										                <c:when test="${orderRecord.size() < 1}">
										                   <div style="margin-top: 10px; color: #bc8246; font-weight: 400;font-size: 14px; font-family: Poppins, sans-serif;">
										                    <span>查無訂購紀錄</span> |
										                    <a href="Product/"><button type="button" style="padding: 5px; color: #bc8246;">
                                                            回到商城<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                                                            <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                                                            </svg></button></a>
										                   </div>
										                </c:when>
									                </c:choose>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- page title area end -->

                        <!-- Record Area Strat-->
                        <section class="cart-area pt-100 pb-100">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <!-- <form action="#"> -->
                                        <div class="table-content table-responsive">
                                           <c:choose>
                                             <c:when test="${orderRecord.size() > 0}">
                                              <div class="wrapper">
                                                <table class="table mytable" width="100%" style="table-layout:fixed">
                                                    <tr>
                                                        <th class="product-thumbnail">訂單編號</th>
                                                        <th class="cart-product-name">訂購日期</th>
                                                        <th class="product-price">訂購總額</th>
                                                        <th class="product-quantity">訂單明細</th>
                                                        <th class="product-subtotal">配送方式</th>
                                                        <th class="product-remove">訂單狀態</th>
                                                    </tr>
                                                    <c:forEach var="record" items="${orderRecord}">
                                                        <tr>
                                                            <td class="product-name">
                                                                ${record.id}
                                                            </td>
                                                            <td class="product-name">
                                                                <fmt:formatDate pattern="yyyy-MM-dd"
                                                                    value="${record.orderDate}" />
                                                            </td>
                                                            <td class="product-price">
                                                                <span class="amount">$${record.total}</span>
                                                            </td>
                                                            <!-- <td class="product-quantity">
                                                            <button  class="showmore">查看</button>
                                                            </td> -->
                                                            <td><a class="showmore">Show More</a></td>
                                                            <td class="product-name">
                                                                <span id="showadd"
                                                                    data-showtip="${record.add}">宅配</span>
                                                            </td>
                                                            <td class="product-name">
                                                                ${record.shipState}
                                                            </td>
                                                            <td class="product-name" id="add" hidden="">
                                                                ${record.add}
                                                            </td>
                                                            <td class="product-name" id="imforId" hidden="">
                                                                ${record.id}
                                                            </td>
                                                        </tr>
                                                    <!-- show more star-->
                                                        <tr class="detail">
                                                            <td colspan="6">
                                                                <div>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="product-thumbnail">商品照</th>
                                                                                <th class="cart-product-name">商品</th>
                                                                                <th class="cart-product-name">規格</th>
                                                                                <th class="product-quantity">數量</th>
                                                                                <th class="product-price">單價</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="orderList">
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    <!-- show more star-->
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                            <!------分頁 ------->
                                            <div class="container" style="text-align: center;">
                                                <ul class="pagination">
                                                    <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

                                                            <li class="page-item">
                                                                <a href="/Design/F/orderrecord?p=${pageNumber}">
                                                                 <c:out value="${pageNumber}"></c:out>
                                                                </a>
                                                            </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <!------分頁 ------->
                                        </div>
                                    </div>
                                    <!-- </form> -->
                                </div>
                            </div>
                        </section>
                        <!-- Record Area End-->
                    </main>


                    <%-- footer page --%>
                        <jsp:include page="../IncludePage/layoutPage/footerPage.jsp" />

                        <!-- JavaScript -->
                        <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
                        <script src="http://code.jquery.com/jquery.js"></script>
                        <script src="js/jquery-ui.min.js"></script>
                        <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
                        <script>

                            // Show Order Record 
                            $(function () {
                                $("a.showmore").click(function (e) {
                                    e.preventDefault();
                                    // We break and store the result so we can use it to hide
                                    // the row after the slideToggle is closed
                                    var targetrow = $(this).closest('tr').next('.detail');
                                    targetrow.show().find("div").slideToggle("fast", function () {
                                        if (!$(this).is(":visible")) {
                                            targetrow.hide();
                                        }
                                    });
                                });
                            });

                            $(".showmore").on("click", function (e) {
                                
                                let orderList = $(this).closest("tr").next("tr").find("tbody");
                                $(orderList).html('');

                                let id = $(this).parent("td").nextAll().filter("#imforId").text();
                                let imforId = Number(id);
                                console.log(imforId);
                                // console.log(typeof imforId);
                                // console.log(id);
                                $.ajax({
                                    url: "orderProduct?fkOrderImformation=" + imforId,
                                    type: "GET",
                                    // data:{
                                    //     fkOrderImformation:imforId
                                    // },
                                    success: function (result) {

                                        product_data="";

                                        $.each(result, function (index, product) {
                                            console.log(product.fkProduct.name);
                                            product_data +="<tr>"
                                            product_data +="<td class='product-thumbnail'><img src='"+product.fkProduct.image01+"'></td>"
                                            product_data +="<td class='product-name' style='vertical-align:middle;'>"+product.fkProduct.name+"</td>"
                                            product_data +="<td class='product-name'style='vertical-align:middle;'>"+product.fkProduct.model+"</td>"
                                            product_data +="<td class='product-price product__price-2'style='vertical-align:middle;'>"+product.orderMount+"</td>"
                                            product_data +="<td class='product-price product__price-2'style='vertical-align:middle;'>$"+product.price+"</td>"
                                            product_data += "</tr>"
                                            });
                                        $(orderList).append(product_data);
                                    },
                                    error: function (err) {
                                        console.log(err);
                                    }
                                })
                            })

                        </script>

                        <jsp:include page="../IncludePage/staticPage/FontJsPage.jsp" />

            </body>

            </html>