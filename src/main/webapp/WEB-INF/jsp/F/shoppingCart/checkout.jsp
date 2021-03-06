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

    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>

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
                        <h1>Checkout</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Checkout
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

    <!-- coupon-area start -->
    <section class="coupon-area pt-100 pb-30" style="padding-top: 50px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="coupon-accordion">
                        <!-- ACCORDION START -->
                        <h3></h3>
                        <!-- ACCORDION END -->
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="coupon-accordion">
                        <!-- ACCORDION START -->
                        <h3></h3>
                        <!-- ACCORDION END -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- coupon-area end -->
    <!-- checkout-area start -->
    <section class="checkout-area pb-70">
        <div class="container">
            <!-- <form action="#"> -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="checkbox-form ">
                            <h3>????????????</h3>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>????????? <span
                                                class="required">*</span></label>
                                        <input type="text" name="recipient" id="recipient" placeholder=""/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>???????????? <span class="required">*</span></label>
                                        <input type="text" name="phone" id="phone" placeholder=""/>
                                    </div>
                                </div>
                                <div class="col-md-12" style="height: 30px;">
                                    <div class="checkout-form-list">
                                        <label>???????????? 
                                            <span class="required">*</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="country-select">
                                        <label>???/??? 
                                            <!-- <span class="required">*</span> -->
                                        </label>
                                        <select id="country"></select>
                                        <!-- <input type="text" placeholder=""/> -->
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="country-select">
                                        <label>???/???
                                            <!-- <span class="required">*</span> -->
                                        </label>
                                        <select id="district"></select>
                                        <!-- <input type="text" placeholder=""/> -->
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <input type="text" id="street" placeholder="????????????"/>
                                    </div>
                                </div>
                                <div style="display: none;">
                                    <input type="text" id="address" name="address">
                                </div>
                            </div>
                            <div class="different-address" style="visibility: hidden;">
                                <div id="ship-box-info">
                                    <div class="row">
                                    </div>
                                </div>
                            </div>
                            <div class="order-notes">
                                <div class="checkout-form-list">
                                    <label>????????????</label>
                                    <textarea id="checkout-mess" name="notes" cols="30" rows="10"
                                              placeholder=""></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="your-order mb-30 ">
                            <h3>????????????</h3>
                            <div class="your-order-table table-responsive">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="product-name">??????</th>
                                        <th class="product-total" style="text-align:center">??????</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!--  ???????????? -->
                                    <c:forEach var="ccl" items="${checkoutCartList}">
                                    <tr class="cart_item">
                                        <td class="product-name">
                                            ${ccl.name}[${ccl.model}] <strong class="product-quantity"> ??
                                            ${ccl.tempMount}</strong>
                                        </td>
                                        <td class="product-total" style="text-align:center">
                                            <span class="amount" id="product-total" >$${ccl.tprice}</span>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <!--  ???????????? -->
                                    </tbody>
                                    <tfoot>
                                        <!-- ?????? -->
                                        <tr class="cart-subtotal">
                                            <th>???????????????</th>
                                            <td style="text-align:center"><span class="amount" id="cart-subtotal" ></span></td>
                                        </tr>
                                        <tr class="cart-discount">
                                            <th>??????</th>
                                            <td style="text-align:center"><span class="discount" id="cart-discount">${discount}</span></td>
                                        </tr>    
                                    <tr class="order-total">
                                        <th>?????????</th>
                                        <td style="text-align:center"><strong><span class="amount" id="order-total" ></span></strong>
                                        </td>
                                    </tr>
                                     <!-- ?????? -->
                                    </tfoot>
                                </table>
                            </div>

                            <div class="payment-method">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn-link" type="button"
                                                        data-toggle="collapse"
                                                        data-target="#collapseOne"
                                                        aria-expanded="true"
                                                        aria-controls="collapseOne">
                                                    ??????
                                                </button>
                                            </h5>
                                        </div>

                                        <div id="collapseOne" class="collapse show"
                                             aria-labelledby="headingOne"
                                             data-parent="#accordionExample">
                                            <div class="card-body">
                                                ***??????????????????????????????????????????????????????***<br>
                                                ***???????????????????????????***
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn-link collapsed" type="button"
                                                        data-toggle="collapse"
                                                        data-target="#collapseTwo"
                                                        aria-expanded="false"
                                                        aria-controls="collapseTwo">
                                                    Cash On Delivery
                                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse"
                                             aria-labelledby="headingTwo"
                                             data-parent="#accordionExample">
                                            <div class="card-body">
                                                Please send your cheque to Store Name, Store Street,
                                                Store Town, Store
                                                State / County, Store
                                                Postcode.
                                            </div>
                                        </div>
                                    </div> -->
                                    <!-- <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn-link collapsed" type="button"
                                                        data-toggle="collapse"
                                                        data-target="#collapseThree"
                                                        aria-expanded="false"
                                                        aria-controls="collapseThree">
                                                    Credit Card
                                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse"
                                             aria-labelledby="headingThree"
                                             data-parent="#accordionExample">
                                            <div class="card-body">
                                                Pay via PayPal; you can pay with your credit card if
                                                you don???t have a
                                                PayPal account.
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                                <div class="order-button-payment mt-20">
                                    <button type="submit" class="os-btn os-btn-black" id="submit"style="font-size:14px;">????????????</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- </form> -->
        </div>
    </section>
    <!-- checkout-area end -->
</main>


<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>


<script>

    //??????????????????
    function orderTotals(){

            let subtotal = 0;
            $("span[id='product-total']").each(function(){
                
                let price = $(this).text().slice(1);
                subtotal += Number(price);
            })
            $("span[id='cart-subtotal']").text("$"+subtotal);
            
            let lastSubtotal=subtotal;
            let lastDiscount=Number($("span[id='cart-discount']").text().slice(1));
            // let lastDiscount=Number($("input[id='cart-discount']").val().slice(1));

            let lastTotal=lastSubtotal-lastDiscount
            $("span[id='order-total']").text("$"+lastTotal);
    }

    //?????????????????????
    function countrySelect(){
        
        $('#country').html('');
        $.each(locationData, function (index, value) {

            let option = document.createElement('option');
            // console.log(option);
            option.innerHTML = value.name;
            // console.log(option.innerHTML);
            option.value = index;
            // console.log(option.value);
            $('#country').append(option);

        })
    }

    //????????????????????????
    function districtSelect(){

        countryValue = $('#country').val();
        $('#district').html('');
        $.each(locationData[countryValue].districts, function (index, value) {

            let optDis = document.createElement('option');
            optDis.innerHTML = value.name;
            $('#district').append(optDis);

        });
    }


    //????????????
    $(function(){
        orderTotals();
        
        countrySelect();
        let countryValue = $("#country").val();
        districtSelect();
        $('#country').change(districtSelect);
        
    })

    //??????
    $("#submit").on("change click",function(){

        let country = $("#country>option:selected").text();
        let district = $("#district>option:selected").text();
        let street = $("#street").val();

        let recipient = $("#recipient").val();
        let phone = $("#phone").val();
        let address = country+district+street
        let note = $("#checkout-mess").val();
        console.log(note);
        let orderTotal = $("#order-total").text().slice(1);

        $.ajax({
            url:"orderimforlist",
            type:"POST",
            data:{
                recipient:recipient,
                phone:phone,
                address:address,
                notes:note,
                orderTotal:orderTotal
            },
            beforeSend: function () {
                swal.fire({
                    html: '<h5>????????????...</h5>',
                    // showConfirmButton: false,
                    didOpen: () => {
                      Swal.showLoading();
                    },
                    timer: 5000
                });
            },
            success:function(result){
                swal.fire({
                    icon: "success",
                    html: "<h5>???????????????</h5>",
                }).then(function () {
                    // location.replace('/Design/F/Product/');
                    window.location.href='/Design/F/orderrecord';
                    console.log(result)
                });
            },
            error:function(err){
                console.log(err)

            }
        })
        
    })

    //????????????
    $("#recipient").click(function(){
        $(this).val("?????????");
    })
    
    $("#phone").click(function(){
        $(this).val("0983145678");
    })

    $("#street").click(function(){
        $(this).val("??????????????????390???15???");
    })

    $("#checkout-mess").click(function(){
        $(this).val("???????????????????????????! ??????~");
    })

</script>

<script src="${contextRoot}/static/back/universal/taiwan_districts.js"></script>
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>

</body>

</html>
