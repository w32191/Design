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
        let formData = new FormData();

        let name = $('#inputName01').val();
        let price = $('#price').val();
        let stock = $('#stock').val();
        let categories = $('#categories').val();
        let description = $('#description').val();
        let fkBrand = $('#fkBrand').val();
        let img01 = $('#img01').attr('src');
        let img02 = $('#img02').attr('src');
        let img03 = $('#img03').attr('src');
        let img04 = $('#img04').attr('src');


        formData.append("name", name);
        // formData.append("fkBrand", fkBrand);
        // formData.append("price", price);
        // formData.append("stock", stock)
        // formData.append("categories", categories)
        // formData.append("description", description)
        //
        //
        // formData.append("image01", img01);
        // formData.append("image02", img02);
        // formData.append("image03", $('#img03').attr('src'));
        // formData.append("image04", $('#img04').attr('src'));

        let datas = {
            "name": name,
            "price":price,
            "stock":stock,
            "categories":categories,
            "fkBrand":fkBrand,
            "description":description,
            "image01":img01,
            "image02":img02,
            "image03":img03,
            "image04":img04
        }

        console.log(datas)
        console.log(JSON.stringify(datas))

        $.ajax({
            url: "/Design/B/product/insert",
            method: "POST",
            data: datas,
            // processData:false,
            contentType:'application/json',
            success: function (res) {
                console.log(res);
            },
            error: function (err) {
                console.log(err)
            }

        })
    })


});




