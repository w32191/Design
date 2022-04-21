$(function () {

  // 主要清單的DataTable
  $('#table_data').DataTable({});

  // 刪除按鈕功能
  $('.btn.btn-danger.delete').click(function () {
    let deleteBtn = $(this);
    let id = deleteBtn.parent('td').siblings('td:eq(0)').text();
    let urlStr = "delete/" + id;
    swal.fire({
      title: '你確定要刪除嗎？',
      text: "此動作無法復原！",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '確定刪除',
      cancelButtonText: '取消'
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: urlStr,
          method: 'DELETE',
          beforeSend: function () {
            swal.fire({
              html: '<h5>刪除中...</h5>',
              showConfirmButton: false,
              onRender: function () {
                // there will only ever be one sweet alert open.
                // $('.swal2-content').prepend(sweet_loader);
              }
            });
          },
          success: function (res) {
            console.log(res);
            swal.fire({
              icon: 'success',
              html: '<h5>刪除成功!</h5>'
            }).then(function () {
              location.reload();
            });

          },
          error: function (res) {
            console.log(res);
            // window.alert('刪除失敗');
            swal.fire({
              icon: 'error',
              html: '<h5>刪除失敗!</h5>'
            }).then(function () {
              location.reload();
            });
          }
        });
      }
    })

  });

  // 新增活動 按鈕
  $('#insertBtn').click(function () {
        $("#insertDialog").removeAttr('hidden').dialog('open');
      }
  );

  // 新增活動 dialog設定
  $("#insertDialog").dialog({
    autoOpen: false,
    width: 500,
    modal: true,
    buttons: {
      "新增": function () {
        // $('#insertForm').submit();
        insertSend();
        $(this).dialog('close');
      },
      "取消": function () {
        $(this).dialog('close');
      }
    }
  });

  // 發送新活動資料
  function insertSend() {
    // 取得輸入的資料
    const data = {
      subject: $('#insertSubject').val(),
      content: $('#insertContent').val(),
      discountPercentage: $('#insertdiscountPercentage').val(),
      startDate: $('#insertStartDate').val(),
      endDate: $('#insertEndDate').val()
    }
    // 將輸入的文字資料及檔案，包進FormData
    const dataFile = new FormData();
    dataFile.append("file", $('#insertUploadFile')[0].files[0]);
    dataFile.append("data", JSON.stringify(data));

    $.ajax({
      type: "PUT",
      url: "insertActivity",
      data: dataFile,
      processData: false, // 防止jquery將data變成query String
      contentType: false,
      beforeSend: function () {
        swal.fire({
          html: '<h5>圖片上傳中...</h5>',
          showConfirmButton: false,
          onRender: function () {
            // there will only ever be one sweet alert open.
            // $('.swal2-content').prepend(sweet_loader);
          }
        });
      },
      success: function (json) {
        // console.log(json);
        // window.alert('新增成功');
        // location.reload();
        swal.fire({
          icon: 'success',
          html: '<h5>新增成功!</h5>'
        }).then(function () {
          location.reload();
        });

      },
      error: function (err) {
        swal.fire({
          icon: 'error',
          html: `<h5>${err.responseText}!</h5>`
        }).then(function () {
          location.reload();
        });
        // return false;
      }
    });
  }

});
