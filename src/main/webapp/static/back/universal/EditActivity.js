$(function () {
  $('#chooseBrand').click(function () {
    $('#brandDialog').dialog('open');
  });

  $('#brandDialog').dialog({
    width: 1000,
    autoOpen: false
  });

  // 編輯按鈕送出
  $('#updateBtn').click(
      function () {

        $("input[name='brands']:checked").each(function() {
          console.log($(this).val());
        })

        let data = {
          id: $('#activityID').text(),
          subject: $('#updateSubject').val(),
          content: $('#updateContent').val(),
          discountPercentage: $('#updatediscountPercentage').val(),
          startDate: $('#updateStartDate').val(),
          endDate: $('#updateEndDate').val()
        }
        // SamWang to-do: 尚未正常傳送 brands

        const dataFile = new FormData();
        dataFile.append("file", $('#updateImg')[0].files[0]);
        dataFile.append("data", JSON.stringify(data));
        console.log("送出內容：" + JSON.stringify(data))

        $.ajax({
          type: "POST",
          url: "/Design/B/Activity/updateActivity",
          data: dataFile,
          processData: false, // 防止jquery將data變成query String
          contentType: false,
          beforeSend: function () {
            swal.fire({
              html: '<h5>更新中...</h5>',
              showConfirmButton: false,
              onRender: function () {
                // there will only ever be one sweet alert open.
                // $('.swal2-content').prepend(sweet_loader);
              }
            });
          },
          success: function (json) {
            console.log(json);
            // window.alert('新增成功');
            // location.reload();
            swal.fire({
              icon: 'success',
              html: '<h5>更新成功!</h5>'
            }).then(function () {
              location.reload();
            });

          },
          error: function (res) {
            console.log(res);
            swal.fire({
              icon: 'error',
              html: `<h5>${res.responseText}!</h5>`
            }).then(function () {
              location.reload();
            });
            // return false;
          }
        }); //end of ajax
      }
  );

});
