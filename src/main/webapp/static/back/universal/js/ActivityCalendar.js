$(function () {
  setCalender();
  $('#insertBtn').on('click',insertSend);

  $('#insertdiscountPercentage').on('change',function (){
    let value = $('#insertdiscountPercentage').val();
    $('#disSpan').text(`${value}%`);
  });

  $('#oneKeyInputBtn').click(oneKeyInput);
});

function setCalender() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    themeSystem: 'bootstrap',
    locale: 'zh-tw',
    navLinks: true,
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    events: '/Design/B/Activity/findAllEventApi',

    eventColor: '#8dd75f',

    eventClick: function (info) {
      // 導到編輯的畫面
      location.href = `/Design/B/Activity/editActivity/${info.event._def.publicId}`;
    },
    dateClick: function (info) {
      // alert('Clicked on: ' + info.dateStr);
      $('#insertStartDate').val(info.dateStr);
      $('#add-category').modal('show');
      // alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
      // alert('Current view: ' + info.view.type);
    }
  });
  calendar.render();
  document.getElementById('insertStartDate').valueAsDate = new Date();

}

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
        imageUrl: '/Design/static/back/universal/images/load-img.gif',
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

function oneKeyInput(){
  $('#insertSubject').val('Tom Dixon. 週年慶');
  $('#insertContent').val('全品牌限時特價！！\n只要三折！！！\n通通三折，要買要快！！');
  $('#insertdiscountPercentage').val(30);
  $('#insertEndDate').val('2022-05-30');
}

