   $(function(){
                    function carTotals(){

                        let subtotal = 0;
                        $("span[id='tprice']").each(function(){
                            let price = $(this).text()
                            subtotal += Number(price);
                        })
                        $("span[id='subtotal']").text("$"+subtotal);

                        let latestSubtotal=subtotal;
                        let latestDiscount=Number($("input[id='discount']").val().slice(1));

                        let latestTotal=latestSubtotal-latestDiscount
                        $("span[id='total']").text("$"+latestTotal);
                    }

                    //頁面載入
                    $(function(){
                        carTotals();
                    })

                    //修改購物車商品數量
                    $(".cart-plus-minus").on("change click", function () {

                        //數量
                        let qty = $(this).children("input").val();

                        //單價
                        let price = $(this).parent("td").prev(".product-price").children("span").text();

                        //小計金額
                        let s_price = (price * qty);
                        $(this).parent("td").next(".product-subtotal").children("span").text(s_price);
                        
                        //購物車id
                        let cartid = $(this).parent("td").nextAll().filter(".product-cartid").children("input").val();

                        $.ajax({
                            url: "editshoppingcart",
                            type: "POST",
                            data: {
                                cartid: cartid,
                                uamount: qty
                            },
                            success: function (result) {
                                carTotals();
                            }
                        })

                    });

                    //刪除購物車商品
                    $(".fa").on("click", function () {

                        //購物車id
                        let cartid = $(this).parent("td").next(".product-cartid").children("input").val();
                        //目前所屬tr
                        let row = $(this).parent("td").parent("tr");

                        $.ajax({
                            url: "deleteshoppingcart",
                            type: "GET",
                            data: {
                                id: cartid
                            },
                            success: function (result) {
                                row.remove();
                                carTotals();
                            }
                        })
                    })

                    //使用coupon
                    $("#submit").on("click", function () {
                        // console.log($("#submit"));

                        let coupon = $(this).prev("#coupon_code").val();

                        // let couponDiscount = $(this).next("#discount")
                        let couponContext = $("span[id='couponContext']")
                        console.log(couponContext);
                        // let discount = $("li[id='discount']").children("span")
                        let discount = $("input[id='discount']")

                        $.ajax({
                            url: "usecoupon",
                            type: "POST",
                            data: {
                                coupon_code: coupon
                            },
                            success: function (result) {
                            	
                            	var error = result.errMsg;
                            	
                                if(result.coupon !=null){

                                    if(error !=null){
                                        couponContext.text(error);
                                        discount.val("$0");
                                        carTotals();
                                	}else {
                                        couponContext.text("折扣 $"+result.discount+"元");
                                        discount.val("$"+result.discount);
                                        carTotals();
                                    }

                                }else{
                                	couponContext.text(error);
                                    discount.val("$0");
                                    carTotals();
                                }
                            },
                            error: function (err) {
                                console.log("沒接到值");
                            }
                        })
                    })
                })