$(function () {
  $('#table_data').DataTable({

  });

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
});
