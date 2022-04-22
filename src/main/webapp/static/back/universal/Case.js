classificationData = [
    {"name": "拆除工程"},
    {"name": "泥作工程"},
    {"name": "防水止漏工程"},
    {"name": "鋁門窗工程"},
    {"name": "水電工程"},
    {"name": "電訊工程"},
    {"name": "石材工程"},
    {"name": "木作工程"},
    {"name": "空調系統"},
    {"name": "衛浴設備"},
    {"name": "廚房設備"},
    {"name": "窗簾壁紙"},
    {"name": "油漆工程"},
    {"name": "五金工程"},
    {"name": "鐵件工程"},
    {"name": "其他設備"},
    {"name": "玻璃明鏡"},
    {"name": "地板工程"},
    {"name": "清潔工程"},
    {"name": "雜項工程"}
]


$(function(){
    doClassificationData();
    doLocationData();
    function doClassificationData(){
        $.each(classificationData,function(index,value){
            console.log(value.name);
            //添加下拉選單
            let option = document.createElement('option');
            option.innerHTML= `${value.name}`;
            option.value= `${index}`;
            $('#classificationData').append(option);
        })
    }

    function doLocationData() {
        $.each(locationData, function (index, value) {
            console.log(value.name);
            // 添加下拉選單
            let option = document.createElement('option');
            option.innerHTML = `${value.name}`;
            option.value = `${index}`;
            $('#locationData').append(option);
            // 下拉選單結束----

        });
    }
});