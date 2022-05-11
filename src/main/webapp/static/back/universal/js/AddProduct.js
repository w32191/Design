$(function () {

    let getUrlString = location.href;
    let url = new URL(getUrlString);
    console.log(url);
    let fkBrand = url.searchParams.get('fkBrand')
    console.log(fkBrand)


    $.getJSON(`/Design/B/brand/findBrandById/${fkBrand}`, function (res) {
        console.log(res.name)
        $('#fkBrand').attr("value", `${res.name}`)
    })


    //imgur圖片上傳四張
    $('input[id=image01]').on("change", function () {
        var $files = $(this).get(0).files;
        var formData = new FormData();
        formData.append("file", $files[0]);

        $.ajax({
            url: '/Design/F/Product/uploadImg',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (image01) {
                console.log(image01);

                $("#img01").attr("src", image01)
            },
            error: function (err) {
                console.log(err);
            }
        });

    });
    $('input[id=image02]').on("change", function () {
        var $files = $(this).get(0).files;
        var formData = new FormData();
        formData.append("file", $files[0]);

        $.ajax({
            url: '/Design/F/Product/uploadImg',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (image02) {
                console.log(image02);

                $("#img02").attr("src", image02)
            },
            error: function (err) {
                console.log(err);
            }
        });

    });
    $('input[id=image03]').on("change", function () {
        var $files = $(this).get(0).files;
        var formData = new FormData();
        formData.append("file", $files[0]);

        $.ajax({
            url: '/Design/F/Product/uploadImg',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (image03) {
                console.log(image03);

                $("#img03").attr("src", image03)
            },
            error: function (err) {
                console.log(err);
            }
        });

    });
    $('input[id=image04]').on("change", function () {
        var $files = $(this).get(0).files;
        var formData = new FormData();
        formData.append("file", $files[0]);

        $.ajax({
            url: '/Design/F/Product/uploadImg',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (image04) {
                console.log(image04);

                $("#img04").attr("src", image04)
            },
            error: function (err) {
                console.log(err);
            }
        });

    });


    $('#savebtn').click(function () {
        let name = $('#inputName01').val();
        let price = $('#price').val();
        let stock = $('#stock').val();
        let categories = $('#categories').val();
        let model = $('#model').val();
        let description = $('#description').val();
        // let fkBrand = $('#fkBrand').val();
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
            // "fkBrand":fkBrand,
            "fkBrand":{"id":fkBrand},
            "description":description,
            "image01":img01,
            "image02":img02,
            "image03":img03,
            "image04":img04
        }

        console.log(datas)
        console.log(JSON.stringify(datas))

        // $.post("/Design/B/product/insert",datas,function (ires){
        //     console.log(ires.name)
        // })

        swal.fire({   // swal.fire 都是在設定sweetalert
            title: '你確定要新增嗎？',
            text: "新增後會直接上架商品",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#7dbefc',
            cancelButtonColor: '#d33',
            confirmButtonText: '確定更新',
            cancelButtonText: '取消'
        }).then((result) => {   // 按了任何一個按鈕後
            if (result.isConfirmed) {   // 如果是按確定
                $.ajax({
                    url: `/Design/B/product/insert`,
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
                            html: '<h5>新增成功!</h5>'
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
        //
        // })
    })

    $('#onekey').on("click",function () {
        $('#inputName01').val('Tom Dixon 圓形吊燈');
        $('#price').val('1000');
        $('#categories').val('Suspensions');
        $('#stock').val('1');
        $('#model').val('大理石白');
        $('#description').val('2015 年，Tom Dixon 將這個獨特高雅的大理石之美');
    })

});




