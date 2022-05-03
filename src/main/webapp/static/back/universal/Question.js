$(function () {
    $('#table_id').DataTable();

    //動態綁定 刪除
    $('#row-select').on('click', '.btn.btn-danger.deleteBtn', function () {
        let deleteBtn = $(this);
        let id = deleteBtn.parent('td').siblings('td:eq(0)').text();
        swal.fire({
            title: "確定要刪除？",
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
                    url: "CommonQuestion/deleteQuestion?id=" + id,
                    method: "GET",
                    beforeSend: function () {
                        swal.fire({
                            html: '<h5>刪除中...</h5>',
                            showConfirmButton: false,
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
        });
    });

    //新增案件 按鈕
    $('#insertBtn').click(function () {
        $('#insertQuestionDialog').removeAttr('hidden').dialog('open');
    });

    //編輯 按鈕
    $('body').on('click', 'button[name="edit"]', function () {
        let editBtn = $(this);
        let id = editBtn.parent('td').siblings('td:eq(0)').text();
        let oldTypeStr = editBtn.parent('td').siblings('td:eq(1)').text();
        let oldQuestion = editBtn.parent('td').siblings('td:eq(2)').text();
        let oldAns = editBtn.parent('td').siblings('td:eq(3)').text();

        
        $('#editId').val(id);
        $('#question').val(oldQuestion);
        $('#answer').val(oldAns);
        
        if (oldTypeStr.toString().indexOf('產品及服務') >= 0) {
            $('#question_type_edit > option:eq(1)').prop('selected',true);
        }
        if(oldTypeStr.toString().indexOf('產品品質及維護') >= 0){
            $('#question_type_edit > option:eq(2)').prop('selected',true);
        }
        if(oldTypeStr.toString().indexOf('產品貨況') >= 0){
            $('#question_type_edit > option:eq(3)').prop('selected',true);
        }
        if(oldTypeStr.toString().indexOf('結帳') >= 0){
            $('#question_type_edit > option:eq(4)').prop('selected',true);
        }
        if(oldTypeStr.toString().indexOf('取消訂單') >= 0){
            $('#question_type_edit > option:eq(5)').prop('selected',true);
        }

    });

    //送出按鈕（在編輯內層）
    $('#editCommitBtn').click(function () {
        let editBtn = $(this);
        let id = $('#editId').val();
        let data = {
            "question_type": parseInt($('#question_type_edit > option:selected').val()),
            "question": $('#question').val(),
            "answer": $('#answer').val(),
            "id": id
        };
        console.log(data);

        $.ajax({
            url: "/Design/B/CommonQuestion/updateQuestionContent", //這個url是用來呼叫controller裡面的方法
            type: "post",
            data: data,
            success: function (res) {
                console.log(res);
                swal.fire({
                    icon: 'success',
                    html: '<h5>成功!</h5>'
                }).then(function () {
                    location.reload();
                });

            },
            error: function (res) {
                console.log(res);
                // window.alert('失敗');
                swal.fire({
                    icon: 'error',
                    html: '<h5>失敗!</h5>'
                }).then(function () {
                    location.reload();
                });

            }
        });

    });

    //新增
    $('#addBtn').click(function () {
        console.log($('#question_type > option:selected').text());

        let data = {
            "question_type": $('#question_type > option:selected').val(),
            "question": $('#addQuestion').val(),
            "answer": $('#addAnswer').val()
        };
        console.log(data);

        $.ajax({
            url: "/Design/B/CommonQuestion/insertCommonQuestion", //這個url是用來呼叫controller裡面的方法
            type: "post",
            data: data,
            success: function (res) {
                console.log(res);
                swal.fire({
                    icon: 'success',
                    html: '<h5>成功!</h5>'
                }).then(function () {
                    location.reload();
                });

            },
            error: function (res) {
                console.log(res);
                // window.alert('失敗');
                swal.fire({
                    icon: 'error',
                    html: '<h5>失敗!</h5>'
                }).then(function () {
                    location.reload();
                });

            }
        });

    });

    //一鍵輸入
    $('#smartInput').click(function () {
        $('#question_type').val("2");
        $('#addQuestion').val("為什麼我的櫃子背板會彎曲/發霉？");
        $('#addAnswer').val("台灣氣候潮濕，持續的高濕狀態不但影響身體健康也容易造成木質家具背板變型及發霉。建議室內使用除濕機來維持適當濕度，對健康有益且可降低木質家具變型及發霉的可能性。");
    });

    // dataTable
    $('#bootstrap-data-table').DataTable({
        lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
    });

    $('#row-select').DataTable({
        // 中文化
        // language: {
        //     "processing": "處理中...",
        //     "loadingRecords": "載入中...",
        //     "lengthMenu": "顯示 _MENU_ 項結果",
        //     "zeroRecords": "沒有符合的結果",
        //     "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
        //     "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
        //     "infoFiltered": "(從 _MAX_ 項結果中過濾)",
        //     "search": "search:",
        //     "paginate": {
        //         "first": "第一頁",
        //         "previous": "上一頁",
        //         "next": "下一頁",
        //         "last": "最後一頁"
        //     },
        //     "aria": {
        //         "sortAscending": ": 升冪排列",
        //         "sortDescending": ": 降冪排列"
        //     },
        //     "emptyTable": "目前沒有資料",
        //     "datetime": {
        //         "previous": "上一頁",
        //         "next": "下一頁",
        //         "hours": "時",
        //         "minutes": "分",
        //         "seconds": "秒",
        //         "amPm": [
        //             "上午",
        //             "下午"
        //         ],
        //         "unknown": "未知",
        //         "weekdays": [
        //             "週日",
        //             "週一",
        //             "週二",
        //             "週三",
        //             "週四",
        //             "週五",
        //             "週六"
        //         ],
        //         "months": [
        //             "一月",
        //             "二月",
        //             "三月",
        //             "四月",
        //             "五月",
        //             "六月",
        //             "七月",
        //             "八月",
        //             "九月",
        //             "十月",
        //             "十一月",
        //             "十二月"
        //         ]
        //     },
        //     "searchBuilder": {
        //         "add": "新增條件",
        //         "condition": "條件",
        //         "deleteTitle": "刪除過濾條件",
        //         "button": {
        //             "_": "複合查詢 (%d)",
        //             "0": "複合查詢"
        //         },
        //         "clearAll": "清空",
        //         "conditions": {
        //             "array": {
        //                 "contains": "含有",
        //                 "empty": "為空",
        //                 "equals": "等於",
        //                 "not": "不為",
        //                 "notEmpty": "不為空",
        //                 "without": "排除"
        //             },
        //             "date": {
        //                 "after": "大於",
        //                 "before": "小於",
        //                 "between": "在其中",
        //                 "empty": "為空",
        //                 "equals": "等於",
        //                 "not": "不為",
        //                 "notBetween": "不在其中",
        //                 "notEmpty": "不為空"
        //             },
        //             "number": {
        //                 "between": "在其中",
        //                 "empty": "為空",
        //                 "equals": "等於",
        //                 "gt": "大於",
        //                 "gte": "大於等於",
        //                 "lt": "小於",
        //                 "lte": "小於等於",
        //                 "not": "不為",
        //                 "notBetween": "不在其中",
        //                 "notEmpty": "不為空"
        //             },
        //             "string": {
        //                 "contains": "含有",
        //                 "empty": "為空",
        //                 "endsWith": "字尾為",
        //                 "equals": "等於",
        //                 "not": "不為",
        //                 "notEmpty": "不為空",
        //                 "startsWith": "字首為",
        //                 "notContains": "不包含",
        //                 "notStarts": "不為開頭",
        //                 "notEnds": "不為結束"
        //             }
        //         },
        //         "data": "欄位",
        //         "leftTitle": "群組條件",
        //         "logicAnd": "且",
        //         "logicOr": "或",
        //         "rightTitle": "取消群組",
        //         "title": {
        //             "_": "複合查詢 (%d)",
        //             "0": "複合查詢"
        //         },
        //         "value": "內容"
        //     },
        //     "editor": {
        //         "close": "關閉",
        //         "create": {
        //             "button": "新增",
        //             "title": "建立新項目",
        //             "submit": "建立"
        //         },
        //         "edit": {
        //             "button": "編輯",
        //             "title": "編輯項目",
        //             "submit": "更新"
        //         },
        //         "remove": {
        //             "button": "刪除",
        //             "title": "刪除",
        //             "submit": "刪除",
        //             "confirm": {
        //                 "_": "您確定要刪除 %d 筆資料嗎？",
        //                 "1": "您確定要刪除 %d 筆資料嗎？"
        //             }
        //         },
        //         "multi": {
        //             "restore": "回復修改",
        //             "title": "每行有不同的價值",
        //             "info": "您選擇了多個項目，每項目都有不同的價值。如果您想所有選擇的項目都用同一個價值，可以在這裏輸入一個價值。要不然它們會保留原本各自的價值",
        //             "noMulti": "此列不容許同時編輯多個項目"
        //         },
        //         "error": {
        //             "system": "系統發生錯誤(更多資訊)"
        //         }
        //     },
        //     "autoFill": {
        //         "cancel": "取消"
        //     },
        //     "buttons": {
        //         "copySuccess": {
        //             "_": "複製了 %d 筆資料",
        //             "1": "複製了 1 筆資料"
        //         },
        //         "copyTitle": "已經複製到剪貼簿",
        //         "excel": "Excel",
        //         "pdf": "PDF",
        //         "print": "列印",
        //         "copy": "複製"
        //     },
        //     "searchPanes": {
        //         "collapse": {
        //             "_": "搜尋面版 (%d)",
        //             "0": "搜尋面版"
        //         },
        //         "emptyPanes": "沒搜尋面版",
        //         "loadMessage": "載入搜尋面版中...",
        //         "clearMessage": "清空"
        //     },
        //     "select": {
        //         "rows": {
        //             "_": "%d 列已選擇",
        //             "1": "%d 列已選擇"
        //         }
        //     },
        //     "stateRestore": {
        //         "emptyError": "名稱不能空白。"
        //     }
        // } ,
        initComplete: function () {
            this.api().columns().every(function () {
                var column = this;
                var select = $('<select class="form-control"><option value=""></option></select>')
                    .appendTo($(column.footer()).empty())
                    .on('change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );

                        column
                            .search(val ? '^' + val + '$' : '', true, false)
                            .draw();
                    });

                column.data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });
        }
    });

});
