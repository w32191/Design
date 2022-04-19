$(function () {

  $('#insertBtn').click(function () {
        $("#insertDialog").dialog('open');
      }
  );
  $("#insertDialog").dialog({
    autoOpen: false,
    // width: 350,
    modal: true,
    buttons: {
      "新增": function () {
        // $('#insertForm').submit();
        send();
        $(this).dialog('close');
      },
      "取消": function () {
        $(this).dialog('close');
      }
    }
  });

  // 主要清單的DataTable
  $('#table_data').DataTable({});

  // 刪除按鈕功能
  let id;
  $('.btn.btn-danger.delete').click(function () {
    let deleteBtn = $(this);
    id = deleteBtn.parent('td').siblings('td:eq(0)').text();

    // let urlStr = "delete/" + id;
    // deleteBtn.attr("href",urlStr);

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
      error: function (res) {
        console.log(res.responseText);
      }
    });
  }

});
