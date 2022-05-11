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
                                <img src="${res.image01}" width="200px" id="img01">
                                    <p>圖片一(主圖)</p>
                                    <input type="file" name="image01" id="image01">
                            </div>
                            <div class="col-lg-3">
                                    <img src="${res.image02}" width="200px" id="img02">
                                    <p>圖片二(副圖)</p>
                                    <input type="file" name="image02" id="image02">
                                </div>
                                <div class="col-lg-3">
                                    <img src="${res.image03}" width="200px" id="img03">
                                    <p>圖片三</p>
                                    <input type="file" name="image03" id="image03">
                                </div>
                                <div class="col-lg-3">
                                    <img src="${res.image04}" width="200px" id="img04">
                                    <p>圖片四</p>
                                    <input type="file" name="image01" id="image04">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                                                    <input type="text" class="form-control" name="name" id="name"
                                                           value="${res.name} ">
                                                </div>
                                                <div class="form-group">
                                                   
                                                    <p>品牌</p>
                                                     <input type="text" class="form-control" name="fkBrand" id="fkBrand"
                                                           value="${res.fkBrand.name}" disabled>
                                                
                                                </div>
                                                <div class="form-group">
                                                    <p>價格</p>
                                                    <input type="text" class="form-control" name="price" id="price"
                                                           value="${res.price} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>種類</p>
                                                    <input type="text" class="form-control" name="categories" id="categories"
                                                           value="${res.categories} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>庫存</p>
                                                    <input type="text" class="form-control" name="stock" id="stock"
                                                           value="${res.stock} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>規格</p>
                                                    <input type="text" class="form-control" name="model" id="model"
                                                           value="${res.model}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <p>產品描述</p>
                                                    <textarea rows="18" name="description" id="description" class="form-control" style="height:100%"
                                                              >${res.description}</textarea>
                                                </div>
                                                <div class="form-group" hidden>
                                                    <p>品牌</p>
                                                    <input type="text" class="form-control" name="model" id="fkBrandid"
                                                           value="${res.fkBrand.id}" >
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            <div class="row">
                <div class="col-lg-4">
                    
                        
                </div>
                <div class="col-lg-2">
                    <div>
                        <a id="savebtn" class="btn btn-warning">儲存變更</a>
                    </div>
                    </div>
                    <div class="col-lg-2">
                    <div>
                        <a id="deletebtn" class="btn btn-danger">刪除</a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div>
                            <a id="onekey" class="btn btn-default">一鍵</a>
                        </div>
                        
                </div>
                <div class="col-lg-2">
                    
                        
                </div>
                </div>
           
`
        $('#main-content').html(txt);



    })

})




$('#main-content').on('click','#deletebtn',function (){
    let getUrlString = location.href;
    let url = new URL(getUrlString);
    console.log(url);
    let id = url.searchParams.get('id')
    console.log("喔齁")
    console.log(id)
    swal.fire({   // swal.fire 都是在設定sweetalert
        title: '你確定要刪除嗎？',
        text: "此動作無法復原！",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#7dbefc',
        cancelButtonColor: '#d33',
        confirmButtonText: '確定刪除',
        cancelButtonText: '取消'
    }).then((result) => {   // 按了任何一個按鈕後
        if (result.isConfirmed) {   // 如果是按確定
            $.ajax({
                url: `/Design/B/product/delete/${id}`,
                method: 'GET',
                beforeSend: function () {
                    swal.fire({
                        imageUrl: '/Design/static/back/universal/images/load-img.gif',
                        imageHeight: 300,
                        showConfirmButton: false
                    });
                },
                success: function (deres) {
                    console.log(deres);
                    swal.fire({
                        icon: 'success',
                        html: '<h5>刪除成功!</h5>'
                    }).then(function () {
                        window.location.href="/Design/B/Product/"
                    });

                },
                error: function (deres) {
                    console.log(deres);
                    // window.alert('刪除失敗');
                    swal.fire({
                        icon: 'error',
                        html: '<h5>刪除失敗!</h5>'
                    }).then(function () {
                        location.reload();
                    });

                } // end of error:
            }); // end of $.ajax()
        } // end of if (result.isConfirmed)
    }); //end of then((result)

});



$('#main-content').on('click','#savebtn',function (){
    let getUrlString = location.href;
    let url = new URL(getUrlString);
    console.log(url);
    let id = url.searchParams.get('id')
    console.log("喔齁")
    console.log(id)
    let name = $('#name').val();
    let price = $('#price').val();
    let stock = $('#stock').val();
    let categories = $('#categories').val();
    let model = $('#model').val();
    let description = $('#description').val();
    let fkBrand = $('#fkBrandid').val();
    let img01 = $('#img01').attr('src');
    let img02 = $('#img02').attr('src');
    let img03 = $('#img03').attr('src');
    let img04 = $('#img04').attr('src');
    let datas = {
        "name": name,
        "price":price,
        "stock":stock,
        "categories":categories,
        "model":model,

        "fkBrand":{"id":fkBrand},
        "description":description,
        "image01":img01,
        "image02":img02,
        "image03":img03,
        "image04":img04
    }
    console.log(datas);

    swal.fire({   // swal.fire 都是在設定sweetalert
        title: '你確定要更新嗎？',
        text: "此動作無法復原！",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#7dbefc',
        cancelButtonColor: '#d33',
        confirmButtonText: '確定更新',
        cancelButtonText: '取消'
    }).then((result) => {   // 按了任何一個按鈕後
        if (result.isConfirmed) {   // 如果是按確定
            $.ajax({
                url: `/Design/B/product/updateById/${id}`,
                data: JSON.stringify(datas),
                method: 'POST',
                contentType:'application/json',
                beforeSend: function () {
                    swal.fire({
                        imageUrl: '/Design/static/back/universal/images/load-img.gif',
                        imageHeight: 300,
                        showConfirmButton: false
                    });
                },
                success: function (deres) {
                    console.log(deres);
                    swal.fire({
                        icon: 'success',
                        text: 'Something went wrong!',
                        html: '<h5>修改成功!</h5>'
                    }).then(function () {
                        window.location.href="/Design/B/Product/"
                    });

                },
                error: function (deres) {
                    console.log(deres);
                    // window.alert('刪除失敗');
                    swal.fire({
                        icon: 'error',
                        html: '<h5>修改失敗!</h5>'
                    }).then(function () {
                        location.reload();
                    });

                } // end of error:
            }); // end of $.ajax()
        } // end of if (result.isConfirmed)
    }); //end of then((result)




    // $.ajax({
    //     url: "/Design/B/product/insert",
    //     method: "POST",
    //     data: JSON.stringify(datas),
    //     // processData:false,
    //     contentType:'application/json',
    //     success: function (res) {
    //         console.log(res);
    //     },
    //     error: function (err) {
    //         console.log(err)
    //     }


})


$('#main-content').on("click",'#onekey',function () {
    $('#name').val('Tom Dixon Stone LED Pendant Light 18cm 石器系列 圓形吊燈');
    $('#price').val('17300');
    $('#categories').val('Suspensions');
    $('#stock').val('2');
    $('#model').val('大理石白');
    $('#description').val('2015 年，Tom Dixon 將這個獨特高雅的大理石之美，投入到吊燈系列作品，以白色大理石天然紋路，搭配象徵奢華亮彩的黃銅元素，合而為一，讓 Stone 系列吊燈，以精巧的尺寸，呈現一份無與倫比的主題張力。下方的黃銅反射罩設計，讓您不會直視光源，卻能夠反射出溫潤自然的幸福燈光。適合餐桌多盞搭配使用。');
})