<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>DESIGN & DECOR</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- CSS include page--%>
<jsp:include page="../IncludePage/staticPage/FontCssPage.jsp" />

<link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
<link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>

<style>
    .showcoupon{
        position: relative;
        display: inline-block;
        text-transform: uppercase;
        text-align: center;
        font-weight: 300;
        height: 50px;
        line-height: 46px;
        padding: 0 30px;
        border: 1px solid #ebebeb;
        color: #6f7172;
        background: transparent;
        z-index: 1;
        font-size: 10px;
    }
</style>
</head>

<body>
	<jsp:include page="../IncludePage/layoutPage/headerPage.jsp" />

	<main>
		<!-- page title area start -->
		<section class="page__title p-relative d-flex align-items-center"
			data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="page__title-inner text-center">
							<h1>Your Cart</h1>
							<div class="page__title-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb justify-content-center">
										<li class="breadcrumb-item"><a href="index.html">Home</a></li>
										<li class="breadcrumb-item active" aria-current="page">
											Cart</li>
									</ol>
									<c:choose>
										<c:when test="${cartList.size() < 1}">
										 <div style="margin-top: 10px; color: #bc8246; font-weight: 400;font-size: 14px; font-family: Poppins, sans-serif;">
										    <span>您的購物車是空的</span> |
										    <a href="Product/"><button type="button" padding: 5px;">
                                                回到商城<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                                                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                                                  </svg>
                                            </button></a>
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

		<!-- Cart Area Strat-->
		<section class="cart-area pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<c:choose>
							<c:when test="${cartList.size() > 0}">
								<form action="checkoutorderlist" method="POST">
									<div class="table-content table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th class="product-thumbnail">商品照</th>
													<th class="cart-product-name">商品</th>
													<th class="cart-product-name" style="width:86px;">規格</th>
													<th class="product-price" style="width:90px;">單價</th>
													<th class="product-quantity">數量</th>
													<th class="product-subtotal">小計</th>
													<th class="product-remove" style="width:55px;">刪除</th>
												</tr>
											</thead>
											<tbody id="theTBody">

												<c:forEach var="cart" items="${cartList}">
													<tr>
														<td class="product-thumbnail">
															<%--   <a href="product-details.html"--%> <%--   data-product-id="${cart.fkProduct.id}">--%>
															<%--   <img src="${cart.fkProduct.image01}">--%> <%--   </a>--%>
															<div class="product__modal-img product__thumb w-img">
																<a
																	href="product/product-details?id=${cart.fkProduct.id}"
																	data-product-id="${cart.fkProduct.id}"> <img
																	src="${cart.fkProduct.image01}"
																	style="border: 1px #0c0c0c solid" alt="圖片異常">
																</a>
																<c:if
																	test='${discountMap.containsKey(cart.fkProduct.id)}'>
																	<div class="product__sale ">
																		<span class="new">活動</span> <span class="percent">-${discountMap.get(cart.fkProduct.id)}%</span>
																	</div>
																</c:if>
															</div>
														</td>

														<td class="product-name" name="pname"><a
															href="product/product-details?id=${cart.fkProduct.id}">${cart.fkProduct.name}</a>
														</td>
														<td class="product-name" name="pmodel">
															${cart.fkProduct.model}</td>

														<td class="product-price product__price-2"><c:choose>
																<c:when
																	test='${discountMap.containsKey(cart.fkProduct.id)}'>
                                                                    $<span
																		class="price currentPrice">${(cart.fkProduct.price*(100-discountMap.get(cart.fkProduct.id))/100).intValue()}</span>
																	<br>
																	<span class="old-price">$${cart.fkProduct.price}</span>
																	<br>
																	<span class="text-danger">限時活動:</span>
																	<br>
																	<span class="text-danger">${discountMap.get(cart.fkProduct.id)}%
																		OFF</span>
																</c:when>
																<c:otherwise>
                                                                    $<span
																		class="price currentPrice">${cart.fkProduct.price}</span>
																</c:otherwise>
															</c:choose></td>

														<td class="product-quantity">
															<div class="cart-plus-minus">
																<input type="text" class="amount"
																	value="${cart.tempMount}" name="uamount" />
															</div>
														</td>

														<td class="product-subtotal"><c:choose>
																<c:when
																	test='${discountMap.containsKey(cart.fkProduct.id)}'>
                                                    $<span id="tprice"
																		name="tprice">${(cart.fkProduct.price*(100-discountMap.get(cart.fkProduct.id))/100*cart.tempMount).intValue()}</span>
																</c:when>
																<c:otherwise>
                                                    $<span id="tprice"
																		name="tprice">${cart.fkProduct.price*cart.tempMount}</span>
																</c:otherwise>
															</c:choose></td>

														<td class="product-remove">
															<!-- <a href="deleteshoppingcart?id=${cart.id}"> --> <i
															class="fa fa-times" style="cursor:pointer;"></i> <!--  </a> -->
														</td>

														<td class="product-cartid" hidden=""><input
															type="hidden" id="cartid" class="cartid"
															value="${cart.id}" name="cartid" /></td>

													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<div class="row">
										<div class="col-12">
											<div class="coupon-all">
												<div class="coupon">
													<input id="coupon_code" class="input-text" style="color: #6F7172;"
														name="coupon_code" value="" placeholder="折扣碼"
														type="text">
													<button class="os-btn os-btn-black" id="submit"
														name="apply_coupon" type="submit" style="font-size:13px;">使用折價券</button>
												</div>
											</div>
										</div>
									</div>
                                    <div class="row" style="height: 50px;">
                                        <div style="margin-top: 10px; margin-left: 20px; color: brown;">
											<span class="text-danger" id="couponContext" ></span>
										</div>
                                    </div>
									<div class="row">
										<!-- <div style="margin-top: 10px; margin-left: 20px; color: brown;">
											<span class="text-danger" id="couponContext"></span>
										</div> -->
                                        <div style="margin-top: 50px; margin-left: 20px;">
                                            <button class="showcoupon" id="coupon1" type="button" >一鍵</button>
                                            <button class="showcoupon" id="coupon2" type="button" >輸入</button>
                                            <button class="showcoupon" id="coupon3" type="button" >折扣碼</button>
                                        </div>
										<div class="col-md-5 ml-auto">
											<div class="cart-page-total">
												<h5>購物車金額</h5>
												<ul class="mb-20">
													<li>小計 <span id="subtotal"></span></li>
													<li>折扣 <span><input
															style="border: none; outline: none; text-align: right; color: #6F7172;"
															type="text" id="discount" name="discount" value="$0"></span></li>
													<li>總計 <span id="total"></span></li>
												</ul>
												<button class="os-btn" type="submit" style="font-size:14px; font-weight: 600;">確認</button>
											</div>
										</div>
									</div>
								</form>
							</c:when>
						</c:choose>

					</div>
				</div>
			</div>
		</section>
		<!-- Cart Area End-->
	</main>


	<%-- footer page --%>
	<jsp:include page="../IncludePage/layoutPage/footerPage.jsp" />

	<!-- JavaScript -->
	<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp" />

    <script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
    <script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
	<script src="${contextRoot}/static/front/universal/ShoppingCart.js"></script>
</body>

</html>
