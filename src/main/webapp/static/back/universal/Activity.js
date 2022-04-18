$(function () {

  // 主要清單的DataTable
  $('#table_data').DataTable({});

  // 刪除按鈕功能
  let id;
  $('.btn.btn-danger.delete').click(function () {
    let deleteBtn = $(this);
    // SamWang To-Do: jQuery 尚未抓到ID的值
    id = deleteBtn.parent('td').siblings('td:eq(0)').text();
    console.log(id);
    let urlStr = "deleteApi/" + id;
    $.ajax({
      url: urlStr,
      method: 'GET',
      success: function (res) {
        console.log(res);
        deleteBtn.closest('tr').remove();
        window.alert('刪除成功');
      },
      error: function (res) {
        console.log(res);
        window.alert('刪除失敗');
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
      content: $('#insertContent').val(),
      discountPercentage: $('#insertdiscountPercentage').val(),
      startDate: $('#insertStartDate').val(),
      endDate: $('#insertEndDate').val()
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
        console.log(res)
      },
      error: function (e) {
      }
    });
  }

});
