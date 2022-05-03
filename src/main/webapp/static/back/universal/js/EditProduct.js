$(function () {

    let getUrlString = location.href;
    let url = new URL(getUrlString);
    console.log(url);
    let id = url.searchParams.get('id')
    console.log(id)
    let txt = '';
    $.getJSON(`/Design/B/product/findProductById/${id}`, function (res) {
        console.log(res.name)

        txt += `
        <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="row">
                                <div class="col-lg-3">
                                    <img src="${res.image01}" width="200px">
                                    <p>圖片一(主圖)</p>
                                </div>
                                <div class="col-lg-3">
                                    <img src="${res.image02}" width="200px">
                                    <p>圖片二(副圖)</p>
                                </div>
                                <div class="col-lg-3">
                                    <img src="${res.image03}" width="200px">
                                    <p>圖片三</p>
                                </div>
                                <div class="col-lg-3">
                                    <img src="${res.image04}" width="200px">
                                    <p>圖片四</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="basic-elements">
                                    <form>
                                        <div class="row">

                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <p>名稱</p>
                                                    <input type="text" class="form-control"
                                                           value="${res.name} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>品牌</p>
                                                    <input type="text" class="form-control"
                                                           value="${res.fkBrand.name} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>價格</p>
                                                    <input type="text" class="form-control"
                                                           value="${res.price} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>種類</p>
                                                    <input type="text" class="form-control"
                                                           value="${res.categories} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>庫存</p>
                                                    <input type="text" class="form-control"
                                                           value="${res.stock} ">
                                                </div>



                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <p>產品描述</p>
                                                    <textarea class="form-control" rows="5"
                                                              placeholder="Text input"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
`
        $('#main-content').html(txt);
    })



})