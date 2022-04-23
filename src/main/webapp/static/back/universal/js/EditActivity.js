$(function () {

  // 顯示商品列表按鈕
  $('#openProducts').click(function () {
    $(this).attr("hidden", "hidden");
    $('#closeProducts').removeAttr("hidden");
    $('#brandsList').removeAttr('hidden');
    $('#productList').removeAttr('hidden');
    $.ajax({
      url: '/Design/B/Activity/getBrandsPage',
      type: 'GET',
      success: function (res) {
        console.log(res);
        let divMedia = document.createElement('div');
        divMedia.addClassName('media');
        // $('#brandContent').append(divMedia);
      }, error: function (err) {
        console.log(err);
      }
    });
  });

  // 隱藏商品列表按鈕
  $('#closeProducts').click(function () {
    $(this).attr("hidden", "hidden");
    $('#openProducts').removeAttr("hidden");
    $('#brandsList').attr("hidden", "hidden");
    $('#productList').attr("hidden", "hidden");
  });

  // 編輯按鈕送出
  $('#updateBtn').click(
      function () {

        // 準備要序列化的JavaScript物件
        let data = {
          id: $('#activityID').text(),
          subject: $('#updateSubject').val(),
          content: $('#updateContent').val(),
          discountPercentage: $('#updatediscountPercentage').val(),
          startDate: $('#updateStartDate').val(),
          endDate: $('#updateEndDate').val()
          // brands: brandsChecked
        }

        // 將要送出的檔案＆序列化後的字串放入FormData
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
            console.log(`成功的回傳值：${json}`);
            swal.fire({
              icon: 'success',
              html: '<h5>更新成功!</h5>'
            }).then(function () {
              location.reload();
            });

          },
          error: function (res) {
            console.log(`失敗的回傳值：${res}`);
            swal.fire({
              icon: 'error',
              html: `<h5>發生錯誤！</h5>`
            }).then(function () {
              location.reload();
            });
            // return false;
          }
        }); //end of ajax
      }
  );  // end of ('#updateBtn').click()

});
