
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

    // 下方新品推薦加入購物車
    $('body').on('click', 'a[id^=newArrAddToCartBtn]', function () {

        let id = $(this).attr('id').split("newArrAddToCartBtn")[1];
        console.log(id)



        $.get("/Design/F/addshoppingcart", {"fkProduct": id, "amount": 1})
        {
            Swal.fire({
                text: '已加入購物車',
                showConfirmButton: false,
                timer: 1000
            })
            console.log($('#amount').val());
        }
    })


})