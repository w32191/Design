
$(function () {

    let getUrlString = location.href;
    let url = new URL(getUrlString);
    let id = url.searchParams.get('id')
    console.log(id)
    let amount;

    // 新品推薦 NEW ARRIVAL
    $.getJSON(`/Design/B/product/findProductOrderByAddedDesc`, function (newa) {
        console.log(newa[0].id)
        console.log(newa[0].name)
        let natxt = '';

        for (let i = 0; i < 8; i++) {
            natxt +=
                `
        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="product__wrapper mb-60">
                        <div class="product__thumb">
                            <a href="/Design/F/product/product-details?id=${newa[i].id}" class="w-img">
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
                                <h4><a href="/Design/F/product/product-details?id=${newa[i].id}">${newa[i].name}</a></h4>
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

    // 下方新品推薦加入購物車
    $('body').on('click', 'a[id^=newArrAddToCartBtn]', function () {

        let id = $(this).attr('id').split("newArrAddToCartBtn")[1];
        console.log(id)


        //
        // $.get("/Design/F/addshoppingcart", {"fkProduct": id, "amount": 1})
        // {
        //     Swal.fire({
        //         text: '已加入購物車',
        //         showConfirmButton: false,
        //         timer: 1000
        //     })
        //     console.log($('#amount').val());
        // }
        $.ajax({
            url: "/Design/F/addshoppingcart",
            type: 'GET',
            data: {"fkProduct": id, "amount": 1},
            success: function (res) {
                console.log(res)
                if (res == 'success') {
                    Swal.fire({
                        text: '已加入購物車',
                        showConfirmButton: false,
                        timer: 1000
                    })
                } else {
                    Swal.fire({
                        title: '請先登入！',
                        icon: 'error',
                        showConfirmButton: false,
                        timer: 1000
                    })
                }
            },
            error: function (err) {
                console.log(err)
            }

        });

    })

    $(".truncate").each(function () {
        truncate($(this));
        console.log($(this))
    });

    function truncate(el) {
        let clone = el.children().first(),
            originalContent = el.html(),
            text = clone.text();
        let charLimit = 50;
        if (clone[0].innerHTML.trim().length > charLimit) {
            el.attr("data-originalContent", originalContent);
            el.addClass('hasHidden');
            clone.text(text.substring(0, charLimit) + "  ...。")
            el.empty().append(clone);
            // el.append($("<div class='read-more'><a href='#' class='more'>Read More</a>"));
        }

    }


})
