$(function () {

  // 商品pill
  $.getJSON("/Design/B/product/findAllProduct", function (res) {
    let txt = '';
    console.log(res.length);
    for (let i = 0; i < res.length; i++) {
      console.log(res[i].name);
      console.log(res[i].price);
      console.log(res[i].image01);
      console.log(res[i].image02);
      txt += `
<div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 custom-col-10" >
    <div class="product__wrapper mb-60">
            <div class="product__thumb">
                <a href="/Design/F/product/product-details?id=${res[i].id}" class="w-img">
                    <img src="${res[i].image01}"
                    height=""
                         alt="product-img">
                    <img class="product__thumb-2"
                         src="${res[i].image02}"
                         alt="product-img">
                </a>`;

      if (res[i].discountPercentage != null) {
        let dis = `<div class="product__sale"><span class="new">活動</span><span class="percent">-${res[i].discountPercentage}%</span></div>`;
        txt += dis;
      }

      txt += `</div>

            <div class="product__content p-relative">
                <div class="product__content-inner">
                    <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                    <div class="product__price transition-3">`;

      if (res[i].discountPercentage != null) {
        txt += `<span>$${res[i].price * (100 - res[i].discountPercentage)
        / 100}</span><span class="old-price">$${res[i].price}</span>`;

      } else {
        txt += `<span>$${res[i].price}</span>`;
      }

      txt += `</div>
                </div>
                <div class="add-cart p-absolute transition-3">
                    <a id="addToCartBtn${res[i].id}">+ Add to Cart</a>
                </div>
            </div>
        </div>
    </div>
`
    }   // end of for()
    $('#pro').html(txt);

  });

  //下拉式選單商品排序
  $(document).on("change", 'select#s1', function () {
    console.log($(this).val());
    let v = $(this).val();
    switch (v) {
      case "1" :
        console.log(1);
        $.getJSON("/Design/B/product/findAllProduct", function (res) {
          let txt = '';
          console.log(res.length);
          for (let i = 0; i < res.length; i++) {
            console.log(res[i].name);
            console.log(res[i].price);
            console.log(res[i].image01);
            console.log(res[i].image02);
            txt += `
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 custom-col-10" >
                            <div class="product__wrapper mb-60">
                                    <div class="product__thumb">
                                        <a href="/Design/F/product/product-details?id=${res[i].id}" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>`;

            if (res[i].discountPercentage != null) {
              let dis = `<div class="product__sale"><span class="new">活動</span><span class="percent">-${res[i].discountPercentage}%</span></div>`;
              txt += dis;
            }

            txt += `</div>
                        
                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">`;

            if (res[i].discountPercentage != null) {
              txt += `<span>$${res[i].price * (100 - res[i].discountPercentage)
              / 100}</span><span class="old-price">$${res[i].price}</span>`;

            } else {
              txt += `<span>$${res[i].price}</span>`;
            }
            txt += `</div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a id="addToCartBtn${res[i].id}">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
`
          }   // end of for()
          $('#pro').html(txt);

        });
        break;


        //所有產品高至低
      case "2" :
        console.log(2);
        $.getJSON("/Design/B/product/findProductOrderByPriceDesc",
            function (res) {
              let txt = '';
              console.log(res.length);
              for (let i = 0; i < res.length; i++) {
                console.log(res[i].name);
                console.log(res[i].price);
                console.log(res[i].image01);
                console.log(res[i].image02);
                txt += `
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 custom-col-10" >
                            <div class="product__wrapper mb-60">
                                    <div class="product__thumb">
                                        <a href="/Design/F/product/product-details?id=${res[i].id}" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>`;

                if (res[i].discountPercentage != null) {
                  let dis = `<div class="product__sale"><span class="new">活動</span><span class="percent">-${res[i].discountPercentage}%</span></div>`;
                  txt += dis;
                }

                txt += `</div>
                        
                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">`;

                if (res[i].discountPercentage != null) {
                  txt += `<span>$${res[i].price * (100 - res[i].discountPercentage)
                  / 100}</span><span class="old-price">$${res[i].price}</span>`;

                } else {
                  txt += `<span>$${res[i].price}</span>`;
                }

                txt += `</div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a id="addToCartBtn${res[i].id}">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
`
              }   // end of for()
              $('#pro').html(txt);

            });
        break;

      case "3" :
        console.log(3);
        $.getJSON("/Design/B/product/findProductOrderByPrice", function (res) {
          let txt = '';
          console.log(res.length);
          for (let i = 0; i < res.length; i++) {
            console.log(res[i].name);
            console.log(res[i].price);
            console.log(res[i].image01);
            console.log(res[i].image02);
            txt += `
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 custom-col-10" >
                            <div class="product__wrapper mb-60">
                                    <div class="product__thumb">
                                        <a href="/Design/F/product/product-details?id=${res[i].id}" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>`;

            if (res[i].discountPercentage != null) {
              let dis = `<div class="product__sale"><span class="new">活動</span><span class="percent">-${res[i].discountPercentage}%</span></div>`;
              txt += dis;
            }
            txt += `</div>                   
                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">`;

            if (res[i].discountPercentage != null) {
              txt += `<span>$${res[i].price * (100 - res[i].discountPercentage)
              / 100}</span><span class="old-price">$${res[i].price}</span>`;

            } else {
              txt += `<span>$${res[i].price}</span>`;
            }

            txt += `</div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a id="addToCartBtn${res[i].id}">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
`
          }   // end of for()
          $('#pro').html(txt);

        });
        break;

      case "4" :

        $.getJSON("/Design/B/product/findProductOrderByAddedDesc",
            function (res) {
              let txt = '';
              console.log(res.length);
              for (let i = 0; i < res.length; i++) {
                console.log(res[i].name);
                console.log(res[i].price);
                console.log(res[i].image01);
                console.log(res[i].image02);
                txt += `
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 custom-col-10" >
                            <div class="product__wrapper mb-60">
                                    <div class="product__thumb">
                                        <a href="/Design/F/product/product-details?id=${res[i].id}" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>`;
                if (res[i].discountPercentage != null) {
                  let dis = `<div class="product__sale"><span class="new">活動</span><span class="percent">-${res[i].discountPercentage}%</span></div>`;
                  txt += dis;
                }
                txt += `</div>
                        
                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">`;

                if (res[i].discountPercentage != null) {
                  txt += `<span>$${res[i].price * (100 - res[i].discountPercentage)
                  / 100}</span><span class="old-price">$${res[i].price}</span>`;

                } else {
                  txt += `<span>$${res[i].price}</span>`;
                }
                txt += `</div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a id="addToCartBtn${res[i].id}">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
`
              }   // end of for()
              $('#pro').html(txt);

            });

        console.log(4);
        break;

      case "5" :

        $.getJSON("/Design/B/product/findProductOrderByAdded", function (res) {
          let txt = '';
          console.log(res.length);
          for (let i = 0; i < res.length; i++) {
            console.log(res[i].name);
            console.log(res[i].price);
            console.log(res[i].image01);
            console.log(res[i].image02);
            txt += `
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 custom-col-10" >
                            <div class="product__wrapper mb-60">
                                    <div class="product__thumb">
                                        <a href="/Design/F/product/product-details?id=${res[i].id}" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>`;

            if (res[i].discountPercentage != null) {
              let dis = `<div class="product__sale"><span class="new">活動</span><span class="percent">-${res[i].discountPercentage}%</span></div>`;
              txt += dis;
            }

            txt += `</div>
                        
                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">`;
            if (res[i].discountPercentage != null) {
              txt += `<span>$${res[i].price * (100 - res[i].discountPercentage)
              / 100}</span><span class="old-price">$${res[i].price}</span>`;

            } else {
              txt += `<span>$${res[i].price}</span>`;
            }
            txt += `</div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a id="addToCartBtn${res[i].id}">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
`
          }   // end of for()
          $('#pro').html(txt);

        });

        console.log(4);
        break;

    }

  })



    $('body').on('click', 'a[id^=addToCartBtn]', function () {
        console.log("喔齁")

        let id = $(this).attr('id').split("addToCartBtn")[1];
        console.log(id)
        $.get("/Design/F/addshoppingcart", {"fkProduct": id, "amount": 1})
        {
            Swal.fire({
                text: '已加入購物車',
                showConfirmButton: false,
                timer: 1000
            })

        }
    })


});



