$(function () {

    $.getJSON("/Design/B/product/doSomething", function (res) {
        let txt = '';
        console.log(res.length);
        for (let i = 0; i < res.length; i++) {
            console.log(res[i].name)
            let k =
                txt += `
            <tr>
                <td>${i+1}</td>
                <td>
                    <img src="${res[i].image01}" width="60px" height="60px">
                </td>
                <td>${res[i].name}</td>
                <td>${res[i].stock}</td>
                <td></td>
                <td></td>
                
            
            
            </tr>
            
            `
        }
        $('#pdlist').html(txt);

    })


})