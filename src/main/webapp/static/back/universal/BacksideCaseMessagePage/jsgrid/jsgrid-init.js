        $(function() {

            $("#jsGrid").jsGrid({
                height: "100%",
                width: "100%",
                filtering: false,
                editing: true,
                inserting: true,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 15,
                pageButtonCount: 5,
                deleteConfirm: "確定要刪除?",
                controller: db,
                fields: [
                    { name: "id", type: "text", width: 40},
                    { name: "標題", type: "text", width: 150 },
                    { name: "類別", type: "select", width: 60, items: db.countries, valueField: "Id", textField: "Name"},
                    { name: "地區", type: "select", width: 80, items: db.countries, valueField: "Id", textField: "Name"},
                    { name: "E-mail", type: "text", width: 50 },
                    { name: "訊息", type: "text", width: 200 },
                    { name: "創建時間", type: "text", width: 100 },
                    { name: "結束時間", type: "text", width: 100 },
                    // { name: "Country", type: "select", },
                    // { name: "Married", type: "checkbox", title: "Is Married", sorting: false },
                    { type: "control" }
                ]
            });

        });