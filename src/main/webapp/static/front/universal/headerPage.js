$(function () {

    //autocomplete
    $('#tags').on('change', function () {

        let availableTags;
        let nameVal = $('#tags').val();
        $.ajax({
            url: "/Design/B/product/findByNameLike",
            type: "POST",
            data: { name: nameVal },
            success: function (acdata) {
                console.log(acdata);
                availableTags = (acdata.name).split(",")
                $("#tags").autocomplete({
                    source: availableTags
                })
            },
            error: function (err) {
                console.log(err);
            }
        });

    });


});
