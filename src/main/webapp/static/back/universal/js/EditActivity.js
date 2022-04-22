$(function () {
  // 點折扣商品，跳出選擇品牌的視窗
  $('#chooseBrand').click(function () {
    $('#brandDialog').removeAttr('hidden').dialog('open');
  });

  // 品牌選擇視窗設定
  $('#brandDialog').dialog({
    width: 1000,
    autoOpen: false
  });

  // 編輯按鈕送出
  $('#updateBtn').click(
      function () {

        let brandsChecked = [];
        $("input[name='brands']:checked").each(function() {
          // console.log($(this).val());
          brandsChecked.push($(this).val());  // 將被勾選的val放入brandsChecked陣列
        })

        // 準備要序列化的JavaScript物件
        let data = {
          id: $('#activityID').text(),
          subject: $('#updateSubject').val(),
          content: $('#updateContent').val(),
          discountPercentage: $('#updatediscountPercentage').val(),
          startDate: $('#updateStartDate').val(),
          endDate: $('#updateEndDate').val(),
          brand:brandsChecked
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
  );

});
