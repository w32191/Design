$(function () {

    //autocomplete
    $('#tags').on('keyup change', function () {

        let availableTags;
        let nameVal = $('#tags').val();

        $.ajax({
            url: "/Design/B/product/findByNameLike",
            type: "POST",
            data: {name: nameVal},
            success: function (acdata) {
                // console.log(acdata);

                let availableTags = [];
                let sizeLength = 5;
                if(acdata.length < 5){
                    sizeLength = acdata.length;
                }
                for (let i = 0; i < sizeLength; i++) {
                    let aid = acdata[i].id
                    let aname = acdata[i].name
                    let aimg = acdata[i].image01
                    // console.log(acdata[i].id);
                    // console.log(acdata[i].name);
                    availableTags.push(aname);
                    $('#seachList').append(`<li> <a href="/Design/F/product/product-details?id=${aid}"><img src="${aimg}" width="60px">${aname}</a></li><hr>`);
                }

                console.log(availableTags);
                // availableTags = (acdata.name).split(",")
                // $("#tags").autocomplete({
                //     source: availableTags
                // })
            },
            error: function (err) {
                console.log(err);
            }
        });

    });

    $('#tags').on('keydown blur',function (){
        $('#seachList').html('');
    });


});
