$(function () {
  //用來儲存勾選的productID
  let checkProductArray = [];

  // 用品牌Id來刷新商品清單
  function freshProductList(brandId) {

    // 先將產品清單清空
    $('#productTbody').html('');

    $.ajax({
      url: '/Design/B/product/findProductByBrand/' + brandId,
      type: 'GET',
      success: function (res) {
        // res為該品牌的所有產品
        $.each(res, function (index, product) {

          let tr = document.createElement('tr');

          let firstTd = document.createElement('td');
          firstTd.innerHTML = `<input type="checkbox" name="checkProduct"
                                                       id="checkProduct${product.id}">`;
          let secondTd = document.createElement('td');
          if (product.image01 == null) {
            secondTd.innerHTML = `<img alt="" width="50" height="50"
                                                     src="/Design/static/back/universal/images/no-image.jpeg"/>`;
          } else {
            secondTd.innerHTML = `<img alt="" width="50" height="50"
                                                     src="${product.image01}"/>`;
          }
          let thirdTd = document.createElement('td');
          thirdTd.innerText = `${product.name}`;

          let fourthTd = document.createElement('td');
          fourthTd.innerText = `${product.categories}`;

          let fiveTh = document.createElement('td');
          fiveTh.innerText = `$${product.price}`;

          let sixTd = document.createElement('td');
          sixTd.innerText = `${product.stock}`;

          tr.append(firstTd);
          tr.append(secondTd);
          tr.append(thirdTd);
          tr.append(fourthTd);
          tr.append(fiveTh);
          tr.append(sixTd);
          $('#productTbody').append(tr);
        }); // end of each()

      },
      error: function (err) {
        console.log(err);
      }
    });
  }

  // 顯示商品列表按鈕
  $('#openProducts').click(function () {
    $(this).attr("hidden", "hidden");
    $('#closeProducts').removeAttr("hidden");
    $('#brandsList').removeAttr('hidden');
    $('#productList').removeAttr('hidden');

    // 取得品牌資料後，顯示品牌清單
    $.ajax({
      url: '/Design/B/Activity/getBrandsPage',
      type: 'GET',
      success: function (res) {

        // 取得品牌清單後，append在左側清單
        $.each(res.content, function (index, brand) {
          // 品牌外層div
          let divMedia = document.createElement('div');
          divMedia.classList.add('media');
          // divMedia.classList.add(`selectBrand${brand.id}`);
          divMedia.setAttribute('id', `selectBrand${brand.id}`);
          // 左側放圖div
          let divMediaLeft = document.createElement('div');
          divMediaLeft.classList.add('media-left');
          // 設定圖片路徑
          let img = document.createElement('img');
          if (brand.img == null) {
            img.setAttribute('src',
                '/Design/static/back/universal/images/no-image.jpeg');
          } else {
            img.setAttribute('src', brand.img);
          }
          divMediaLeft.append(img);
          // 右側品牌名稱及描述
          let divMediaBody = document.createElement('div');
          divMediaBody.classList.add('media-body');
          let str = `<h4 class="media-heading">${brand.name}</h4>`;
          str = str + `<p>${brand.description}</p>`;
          divMediaBody.innerHTML = str;

          divMedia.append(divMediaLeft, divMediaBody);
          $('#brandContent').append(divMedia);
        }); // end of each()

        // 右側商品清單，載入第一筆品牌的所有商品
        let brandId = res.content[0].id;
        freshProductList(brandId);

      }, error: function (err) {
        console.log(err);
      }
    }); // end of $.ajax()

  });

  // 隱藏商品列表按鈕
  $('#closeProducts').click(function () {
    $(this).attr("hidden", "hidden");
    $('#openProducts').removeAttr("hidden");
    $('#brandsList').attr("hidden", "hidden");
    $('#productList').attr("hidden", "hidden");
    $('#brandContent').html('');
  });

  // 點了品牌後，刷新產品
  $('#brandContent').on('click', 'div[id^="selectBrand"]', function () {
    let brandId = $(this).attr('id').split('selectBrand')[1];
    freshProductList(brandId);

  });

  $('#productListTable').on('change', 'input[id^="checkProduct"]',
      function () {
        // console.log($(this).attr('id'))
        console.log($(this).attr('id').split('checkProduct')[1]);
        let productId = $(this).attr('id').split('checkProduct')[1];
        // SamWang to-do: product id 尚未收集起來送出
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
