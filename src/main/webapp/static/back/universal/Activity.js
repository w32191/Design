$(function () {

  // $.ajax({
  //   url: "findAllAjax",
  //   type: "GET",
  //   success: function (res) {
  //   },
  //   error: function (res) {
  //   }
  // });

  // 主要清單的DataTable
  $('#table_data').DataTable({});

  // 刪除按鈕功能
  let id;
  $('.btn.btn-danger.delete').click(function () {
    let deleteBtn = $(this);
    id = deleteBtn.closest('tr').children('th').text();
    let urlStr = "deleteApi/" + id;
    // console.log(id);
    $.ajax({
      url: urlStr,
      method: 'GET',
      success: function (res) {
        console.log(res);
        deleteBtn.closest('tr').remove();
      },
      error: function (res) {
        console.log(res);
      }
    });
  });

  // 新增活動功能
  $('#ajaxBtn').click(function (event) {
    send();
  });

  function send() {
    const dataFile = new FormData();

    const data = {
      subject: $('#insertSubject').val(),
      startDate: $('#insertStartDate').val(),

    }
    dataFile.append("file", $('#insertUploadFile')[0].files[0]);
    dataFile.append("data", JSON.stringify(data));
    console.log(JSON.stringify(data));

    $.ajax({
      type: "POST",
      url: "insertActivity",
      data: dataFile,
      processData: false, //防止jquery將data變成query String
      contentType: false,
      success: function (res) {
        console.log(res);
      },
      error: function (e) {
      }
    });
  }

});
