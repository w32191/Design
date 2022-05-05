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
                                                    <input type="text" class="form-control" name="name"
                                                           value="${res.name} ">
                                                </div>
                                                <div class="form-group">
                                                   
                                                    <p>品牌</p>
                                                    <select class="form-control">
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                
                                                </div>
                                                <div class="form-group">
                                                    <p>價格</p>
                                                    <input type="text" class="form-control" name="price"
                                                           value="${res.price} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>種類</p>
                                                    <input type="text" class="form-control" name="categories"
                                                           value="${res.categories} ">
                                                </div>
                                                <div class="form-group">
                                                    <p>庫存</p>
                                                    <input type="text" class="form-control" name="stock"
                                                           value="${res.stock} ">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <p>產品描述</p>
                                                    <textarea class="form-control" rows="5" name="description"
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
                <div class="col-lg-4">
                    
                        
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

$('#deletebtn').click(function () {
    console.log("被按了")


});
