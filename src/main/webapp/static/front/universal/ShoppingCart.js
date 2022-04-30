//頁面載入
$(function () {

  carTotals();

  // getDiscountPercentage();   // ajax用

  function carTotals() {

    let subtotal = 0;
    $("span[id='tprice']").each(function () {
      let price = $(this).text()
      // console.log("price " + price);
      subtotal += Number(price);
    })
    $("span[id='subtotal']").text("$" + subtotal);

    let latestSubtotal = subtotal;
    let latestDiscount = Number($("input[id='discount']").val().slice(1));

    let latestTotal = latestSubtotal - latestDiscount
    $("span[id='total']").text("$" + latestTotal);
  }

// 計算折扣 %數 (暫無使用)
  function getDiscountPercentage() {

    // 用來存放當頁購物車中所有的product id 的 Array
    let productIdList = [];

    $('#theTBody > tr > td > div > a[data-product-id]').each(function () {
      productIdList.push($(this)[0].dataset.productId);
    });

    console.log(`productIdList:${productIdList}`);

    $.ajax({
      url: '/Design/F/Activity/checkDiscount',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(productIdList),
      success: function (res) {

        $.each(res, function (index, product) {
          // 如果折扣大於0
          if (product.discount > 0) {

            // 先抓到原本價錢的span
            let currentPriceSpan = $(`a[data-product-id='${product.productId}']`)
            .parent('td').siblings('td:eq(1)').children(
                'span[class*="currentPrice"]');

            // 先把原價存起來
            let currentPrice = currentPriceSpan.text();

            // 把原本的價錢span的class換掉
            currentPriceSpan.removeClass('currentPrice').addClass('old-price');

            // 新增一個折扣後價格的span
            currentPriceSpan.parent('td').prepend(
                `$<span class="price currentPrice">${currentPrice
                * product.discount / 100}</span></br>`)
            .append(
                `</br><span class="text-danger">限時活動:</span>`)
            .append(
                `</br><span class="text-danger">${product.discount}% OFF</span>`);
          }

        });

      }, error: function (err) {
        console.log(err);
      }
    });

  }

//修改購物車商品數量
  $(".cart-plus-minus").on("change click", function () {

    //數量
    let qty = $(this).children("input").val();
    // console.log(`qty:${qty}`)

    //單價
    // let price = $(this).parent("td").prev(".product-price").children("span").text();
    let price = $(this).closest('tr').children('td:eq(2)')
    .children('span[class*="currentPrice"]').text();

    //小計金額
    let s_price = (price * qty);
    $(this).parent("td").next(".product-subtotal").children("span").text(
        s_price);

    //購物車id
    let cartid = $(this).parent("td").nextAll().filter(
        ".product-cartid").children("input").val();

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
    let cartid = $(this).parent("td").next(".product-cartid").children(
        "input").val();
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

  $("#coupon_code").on("click", function () {
    $("#submit").attr('disabled', false);
  })

//使用coupon
  $("#submit").on("change click", function () {
    // console.log($("#submit"));
    $("#submit").attr('disabled', true);

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

        if (result.coupon != null) {

          if (error != null) {
            couponContext.text(error);
            discount.val("$0");
            carTotals();
          } else {
            couponContext.text("折扣 $" + result.discount + "元");
            discount.val("$" + result.discount);
            carTotals();
          }

        } else {
          couponContext.text(error);
          discount.val("$0");
          carTotals();
        }
      },
      error: function (err) {
        console.log("沒接到值");
      }
    });
  });

});

// $(function () {
//
//   function carTotals() {
//
//     let subtotal = 0;
//     $("span[id='tprice']").each(function () {
//       let price = $(this).text()
//       subtotal += Number(price);
//     })
//     $("span[id='subtotal']").text("$" + subtotal);
//
//     let latestSubtotal = subtotal;
//     let latestDiscount = Number($("input[id='discount']").val().slice(1));
//
//     let latestTotal = latestSubtotal - latestDiscount
//     $("span[id='total']").text("$" + latestTotal);
//   }
//
//   //頁面載入
//   $(function () {
//     carTotals();
//   })
//
//   //修改購物車商品數量
//   $(".cart-plus-minus").on("change click", function () {
//
//     //數量
//     let qty = $(this).children("input").val();
//
//     //單價
//     let price = $(this).parent("td").prev(".product-price").children(
//         "span").text();
//
//     //小計金額
//     let s_price = (price * qty);
//     $(this).parent("td").next(".product-subtotal").children("span").text(
//         s_price);
//
//     //購物車id
//     let cartid = $(this).parent("td").nextAll().filter(
//         ".product-cartid").children("input").val();
//
//     $.ajax({
//       url: "editshoppingcart",
//       type: "POST",
//       data: {
//         cartid: cartid,
//         uamount: qty
//       },
//       success: function (result) {
//         carTotals();
//       }
//     })
//
//   });
//
//   //刪除購物車商品
//   $(".fa").on("click", function () {
//
//     //購物車id
//     let cartid = $(this).parent("td").next(".product-cartid").children(
//         "input").val();
//     //目前所屬tr
//     let row = $(this).parent("td").parent("tr");
//
//     $.ajax({
//       url: "deleteshoppingcart",
//       type: "GET",
//       data: {
//         id: cartid
//       },
//       success: function (result) {
//         row.remove();
//         carTotals();
//       }
//     })
//   })
//
//   //使用coupon
//   $("#submit").on("click", function () {
//     // console.log($("#submit"));
//
//     let coupon = $(this).prev("#coupon_code").val();
//
//     // let couponDiscount = $(this).next("#discount")
//     let couponContext = $("span[id='couponContext']")
//     console.log(couponContext);
//     // let discount = $("li[id='discount']").children("span")
//     let discount = $("input[id='discount']")
//
//     $.ajax({
//       url: "usecoupon",
//       type: "POST",
//       data: {
//         coupon_code: coupon
//       },
//       success: function (result) {
//
//         var error = result.errMsg;
//
//         if (result.coupon != null) {
//
//           if (error != null) {
//             couponContext.text(error);
//             discount.val("$0");
//             carTotals();
//           } else {
//             couponContext.text("折扣 $" + result.discount + "元");
//             discount.val("$" + result.discount);
//             carTotals();
//           }
//
//         } else {
//           couponContext.text(error);
//           discount.val("$0");
//           carTotals();
//         }
//       },
//       error: function (err) {
//         console.log("沒接到值");
//       }
//     })
//   })
// })
