$(function () {

    let getUrlString = location.href;
    let url = new URL(getUrlString);
    console.log(url);
    let brand = url.searchParams.get('brand')
    console.log(brand)

    $.getJSON(`/Design/B/product/findProductByBrand/${brand}`, function (res) {
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
                </a>
                <div class="product__sale">
                    <span class="new">new</span>
                    <span class="percent">-14%</span>
                </div>
            </div>

            <div class="product__content p-relative">
                <div class="product__content-inner">
                    <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                    <div class="product__price transition-3">
                        <span>$${res[i].price}</span>
                    </div>
                </div>
                <div class="add-cart p-absolute transition-3">
                    <a href="#">+ Add to Cart</a>
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
                $.getJSON(`/Design/B/product/findProductByBrand/${brand}`, function (res) {
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
                                        <a href="product-details.html" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>
                                        <div class="product__sale">
                                            <span class="new">new</span>
                                            <span class="percent">-14%</span>
                                        </div>
                                    </div>

                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">
                                                <span>$${res[i].price}</span>
                                            </div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a href="#">+ Add to Cart</a>
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
                $.getJSON(`/Design/B/product/findProductByBrandOrderByPriceDesc/${brand}`, function (res) {
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
                                        <a href="product-details.html" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>
                                        <div class="product__sale">
                                            <span class="new">new</span>
                                            <span class="percent">-14%</span>
                                        </div>
                                    </div>

                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">
                                                <span>$${res[i].price}</span>
                                            </div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a href="#">+ Add to Cart</a>
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
                $.getJSON(`/Design/B/product/findProductByBrandOrderByPrice/${brand}`, function (res) {
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
                                        <a href="product-details.html" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>
                                        <div class="product__sale">
                                            <span class="new">new</span>
                                            <span class="percent">-14%</span>
                                        </div>
                                    </div>

                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">
                                                <span>$${res[i].price}</span>
                                            </div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a href="#">+ Add to Cart</a>
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


                $.getJSON(`/Design/B/product/findProductByBrandOrderByAddedDesc/${brand}`, function (res) {
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
                                        <a href="product-details.html" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>
                                        <div class="product__sale">
                                            <span class="new">new</span>
                                            <span class="percent">-14%</span>
                                        </div>
                                    </div>

                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">
                                                <span>$${res[i].price}</span>
                                            </div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a href="#">+ Add to Cart</a>
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




                $.getJSON(`/Design/B/product/findProductByBrandOrderByAdded/${brand}`, function (res) {
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
                                        <a href="product-details.html" class="w-img">
                                            <img src="${res[i].image01}"
                                            height=""
                                                 alt="product-img">
                                            <img class="product__thumb-2"
                                                 src="${res[i].image02}"
                                                 alt="product-img">
                                        </a>
                                        <div class="product__sale">
                                            <span class="new">new</span>
                                            <span class="percent">-14%</span>
                                        </div>
                                    </div>

                                    <div class="product__content p-relative">
                                        <div class="product__content-inner">
                                            <h4><a href="/Design/F/product/product-details?id=${res[i].id}">${res[i].name}</a></h4>
                                            <div class="product__price transition-3">
                                                <span>$${res[i].price}</span>
                                            </div>
                                        </div>
                                        <div class="add-cart p-absolute transition-3">
                                            <a href="#">+ Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
`
                    }   // end of for()
                    $('#pro').html(txt);

                });


                console.log(5);
                break;

        }


    })





























})