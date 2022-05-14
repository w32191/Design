$(function () {
  let pageUl = $('#pageUl');
  let searchName = $('#searchName');
  let sort = 'startDate';
  let orderBy = 'asc';

  $('#deleteBatchBtn').click(function () {
    let idList = [];
    let urlStr = 'deleteBatch'
    $('input[id^=checkbox]:checked').each(function () {
      console.log($(this).attr('id').split('checkbox')[1]);
      idList.push(parseInt($(this).attr('id').split('checkbox')[1]));
    });
    console.log(idList)
    if (idList.length > 0) {
      deleteSend(urlStr, idList);
    } else {
      swal.fire({
        icon: 'error',
        html: '<h5>請至少勾選一項!</h5>'
      })
    }
  });

  // 刪除按鈕 按了觸發
  $('.btn.btn-danger.delete').click(function () {
    let deleteBtn = $(this);
    let id = deleteBtn.parent('td').siblings('td:eq(1)').text();
    let urlStr = "delete/" + id;
    let idList = [];
    deleteSend(urlStr, idList);

  });

  $('#insertBtn').on('click', insertSend);

  // 全選跟取消全選
  $('#selectBtn').click(function () {
    let txt = $(this).text();

    if (txt === '全選') {
      $(this).text('取消全選');
      $('.form-control.checks').prop('checked', true);
    } else {
      $(this).text('全選');
      $('.form-control.checks').prop('checked', false);
    }

  });

  // // 一件輸入按鈕
  // $('#oneKeyInputBtn').click(oneKeyInput);

  $('label[for=insertSubject]').click(function () {
    $('#insertSubject').val('Tom Dixon. 週年慶');
  });

  $('label[for=insertContent]').click(function () {
    $('#insertContent').val('Tom Dixon. 週年慶\n限時三天！！\n只有三天要買要快！！！\n全品牌七折！！');
  });

  $('label[for=insertdiscountPercentage]').click(function () {
    $('#insertdiscountPercentage').val(33);
  });

  $('label[for=insertStartDate]').click(function () {
    document.getElementById('insertStartDate').valueAsDate = new Date();
  });

  $('label[for=insertEndDate]').click(function () {
    $('#insertEndDate').val('2022-05-23');
  });

  $('#cleanSearch').click(function () {
    $('#searchStart').val('');
    $('#searchEnd').val('');
    searchName.val('');
    pageAndSearch(sort, 1);
  });

  //  篩選的主題、時間欄位
  $('#searchName,#searchStart,#searchEnd').on('blur change', function () {
    pageAndSearch(1);
  });

  // 篩選的主題的keyup
  searchName.on('keyup', function () {
    let str = $(this).val();
    $.ajax({
      url: '/Design/B/Activity/searchBySubject/' + str,
      type: 'GET',
      success: function (res) {
        console.log(res);
        setAutoComplete(res);
      },
      error: function (err) {
        console.log(err);
      }
    });
  });

  pageUl.on('click', '.page-link.numBtn', function () {
    let page = $(this).text();

    //  調整分頁樣式
    if (page == 1) {
      $('#pageUl li:first-child').addClass('disabled');
    } else {
      $('#pageUl li:first-child').removeClass('disabled');
    }
    $(this).parent('li').addClass('active')
    .siblings('li').removeClass('active');

    // 送出查詢條件
    pageAndSearch(page);
  });

  // 後一頁按鈕
  pageUl.on('click', '#nextPageBtn', function () {
    let page = $('.page-item.active').children('button').text();
    pageAndSearch(parseInt(page) + 1);
  });

  // 前一頁按鈕
  pageUl.on('click', '#prePageBtn', function () {
    let page = $('.page-item.active').children('button').text();
    pageAndSearch(parseInt(page) - 1);
  });

  // 圖片預覽
  $('#insertUploadFile').on('change', function () {
    readURL(this);
  });

  // 用折扣排序
  $('#discountTh').on('click', function () {
    sort = 'discountPercentage';
    changeSortIcon($(this));
    pageAndSearch(1);
  });

  $('#idTh').on('click', function () {
    sort = 'id';
    changeSortIcon($(this));
    pageAndSearch(1);
  });

  $('#startTh').on('click', function () {
    sort = 'startDate';
    changeSortIcon($(this));
    pageAndSearch(1);
  });

  $('#endTh').on('click', function () {
    sort = 'endDate';
    changeSortIcon($(this));
    pageAndSearch(1);
  });

  function changeSortIcon(e) {
    let sortSapn = e.children('span');

    if (sortSapn.hasClass('ti-angle-double-down')) {
      orderBy = 'asc';
      sortSapn.closest('tr').find('span').addClass('ti-angle-double-down')
      .removeClass('ti-angle-double-up text-light badge badge-secondary');

      sortSapn.removeClass('ti-angle-double-down').addClass(
          'ti-angle-double-up').addClass('text-light badge badge-secondary');

    } else if (sortSapn.hasClass('ti-angle-double-up')) {
      orderBy = 'desc';
      sortSapn.closest('tr').find('span').addClass('ti-angle-double-down')
      .removeClass('ti-angle-double-up text-light badge badge-secondary');

      sortSapn.addClass('text-light').addClass('badge badge-secondary');
    }
  }

  function readURL(input) {
    if (input.files && input.files[0]) {
      let reader = new FileReader();
      reader.onload = function (e) {
        $("#reviewImg").attr('src', e.target.result).removeAttr('hidden');
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  // 換頁以及search時 更新資料
  function pageAndSearch(page) {
    let start = $('#searchStart').val();
    let end = $('#searchEnd').val();
    let subject = searchName.val();

    $.ajax({
      url: '/Design/B/Activity/searchByTime',
      type: 'POST',
      data: {
        start: start,
        end: end,
        subject: subject,
        sortBy: sort,
        order: orderBy,
        page: page
      },
      success: function (res) {
        // console.log(res);
        showTableData(res.content);
        showPaginationButton(res.totalPages, res.number, res.numberOfElements);
        showTotalElements(res.totalElements);
      },
      error: function (err) {
        console.log(err);
      }
    });
  }

  // 發送新活動資料
  function insertSend() {
    // 取得輸入的資料
    const data = {
      subject: $('#insertSubject').val(),
      content: $('#insertContent').val(),
      discountPercentage: $('#insertdiscountPercentage').val(),
      startDate: $('#insertStartDate').val(),
      endDate: $('#insertEndDate').val(),
      color: $('#insertColor').val()
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
          imageUrl: '/Design/static/back/universal/images/load-img-color.gif',
          imageHeight: 300,
          showConfirmButton: false
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

  function deleteSend(urlStr, datalist) {
    swal.fire({   // swal.fire 都是在設定sweetalert
      title: '你確定要刪除嗎？',
      text: "此動作無法復原！",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#348def',
      confirmButtonText: '確定刪除',
      cancelButtonText: '取消'
    }).then((result) => {   // 按了任何一個按鈕後
      if (result.isConfirmed) {   // 如果是按確定
        $.ajax({
          url: urlStr,
          method: 'DELETE',
          data: {dataArray: datalist},
          traditional: true,
          beforeSend: function () {
            swal.fire({
              imageUrl: '/Design/static/back/universal/images/load-img-color.gif',
              imageHeight: 300,
              showConfirmButton: false
            });
            console.log(datalist)
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

          } // end of error:
        }); // end of $.ajax()
      } // end of if (result.isConfirmed)
    }); //end of then((result)
  }

  function oneKeyInput() {
    document.getElementById('insertStartDate').valueAsDate = new Date();
    $('#insertSubject').val('Tom Dixon. 週年慶');
    $('#insertContent').val('全品牌限時特價！！\n只要三折！！！\n通通三折，要買要快！！');
    $('#insertdiscountPercentage').val(30);
    $('#insertEndDate').val('2022-05-30');
  }

  function setAutoComplete(availableTags) {
    console.log(availableTags)
    searchName.autocomplete({
      source: availableTags,
      autoFocus: true,
      classes: {
        "ui-autocomplete": "highlight"
      },
      minLength: -1,
      delay: 0
    });
  }

  function showTableData(activities) {
    // $('#theTbody').html('');

    console.log(activities);

    // 上方table資料append用
    let txt = '';
    if (activities.length === 0) {
      txt = `<tr><td colspan="9" class="col-lg-12"><h1>查無資料</h1></td></tr>`;
    } else {

      $.each(activities, function (index, ac) {
        txt += `<tr><td><input type="checkbox" id="checkbox${ac.id}" class="form-control checks"></td>`;
        txt += `<td class="showId">${ac.id}</td>`;
        txt += `<td>${ac.subject}</td>`;

        if (ac.imgurImgs.length > 0) {
          txt += ` <td><img src="${ac.imgurImgs[0].link}" alt="" width="100"/></td>`
        } else {
          txt += ` <td><img src="/Design/static/back/universal/images/no-image.jpeg" alt="" width="100" height="100"/></td>`
        }

        txt += `<td class="color-danger">${ac.discountPercentage}%</td>`;
        txt += `<td>${ac.startDate}</td><td>${ac.endDate}</td>`;
        txt += `<td><a href="editActivity/${ac.id}" class="btn btn-warning">編輯</a></td>`;
        txt += `<td><button type="button" class="btn btn-danger delete">刪除</button></td></tr>`;

      });
    }

    $('#theTbody').html(txt);
  }

  function showPaginationButton(totalPages, page, numberOfElements) {

    let txt = '';
    // 有查到資料
    if (numberOfElements != 0) {

      // 上一頁按鈕
      if (page == 0) {  //  現在是第一頁
        txt += `<li class="page-item disabled">`;
      } else {
        txt += `<li class="page-item">`;
      }
      txt += `<button class="page-link" id="prePageBtn">前一頁</button></li>`;

      // 中間數字按鈕
      for (let i = 0; i < totalPages; i++) {
        if (i == page) {
          txt += `<li class="page-item active">`;
        } else {
          txt += `<li class="page-item">`;
        }
        txt += `<button class="page-link numBtn" >${i + 1}</button></li>`;
      }

      // 下一頁按鈕
      if ((page + 1) == totalPages) {
        txt += `<li class="page-item disabled">`;
      } else {
        txt += `<li class="page-item">`;
      }
      txt += `<button class="page-link" id="nextPageBtn">後一頁</button></li>`;

    }

    pageUl.html(txt);

  }

  function showTotalElements(totalElements) {
    $('#totalElements').text(`共 ${totalElements} 筆`);
  }

});
