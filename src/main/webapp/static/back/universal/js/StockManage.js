$(function () {


    $.getJSON("/Design/B/product/doSomethingGetBrand", function (res) {

        let txt = '';
        console.log(res.length);
        for (let i = 0; i < res.length; i++) {
            console.log(res[i].name)

            txt += `
           
            <tr>
                <td>${i + 1}</td>
                <td>
                    <img src="${res[i].img}" width="60px" height="60px">
                </td>
                <td>${res[i].name}</td>
                <td><a class="showmore" id="smbtn${res[i].id}" style="color: #337ab7;">Show More</a></td>
                <td><span class="ti-mobile">&emsp; ${res[i].phone}</span><br>
                <a href="mailto:${res[i].mail}" ><span class="ti-email">&emsp; ${res[i].mail}</span></a> </td>
                <td><a id="excelbtn"><span class="ti-receipt"></span></a> </td>
            </tr>
            `
        }
        $('#bdlist').html(txt);

    })


    $('body').on('click', 'a[id^=smbtn]', function () {
        let brandName = $(this).parent('td').prev('td').text();
        let brandPhone = $(this).parent('td').next('td').text();
        console.log(brandName);
        console.log(brandPhone)
        let id = $(this).attr('id').split("smbtn")[1];
        console.log(id)

        let pdtxt = '';
        $.getJSON(`/Design/B/product/doSomethingGetPorduct/${id}`, function (pdres) {

            let exdata = [["序號", "產品名稱", "目前庫存", "缺少數量"]]

            for (let i = 0; i < pdres.length; i++) {
                let j = pdres[i].stock;
                let k = pdres[i].amount;
                console.log(j)
                console.log(k)
                let m = (k - j);

                exdata.push([(i + 1), pdres[i].name, pdres[i].stock, m])

                pdtxt += `
                <tr>
                    <td>${i + 1}</td>
                    <td><img src="${pdres[i].image01}" width="50px"></td>
                    <td>${pdres[i].name}</td>
                    <td>${pdres[i].stock}</td>
                    <td ><span class="badge badge-danger">${m}</span></td>
                    <td></td>
                </tr>
                `
            }

            $('#plist').html(pdtxt);
            console.log(exdata)

            let data = {
                "success": true,
                "errorCode": "-1",
                "msg": "匯出成功",
                "body": {
                    "title": `庫存缺項明細(${brandName} ${brandPhone})`,
                    "excelData": exdata
                }
            };
            $('body').on('click', 'a[id=excelbtn]', function () {
                console.log("88")
                excelExport();
            })

            function excelExport() {
                if (data.success) {
                    if (null != data.body && undefined != data.body) {
                        XSExport.excelExport(
                            data.body.excelData,
                            data.body.title
                        );
                    }
                }
            }

        })


    })


})




