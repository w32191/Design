$(function () {
    $.getJSON("/Design/B/brand/findAll", function (res) {
        let txt = '';
        console.log(res.length);
        for (let i = 0; i < res.length; i++) {
            console.log(res[i].name);
            txt += `
                                <div class="media" id="brandBtn${res[i].id}">
                                    <div class="media-left">
                                        <a href="#"><img class="media-object"
                                                         src="${res[i].img}"
                                                         alt="..."></a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading ">${res[i].name}</h4>
                                     </div>
                                </div>
                    `
        }   // end of for()
        $('#bnd').html(txt);
    });

    $('body').on('click','div[id^=brandBtn]',function(){

        let id = $(this).attr('id').split("brandBtn")[1];
        console.log(id)
        $('#addbtn').html(`<div>
                <a href="/Design/B/Product/addProduct?fkBrand=${id}" class="btn btn-warning">＋新增商品</a>
            </div>`)

        $.getJSON(`/Design/B/product/findProductByBrand/${id}`,function(pdres){
            let pdtxt='';
            for (let i=0 ; i<pdres.length;i++){
                let j=i+1
                pdtxt +=`
                <tr>
                                            <td>${j}
                                            </td>
                                           
                                            <td>
                                            <a href="http://localhost:8080/Design/F/product/product-details?id=${pdres[i].id}">
                                            <img src="${pdres[i].image01}" width="60px" height="60px"></a>
                                                
                                            </td>
                                            
                                            <td> <a href="http://localhost:8080/Design/F/product/product-details?id=${pdres[i].id}">
                                                ${pdres[i].name}</a>
                                            </td>
                                          
                                            <td>
                                                <span class="badge badge-primary"> ${pdres[i].stock}</span>
                                            </td>
                                            
                                            <td>
                                            <a href="/Design/B/Product/editProduct?id=${pdres[i].id}">
                                               <span class="ti-pencil-alt"></span></a>
                                              
                                         
                                            </td>
                                            
                                            
                                        </div>
                                        </tr>

                `
            }
            $('#pdlist').html(pdtxt);
        })




    })




})