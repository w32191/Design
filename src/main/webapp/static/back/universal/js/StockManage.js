$(function () {

    $.getJSON("/Design/B/product/doSomethingGetBrand", function (res) {
        let txt = '';
        console.log(res.length);
        for (let i = 0; i < res.length; i++) {
            console.log(res[i].name)
            let k =
                txt += `
           
            <tr>
                <td>${i + 1}</td>
                <td>
                    <img src="${res[i].img}" width="60px" height="60px">
                </td>
                <td>${res[i].name}</td>
                <td><a class="showmore" id="smbtn${res[i].id}" style="color: #337ab7;">Show More</a></td>
                <td></td>
                <td></td>
            </tr>
            
            `
        }
        $('#bdlist').html(txt);

    })


    $('body').on('click', 'a[id^=smbtn]', function () {
        console.log("喔齁")
        let id = $(this).attr('id').split("smbtn")[1];
        console.log(id)

        let pdtxt = '';
        $.getJSON(`/Design/B/product/doSomethingGetPorduct/${id}`, function (pdres) {
            for (let i = 0; i < pdres.length; i++) {
                let j = pdres[i].stock;
                let k = pdres[i].amount;
                console.log(j)
                console.log(k)
                let m = (k - j);


                pdtxt += `
                <tr>
                    <td>${i+1}</td>
                    <td><img src="${pdres[i].image01}" width="50px"></td>
                    <td>${pdres[i].name}</td>
                    <td>${pdres[i].stock}</td>
                    <td>${m}</td>
                </tr>
                `
            }

            $('#plist').html(pdtxt);
        })


    })


})