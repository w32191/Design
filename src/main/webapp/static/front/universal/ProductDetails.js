$(function () {

    let getUrlString = location.href;
    let url = new URL(getUrlString);
    let id = url.searchParams.get('id')

    if(url.searchParams.get('id') == null){
        id =  url.searchParams.get('productId');
    }
    console.log(id)
    let amount;

    $.getJSON(`/Design/F/ProductReview/ProductReview/${id}`, function (reviewres) {
        console.log(reviewres);
    });

    $.getJSON(`/Design/B/product/findProductById/${id}`, function (res) {
        console.log(res.name);

        let txt = '';

        txt += `
<div class="shop__top grey-bg-6 pt-100 pb-90">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <div class="product__modal-box d-flex">
                            <div class="product__modal-nav mr-20">
                                <nav>
                                    <div class="nav nav-tabs" id="product-details" role="tablist">
                                        <a class="nav-item nav-link active" id="pro-one-tab"
                                           data-toggle="tab" href="#pro-one" role="tab"
                                           aria-controls="pro-one" aria-selected="true">
                                            <div class="product__nav-img w-img">
                                                <img src="${res.image01}" width="20px"
                                                     alt="">
                                            </div>
                                        </a>
                                        <a class="nav-item nav-link" id="pro-two-tab"
                                           data-toggle="tab" href="#pro-two" role="tab"
                                           aria-controls="pro-two" aria-selected="false">
                                            <div class="product__nav-img w-img">
                                                <img src="${res.image02}"
                                                     alt="">
                                            </div>
                                        </a>
                                        <a class="nav-item nav-link" id="pro-three-tab"
                                           data-toggle="tab" href="#pro-three" role="tab"
                                           aria-controls="pro-three" aria-selected="false">
                                            <div class="product__nav-img w-img">
                                                <img src="${res.image03}"
                                                     alt="">
                                            </div>
                                        </a>
                                        <a class="nav-item nav-link" id="pro-three-tab"
                                           data-toggle="tab" href="#pro-three" role="tab"
                                           aria-controls="pro-three" aria-selected="false">
                                            <div class="product__nav-img w-img">
                                                <img src="${res.image04}"
                                                     alt="">
                                            </div>
                                        </a>
                                    </div>
                                </nav>
                            </div>
                            <div class="tab-content mb-20" id="product-detailsContent">
                                <div class="tab-pane fade show active" id="pro-one" role="tabpanel"
                                     aria-labelledby="pro-one-tab">
                                    <div class="product__modal-img product__thumb ">
                                        <img src="${res.image01}"
                                             alt="" width="400px">`;

        if (res.discountPercentage != null) {
            let dis = `<div class="product__sale"><span class="new">活動</span><span class="percent">-${res.discountPercentage}%</span></div>`;
            txt += dis;
        }
        txt += `</div>
                                </div>
                                <div class="tab-pane fade" id="pro-two" role="tabpanel"
                                     aria-labelledby="pro-two-tab">
                                    <div class="product__modal-img product__thumb ">
                                        <img src="${res.image02}"
                                             alt=""  width="400px">
                                        <div class="product__sale ">
                                            <span class="new">new</span>
                                            <span class="percent">-16%</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pro-three" role="tabpanel"
                                     aria-labelledby="pro-three-tab">
                                    <div class="product__modal-img product__thumb ">
                                        <img src="${res.image03}"
                                             alt=""  width="400px">
                                        <div class="product__sale ">
                                            <span class="new">new</span>
                                            <span class="percent">-16%</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pro-four" role="tabpanel"
                                     aria-labelledby="pro-four-tab">
                                    <div class="product__modal-img product__thumb ">
                                        <img src="${res.image04}"
                                             alt=""  width="400px">
                                        <div class="product__sale ">
                                            <span class="new">new</span>
                                            <span class="percent">-16%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>`
                    $.ajax({
                        url: `/Design/F/ProductReview/ProductReview/${id}`,
                        dataType: 'json',
                        method: 'get',
                        success: function (data) {
                            let p=0;
                            for (let r = 0; r < data.length; r++) {
                                p += data[r].star;
                            };
                            let s = p/data.length;
                            s = s.toFixed(1);//toFixed()此功能是留小數點後幾位
                            if(s<1){
                                $('#AllStar1').addClass('fa1 fa-star');
                            }
                            if(s>=1 && s<2){
                                $('#AllStar1').addClass('fas fa-star');
                            }
                            if(s>=2 && s<3){
                                $('#AllStar1').addClass('fas fa-star');
                                $('#AllStar2').addClass('fas fa-star');
                            }
                            if(s>=3 && s<4){
                                $('#AllStar1').addClass('fas fa-star');
                                $('#AllStar2').addClass('fas fa-star');
                                $('#AllStar3').addClass('fas fa-star');
                            }
                            if(s>=4 && s<=5){
                                $('#AllStar1').addClass('fas fa-star');
                                $('#AllStar2').addClass('fas fa-star');
                                $('#AllStar3').addClass('fas fa-star');
                                $('#AllStar4').addClass('fas fa-star');
                            }
                            if(s>=5){
                                $('#AllStar1').addClass('fas fa-star');
                                $('#AllStar2').addClass('fas fa-star');
                                $('#AllStar3').addClass('fas fa-star');
                                $('#AllStar4').addClass('fas fa-star');
                                $('#AllStar5').addClass('fas fa-star');
                            }
                        }
                     });
                     
                txt +=`<div class="col-xl-6 col-lg-6">
                        <div class="product__modal-content product__modal-content-2">
                            <h4><a href="product-details?id=${res.id}">${res.name}</a></h4>
                            <div class="rating rating-shop mb-15">
                                <ul>
                                    <li><span><i class="" id="AllStar1"></i></span></li>
                                    <li><span><i class="" id="AllStar2"></i></span></li>
                                    <li><span><i class="" id="AllStar3"></i></span></li>
                                    <li><span><i class="" id="AllStar4"></i></span></li>
                                    <li><span><i class="" id="AllStar5"></i></span></li>
                                </ul>
                            </div>
                            <div class="product__price-2 mb-25">`;
                   
        if (res.discountPercentage != null) {
            txt += `<span>$${res.price * (100 - res.discountPercentage)
            / 100}</span><span class="old-price">$${res.price}</span>`;

        } else {
            txt += `<span>$${res.price}</span>`;
        }

        txt += `</div>
                            <div class="product__modal-des mb-30">
                                <p>品牌：<a href="/Design/F/product/productbybrand?brand=${res.fkBrand.id}" >${res.fkBrand.name}</a></p>
                                <br>
                                <p>${res.description}</p>
                            </div>
                            <div class="product__modal-form mb-30">
                                <form action="#">
                                    <div class="product__modal-input size mb-20">
                                        <label>商品規格    </label>
                                        <select required>
                                            <option>- Please select -</option>
                                            <option> ${res.model}</option>
                                            <option> 灰</option>
                                            <option> 黑</option>
                                          
                                        </select>
                                    </div>
                                    
                                    <div class="product__modal-required mb-5">
                                        <span>請選擇商品數量</span>
                                    </div>
                                    <div class="pro-quan-area d-sm-flex align-items-center">
                                        <div class="product-quantity-title">
                                            <label>數量</label>
                                        </div>
                                        <div class="product-quantity mr-20 mb-20">
                                            <div class="cart-plus-minus"><input type="text" id="amount"
                                                                                value="1"/></div>
                                        </div>
                                        <div class="pro-cart-btn">
                                            <a class="add-cart-btn mb-20" id="addToCartBtn">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                          
<!--                            <div class="product__share">-->
<!--                                <span>Share :</span>-->
<!--                                <ul>-->
<!--                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>-->
<!--                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>-->
<!--                                    <li><a href="#"><i class="fab fa-behance"></i></a></li>-->
<!--                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>-->
<!--                                    <li><a href="#"><i class="fab fa-youtube"></i></a></li>-->
<!--                                </ul>-->
<!--                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="shop__bottom">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="product__details-tab">
                            <div class="product__details-tab-nav text-center mb-45">
                                <nav>
                                    <div class="nav nav-tabs justify-content-start justify-content-sm-center"
                                         id="pro-details" role="tablist">
                                        <a class="nav-item nav-link active" id="des-tab"
                                           data-toggle="tab" href="#des" role="tab"
                                           aria-controls="des" aria-selected="true">商品資訊</a>
                                        <a class="nav-item nav-link" id="add-tab" data-toggle="tab"
                                           href="#add" role="tab" aria-controls="add"
                                           aria-selected="false">規格/尺寸</a>
                                        <a class="nav-item nav-link" id="review-tab"
                                           data-toggle="tab" href="#review" role="tab"
                                           aria-controls="review" aria-selected="false">評論</a>
                                    </div>
                                </nav>
                            </div>
                            <div class="tab-content" id="pro-detailsContent">
                                <div class="tab-pane fade show active" id="des" role="tabpanel">
                                    <div class="product__details-des">
                                    
                                    <br>
                                    <br>
                                        <p>&emsp;&emsp;${res.description}</p>
                                        <div class="product__details-des-list mb-20">
                                            <br>
                                            <br>
                                            <img src="${res.fkBrand.img}" alt="" srcset="" height="100%">
                                            <a>${res.fkBrand.description}</a>
                                        
                                            
                                            
                                            
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="add" role="tabpanel">
                                    <div class="product__details-add">
                                        <ul>
                                            <li><span>Weight</span></li>
                                            <li><span>.25 KG</span></li>
                                            <li><span>Dimention</span></li>
                                            <li><span>62 × 56 × 12 cm</span></li>
                                            <li><span>Size</span></li>
                                            <li><span>XL, XXL, LG, SM, MD</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="review" role="tabpanel">
                                    <div class="product__details-review" id="reviewStart">`;

        $.ajax({
            url: `/Design/F/ProductReview/ProductReview/${id}`,
            dataType: 'json',
            method: 'get',
            success: function (data) {
                console.log("data.length:" + data.length);
                let reviewMain = "";
                let k=0;
                reviewMain += `<div class="postbox__comments">
                                                <div class="postbox__comment-title mb-30">
                                                    <h3 style="background-color:#bc8246;color:white">`;
                for (let m = 0; m < data.length; m++) {
                    k += data[m].star;
                };
                let n = k/data.length;console.log(n);
                n = n.toFixed(1);//toFixed()此功能是留小數點後幾位

                reviewMain += `此商品有（` + data.length;

                reviewMain += `）則評論，共`;
                reviewMain += n + `分</h3></div>`;                
                for (i = 0; i < data.length; i++) {
                    reviewMain += `<div class="latest-comments mb-30">
                                                <ul>
                                                    <li>
                                                        <div class="comments-box">
                                                            <div class="comments-avatar">
                                                                <img src="` + data[i].fkMember.images + `" alt="">
                                                            </div>` ;

                    reviewMain += `
                                                            <div class="comments-text">
                                                            <div class="avatar-name">
                                                            <h5>` + data[i].fkMember.names + `</h5><span>` + data[i].commentDate + `</span>
                                                            </div>`;

                    reviewMain += `
                                                <div class="user-rating">
                                                <ul>`;
                    for (j = 0; j < data[i].star; j++) {
                        reviewMain += `<li><a href="#"><i
                                                    class="fas fa-star"></i></a>
                                                </li>
                                                `;
                    }
                    

                    reviewMain += `</ul>
                                                </div><p>` + data[i].comment + `</p>`;

                    reviewMain += `</div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>`;
                }
                




                $('#reviewStart').html(reviewMain);
            },
            error: function (err) {
                console.log(err)
                alert('發生錯誤1')
            }
        });


        txt += `
                                    </div>
                                                <div class="post-comments-form mb-100">
                                                    <div class="post-comments-title mb-30">
                                                        <h3>撰寫評論</h3>
                                                    </div>
                                                    <form id="contacts-form" class="conatct-post-form" 
                                                    action="/Design/F/ProductReview/insertProductReview" method='post'
                                                     >
                                                        <div class="row">
                                                            <input type="number" value="${id}" id="prProduct" name="productId" hidden />
                                                            <div class="col-xl-6 col-lg-6 col-md-6">
                                                                <div class="contact-icon p-relative contacts-name">
                                                                    <input type="text" placeholder="姓名" id="insertName" name="reviewName" value="" readonly>
                                                                </div>
                                                            </div>                                                            
                                                            
                                                            <div class="col-xl-6 col-lg-6 col-md-6">
                                                                <div class="user-rating">
                                                                    <ul>
                                                                        <li><i class="fal fa-star" id="star01" style='color:#bc8246'></i></li>
                                                                        <li><i class="fal fa-star" id="star02" style='color:#bc8246'></i></li>
                                                                        <li><i class="fal fa-star" id="star03" style='color:#bc8246'></i></li>
                                                                        <li><i class="fal fa-star" id="star04" style='color:#bc8246'></i></li>
                                                                        <li><i class="fal fa-star" id="star05" style='color:#bc8246'></i></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <input type="radio" name="star" value="1" hidden id="radio1"/>
                                                            <input type="radio" name="star" value="2" hidden id="radio2"/>
                                                            <input type="radio" name="star" value="3" hidden id="radio3"/>
                                                            <input type="radio" name="star" value="4" hidden id="radio4"/>
                                                            <input type="radio" name="star" value="5" hidden id="radio5"/>
                                                            <div class="col-xl-12">
                                                                <div class="contact-icon p-relative contacts-message">
                                                                    <textarea name="comments"
                                                                        id="comments"
                                                                        cols="30" rows="10"
                                                                        placeholder="評論內容"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-12">
                                                                <button class="os-btn os-btn-black" id="sendBtn"
                                                                type="submit" >送出
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `
        $('#pd1').html(txt);


        $(".cart-plus-minus").append('<div class="dec qtybutton">-</div><div class="inc qtybutton">+</div>');

        $(".qtybutton").on("click", function () {
            var $button = $(this);
            var oldValue = $button.parent().find("input").val();
            if ($button.text() == "+") {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 0) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 0;
                }
            }
            $button.parent().find("input").val(newVal);
        });

    });

    $.getJSON(`/Design/B/product/findProductOrderByAddedDesc`, function (newa) {
        console.log(newa[0].id)
        console.log(newa[0].name)
        let natxt = '';

        for (let i = 0; i < 4; i++) {
            natxt +=
                `
        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="product__wrapper mb-60">
                        <div class="product__thumb">
                            <a href="product-details?id=${newa[i].id}" class="w-img">
                                <img src="${newa[i].image01}" alt="product-img">
                                <img class="product__thumb-2"
                                     src="${newa[i].image02}" alt="product-img">
                            </a>

                            <div class="product__sale">
                                <span class="new">new</span>

                            </div>
                        </div>
                        <div class="product__content p-relative">
                            <div class="product__content-inner">
                                <h4><a href="product-details?id=${newa[i].id}">${newa[i].name}</a></h4>
                                <div class="product__price transition-3">
                                    <span>$${newa[i].price}</span>

                                </div>
                            </div>
                            <div class="add-cart p-absolute transition-3">
                                <a id="newArrAddToCartBtn${newa[i].id}">+ Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
        `
        }   //end of for
        $('#na').html(natxt);
    })


    $('body').on('click', '#addToCartBtn', function () {
        console.log($('#amount').val());
        amount = $('#amount').val();
        // $('#addToCartBtn').attr('href',`/Design/F/addshoppingcart?id=${id}&amount=${amount}`);


        $.get("/Design/F/addshoppingcart", {"fkProduct": id, "amount": amount}, function (res) {
            Swal.fire({
                text: '已加入購物車',
                showConfirmButton: false,
                timer: 1000
            })
            console.log(res)
        })
        // console.log($('#amount').val());
    });


    // 下方新品推薦加入購物車
    $('body').on('click', 'a[id^=newArrAddToCartBtn]', function () {

        let id = $(this).attr('id').split("newArrAddToCartBtn")[1];
        console.log(id)
        $.get("/Design/F/addshoppingcart", { "fkProduct": id, "amount": 1 })
        {
            Swal.fire({
                text: '已加入購物車',
                showConfirmButton: false,
                timer: 1000
            })
            console.log($('#amount').val());
        }
    })

    // 取當前登入者的名字
    $('#pd1').on('click', '#review-tab', function () {
        $.ajax({
            url: '/Design/F/getP',
            type: 'GET',
            success: function (res) {
                console.log(res);
                $('#insertName').val(res);
            },
            error: function (err) {
                console.log(err);
            }
        });
    });

    // $('#pd1').on('click', '#sendBtn', function () {
    //     $.ajax({
    //         url: '/Design/F/ProductReview/insertProductReview',
    //         type: 'POST',
    //         data: {
    //             comments: $('#comments').val(),
    //             id:$('#prProduct').val()
    //         },
    //         success: function (res) {
    //             console.log(res);
    //         },
    //         error: function (err) {
    //             console.log(err);
    //         }

    //     });
    // });


    //五星判斷
    $('body').on('click', '#star01', function () {
        $('#star01').removeClass('fal fa-star');
        $('#star01').addClass('fas fa-star');
        $('#star02').removeClass('fas fa-star');
        $('#star02').addClass('fal fa-star');   
        $('#star03').removeClass('fas fa-star');
        $('#star03').addClass('fal fa-star');
        $('#star04').removeClass('fas fa-star');
        $('#star04').addClass('fal fa-star');  
        $('#star05').removeClass('fas fa-star');
        $('#star05').addClass('fal fa-star');
        $('#radio1').prop('checked',true);
    });
    $('body').on('click', '#star02', function () {
        $('#star01').removeClass('fal fa-star');
        $('#star01').addClass('fas fa-star');
        $('#star02').removeClass('fal fa-star');
        $('#star02').addClass('fas fa-star');   
        $('#star03').removeClass('fas fa-star');
        $('#star03').addClass('fal fa-star');
        $('#star04').removeClass('fas fa-star');
        $('#star04').addClass('fal fa-star');  
        $('#star05').removeClass('fas fa-star');
        $('#star05').addClass('fal fa-star'); 
        $('#radio2').prop('checked',true);
    });
    $('body').on('click', '#star03', function () {
        $('#star01').removeClass('fal fa-star');
        $('#star01').addClass('fas fa-star');
        $('#star02').removeClass('fal fa-star');
        $('#star02').addClass('fas fa-star');   
        $('#star03').removeClass('fal fa-star');
        $('#star03').addClass('fas fa-star');
        $('#star04').removeClass('fas fa-star');
        $('#star04').addClass('fal fa-star');  
        $('#star05').removeClass('fas fa-star');
        $('#star05').addClass('fal fa-star');   
        $('#radio3').prop('checked',true);  
    });
    $('body').on('click', '#star04', function () {
        $('#star01').removeClass('fal fa-star');
        $('#star01').addClass('fas fa-star');
        $('#star02').removeClass('fal fa-star');
        $('#star02').addClass('fas fa-star');   
        $('#star03').removeClass('fal fa-star');
        $('#star03').addClass('fas fa-star');
        $('#star04').removeClass('fal fa-star');
        $('#star04').addClass('fas fa-star');
        $('#star05').removeClass('fas fa-star');
        $('#star05').addClass('fal fa-star');  
        $('#radio4').prop('checked',true);      
    });
    $('body').on('click', '#star05', function () {
        $('#star01').removeClass('fal fa-star');
        $('#star01').addClass('fas fa-star');
        $('#star02').removeClass('fal fa-star');
        $('#star02').addClass('fas fa-star');   
        $('#star03').removeClass('fal fa-star');
        $('#star03').addClass('fas fa-star');
        $('#star04').removeClass('fal fa-star');
        $('#star04').addClass('fas fa-star');  
        $('#star05').removeClass('fal fa-star');
        $('#star05').addClass('fas fa-star');    
        $('#radio5').prop('checked',true);  
    });
    
    

     
    
             

})

