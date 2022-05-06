$(function () {

    let getUrlString = location.href;
    let url = new URL(getUrlString);
    console.log(url);
    let brand = url.searchParams.get('brand')
    // console.log(brand)
    brandSwitch(brand);

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

    function brandSwitch(brand) {
        console.log(brand);
        $('#brandbanner').html('');


        switch (brand) {

            //Tom Dixon
            case '6' : {

                console.log("有喔是6")
               let txt1 = `
                            <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <img src="https://i.imgur.com/N4ssfO5.jpg" class="imggggg">
                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <br>
                        <br>
                        <p>
                            <h2>Tom Dixon</h2>
                            <p>
                            <br>
                            品牌國家：英國<br>
                            2002 年由設計師 Tom Dixon 和 David Begg 所創立，主要設計和生產英國的傢俱和燈飾，打從成立之初，公司便開始發展自己的燈具和家具，如廣受好評的 Copper
                            Shade, Mirror Ball 以及近期的 Beat Light, Slouch 沙發椅等等。2007 年 5 月於美國紐約 International Contemporary
                            Furniture Fair 參展，並獲得最佳燈具編輯獎。公司理念以傳遞和復興英國傢俱工業精神，和個人主義的創新和茁壯為圭臬。
                        </p>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <img src="https://i.imgur.com/dC7OHsj.jpg">
                    </div>

                </div>
            </div>
        </div>
`;

                $('#brandbanner').html(txt1);


            }
            break;



            //MENU
            case '4': {
                console.log("有喔是4")
               let  txt2 = `
                            <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <img src="https://i.imgur.com/IfLc4TH.jpg" class="imggggg">
                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <br>
                        <br>
                        
                            <h2>MENU.</h2>
                            <p>
                            <br>
                            品牌國家：丹麥<br>
                            Menu 是丹麥的生活居家品牌，成立於 1979 年。Menu 的文化背景與創作靈感源自於斯堪地納維亞「品質」、「實用」與「美感」並重的設計傳統，強調在簡潔優美的造型中融入人體工學的概念，並且在產品設計的質地上大方展現北歐工藝設計的精巧技術。
                        </p>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <img src="https://i.imgur.com/WQZ6NKm.jpg">
                    </div>

                </div>
            </div>
        </div>
                `

                $('#brandbanner').html(txt2);
            }
                break;

            //FLOS
            case '15': {
                console.log("有喔是15")
                let txt3 = `
                            <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <img src="https://i.imgur.com/KxTCV4t.jpg" class="imggggg">
                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <br>
                        
                        
                            <h2>FLOS</h2>
                            <p>
                            品牌國家：義大利<br>
                            Flos 是義大利四大名燈品牌之一，設計風格結合古典優雅和現代設計，被稱為是「燈具界的勞力士」，1962 年於義大利 Merano 成立。 Flos 的燈具為義大利工業設計界之經典。強調符合現代潮流的設計趨勢，迎合當今消費文化，追逐生活趣味的燈品。 經典作品如：1962 年 Achille Castiglioni 設計的 Arco 大理石拋物線立燈。Gino Sarfatti 1958 年設計的 2097 吊燈系列。2007 年 Marcel Wanders 的 Skygarden 空中花園吊燈等。                        </p>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <img src="https://i.imgur.com/rjrdSpt.jpg">
                    </div>

                </div>
            </div>
        </div>
`

                $('#brandbanner').html(txt3);
            }
                break;


            //BROKIS
            case '9': {
                console.log("有喔是9")
              let  txt4 = `
                            <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <img src="https://i.imgur.com/wM5aVKm.jpg" class="imggggg">
                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <br>
                        
                        
                            <h2>BROKIS</h2>
                            <br>
                            <p>
                            品牌國家：捷克<br>
                            來自捷克，起源自 1809 年即為許多燈具生產燈罩和燈具配件的 Janstejn 玻璃工坊，以生產高規格的波希米亞玻璃而聞名，1997 年起，創辦人 Rabell 繼而成立了 Brokis 燈具品牌，他們將生命奉獻在生產精緻的照明產品，具有生產品質優良的玻璃的經驗，再加上與世界各地知名設計師結合，創造了當代照明藝術的手工生產風格，他們的成功也證明了一個傑出的設計必須和最佳品質相輔相成。                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <img src="https://i.imgur.com/kWJ9Aon.jpg">
                    </div>

                </div>
            </div>
        </div>
`

                $('#brandbanner').html(txt4);
            }
                break;


            //Foscarini
            case '11': {
                console.log("有喔是11")
                let txt5 = `
                            <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <img src="https://i.imgur.com/hNtPWGh.jpg" class="imggggg">
                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <br>
                        
                        
                            <h2>FOSCARINI</h2>
                            <br>
                            <p>
                            品牌國家：義大利<br>
                            來自捷克，起源自 1809 年即為許多燈具生產燈罩和燈具配件的 Janstejn 玻璃工坊，以生產高規格的波希米亞玻璃而聞名，1997 年起，創辦人 Rabell 繼而成立了 Brokis 燈具品牌，他們將生命奉獻在生產精緻的照明產品，具有生產品質優良的玻璃的經驗，再加上與世界各地知名設計師結合，創造了當代照明藝術的手工生產風格，他們的成功也證明了一個傑出的設計必須和最佳品質相輔相成。</p>
                            </div>
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <img src="https://i.imgur.com/cmgZbyI.jpg">
                    </div>

                </div>
            </div>
        </div>
`

                $('#brandbanner').html(txt5);
            }
                break;

            //louis
            case '24': {
                console.log("有喔是24")
                let txt6 = `
                            <div class="container" >
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <img src="https://i.imgur.com/Gj7sGjA.jpg" class="imggggg">
                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <br>
                        
                        
                            <h2>Louis Poulsen</h2>
                            <br>
                            <p>
                            品牌國家：丹麥<br>
                            來自丹麥的國際燈具品牌，成立於 1874 年，悠久的經營歷史，至今旗下員工超過 1,000 名，於法國、德國、日本、美國、香港及北歐各國均有其分公司，多年來 Louis Poulsen 積極致力於視覺藝術品的創作，對於燈飾品的創新，更是其設計師群不斷努力的目標，對於作品的優雅外型的要求上，和使用機能如何完美搭配，是其最驕傲出眾的 優勢，對於簡潔風格的訴求，使 Louis Poulsen 更加永垂不朽，也讓其成為國際上第一流的知名品牌。</p>
                            </div>
                    <div class="col-xl-6 col-lg-6">
                        <br>
                        <img src="https://i.imgur.com/FBbtQMR.jpg">
                    </div>

                </div>
            </div>
        </div>
`
                $('#brandbanner').html(txt6);
            }
                break;


        }
    }


})