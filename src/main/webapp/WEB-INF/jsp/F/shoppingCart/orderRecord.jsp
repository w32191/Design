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
                                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">
                                                            Order Record
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

                        <!-- Record Area Strat-->
                        <section class="cart-area pt-100 pb-100">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <!-- <form action="#"> -->
                                        <div class="table-content table-responsive">
                                            <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
                                            <!-- <div class="col-12"> -->
                                            <div class="wrapper">
                                                <!-- <header>
                                            <div class="container">
                                            <h1 class="col-lg-9">How to slideToggle a table row</h1>
                                            </div>
                                            </header>
                                           <div class="container">
                                            <h5>Author: Julian Hansen</h5> -->
                                                <table class="table mytable" width="100%" style="table-layout:fixed">
                                                    <tr>
                                                        <th class="product-thumbnail">訂單編號</th>
                                                        <th class="cart-product-name">訂購日期</th>
                                                        <th class="product-price">訂購總額</th>
                                                        <th class="product-quantity">訂單明細</th>
                                                        <th class="product-subtotal">配送方式</th>
                                                        <th class="product-remove">配送狀態</th>
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
                                                        <tr class="detail">
                                                            <td colspan="6">
                                                                <div>
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="product-thumbnail">商品照</th>
                                                                                <th class="cart-product-name">商品</th>
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
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
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
                                    targetrow.show().find("div").slideToggle("slow", function () {
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
                                            product_data +="<td class='product-name'>"+product.fkProduct.name+"</td>"
                                            product_data +="<td class='product-price product__price-2'>"+product.orderMount+"</td>"
                                            product_data +="<td class='product-price product__price-2'>$"+product.price+"</td>"
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