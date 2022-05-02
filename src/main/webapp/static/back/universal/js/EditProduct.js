$(function () {

    let getUrlString = location.href;
    let url = new URL(getUrlString);
    console.log(url);
    let id = url.searchParams.get('id')
    console.log(id)

    $.getJSON(`/Design/B/product/findProductById/${id}`, function (res) {
        console.log(res.name)
        let txt = '';








    })
$('#edit').html(txt);


})