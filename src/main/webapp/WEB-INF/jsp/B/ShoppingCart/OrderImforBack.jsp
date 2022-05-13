<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>訂單 - DESIGN & DECOR</title>
    <!-- Styles -->
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>


    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
    <script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script>

    <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/jquery-ui.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->

    <style>
        #editExpiryDate{
            font-family: 'Roboto', sans-serif;
            color: #868e96;
            width: 200px;
            text-align: center;
            margin: auto;   
        }
        #selectState{
            border-radius:5px; 
            height: 25px;
            font-family: 'Roboto', sans-serif;
            color: #868e96;
        }

        tr.detail {
            display: none;
            width: 100%;
        }
        tr.detail div {
            display: none;
        }
        .showmore:hover {
            cursor: pointer;
            /* transform:scale(0.6);
            text-decoration:underline; */
        }
        th {
            text-align: center;
            vertical-align:middle;
        }  
        .input-group-prepend {
            margin: 20px;
            height: 45px;
        }

        input.form-control{
            height: 45px;
        }
        /* div.input-group-text{
            height: 60px;
        } */
    </style>

</head>

<body>
<%--Left SideBar--%>
<jsp:include page="../IncludePage/layoutPage/leftSidebarPage.jsp"/>
<%--Header--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <!-- <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>Hello, <span>Welcome Here</span></h1>
                        </div>
                    </div>
                </div> -->
                <!-- /# column -->
                <!-- <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">Table-Jsgrid</li>
                            </ol>
                        </div>
                    </div>
                </div> -->
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <div id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-title">
                                        <h4>訂單明細</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table" id="tableTable" style="text-align: center;">
                                                <thead>
                                                <tr>
                                                    <th>訂單編號</th>
                                                    <th>訂購日期</th>
                                                    <th>訂購總額</th>
                                                    <th>訂購明細</th>
                                                    <th>配送明細</th>
                                                    <th style="width: 280px;">出貨日期</th>                
                                                    <th>
                                                        <select id="selectShippingState" style="border: none;">
                                                           <option value="">訂單狀態</option>
                                                           <option value="">所有訂單</option>
                                                           <option value="">未付款</option>
                                                           <option value="">備貨中</option>
                                                           <option value="">已出貨</option>
                                                           <option value="">已取消</option>
                                                       </select>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody id="table_tbody">
                                                   <c:forEach var="allOrder" items="${allOrder}"> 
                                                      <tr>
                                                         <td class="product-name" id="imforId">${allOrder.id}</td>
                                                         <td>
                                                             <fmt:formatDate pattern="yyyy-MM-dd" value="${allOrder.orderDate}" />
                                                         </td>
                                                         <td>$${allOrder.total}</td>
                                                         <td>
                                                             <a class="showmore" style="color: #337ab7;">Show More</a>
                                                         </td>
                                                         <td>
                                                            <button type="button" class="btn btn-warning detailBtn" style="background-color: #eca354;">明細</button>
                                                         </td>
                                                         <td class="editShipDate">  
                                                            <span id="showdate" class="showdate">
                                                               <c:choose>
                                                                <c:when test="${allOrder.shippingDate != null}">
                                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${allOrder.shippingDate}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    選擇日期
                                                                </c:otherwise>
                                                             </c:choose>
                                                            </span> 
                                                        <!-- </td> -->
                                                            <input type="date" name="editExpiryDateInput" style="display: none;"
                                                               class="form-control shipDate"  value="${allOrder.shippingDate}">
                                                         </td>
                                                         <td class="editShipState"> 
                                                            <select class="shipStateSelect" style="border:none;">
                                                               <option id="op0">${allOrder.shipState}</option>
                                                               <option id="op1" value="">未付款</option>
                                                               <option id="op2" value="">備貨中</option>
                                                               <option id="op3" value="">已出貨</option>
                                                               <option id="op4" value="">已取消</option>
                                                           </select>
                                                         </td>
                                                      </tr>
                                                    <!-- show more star-->
                                                      <tr class="detail">
                                                        <td colspan="6">
                                                            <div>
                                                                <table class="table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="product-thumbnail">商品照</th>
                                                                            <th class="cart-product-name">商品</th>
                                                                            <th class="cart-product-name">規則</th>
                                                                            <th class="product-quantity">數量</th>
                                                                            <th class="product-price" style="text-align: center;">單價</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="orderList">
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </td>
                                                      </tr>
                                                    <!-- show more end-->
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        <!------分頁 ------->
                                        <div class="container" style="text-align: center;">
                                            <ul class="pagination">
                                                <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
                                                   <c:choose>
                                                    <c:when test="${shipState !='所有訂單'}">
                                                        <li class="page-item">
                                                            <a href="/Design/B/allorder?shipState=${shipState}&p=${pageNumber}">
                                                             <c:out value="${pageNumber}"></c:out>
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item">
                                                            <a href="/Design/B/allorder?p=${pageNumber}">
                                                             <c:out value="${pageNumber}"></c:out>
                                                            </a>
                                                        </li>
                                                    </c:otherwise>
                                                   </c:choose>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <!------分頁 ------->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# card -->
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->

            <%--明細按件的彈跳視窗--%>
            <div id="ckShipDetail" hidden title="配送明細">
                <div class="card">
                    <div class="card-title">
                    </div>
                    <div class="card-body">
                        <div class="basic-elements">
                            <form>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="input-group input-group-lg">
                                            <div class="input-group-prepend">
                                              <span class="input-group-text" id="inputGroup-sizing-lg">收件人</span><input type="text" disabled="true"  id="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="col-lg-6">
                                        <div class="input-group input-group-lg">
                                            <div class="input-group-prepend">
                                              <span class="input-group-text" id="inputGroup-sizing-lg">聯絡電話</span><input type="text" disabled="true"  id="phone" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="input-group input-group-lg">
                                            <div class="input-group-prepend">
                                              <span class="input-group-text" id="inputGroup-sizing-lg">收件地址</span><input type="text" disabled="true" id="add" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                                            </div>
                                        </div>
                                        <div class="input-group input-group-lg">
                                            <div class="input-group-prepend">
                                              <span class="input-group-text" id="inputGroup-sizing-lg">備註</span><input type="text" disabled="true" id="notes" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                                            </div>
                                        </div>
                                    </div>    
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Footer -->
            <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>
        </div>
    </div>
</div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>

<!-- script init-->
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.colVis.min.js"></script>

<script src="${contextRoot}/static/back/universal/taiwan_districts.js"></script>
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>

<script>

    // Show Order Record 
    $(function () {
        $("a.showmore").click(function (e) {
            e.preventDefault();
            // We break and store the result so we can use it to hide
            // the row after the slideToggle is closed
            var targetrow = $(this).closest('tr').next('.detail');
            targetrow.show().find("div").slideToggle("fast", function () {

                if (!$(this).is(":visible")) {
                        targetrow.hide();
                }
            });
        });
    });

    $(".showmore").on("click", function (e) {
                            
        let orderList = $(this).closest("tr").next("tr").find("tbody");
        $(orderList).html('');

        let id = $(this).parent("td").prevAll().filter("#imforId").text();
        let imforId = Number(id);
        console.log(imforId);
        // console.log(typeof imforId);
        // console.log(id);
         $.ajax({
            url: "orderProduct?fkOrderImformation=" + imforId,
            type: "GET",
            // data:{
            //     fkOrderImformation:imforId
            // },
            success: function (result) {

               product_data="";

              $.each(result, function (index, product) {
                console.log(product.fkProduct.name);
                product_data +="<tr>"
                product_data +="<td class='product-thumbnail' ><img style='width:125px;' src='"+product.fkProduct.image01+"'></td>"
                product_data +="<td class='product-name' style='vertical-align:middle; text-align:center;'>"+product.fkProduct.name+"</td>"
                product_data +="<td class='product-name' style='vertical-align:middle; text-align:center;'>"+product.fkProduct.model+"</td>"
                product_data +="<td class='product-price product__price-2' style='vertical-align:middle; text-align:center;'>"+product.orderMount+"</td>"
                product_data +="<td class='product-price product__price-2' style='vertical-align:middle; text-align:center;'>$"+product.price+"</td>"
                product_data += "</tr>"
                });
              $(orderList).append(product_data);
            },
            error: function (err) {
                console.log(err);
                    }
                })
            })

    //配送明細
    $("#table_tbody").on("change click", ".btn.btn-warning.detailBtn" ,function () {
      
      $("#ckShipDetail").removeAttr('hidden').dialog('open');

        // this為觸發的button, 若button由c:foreach產生,不能用id抓
        let id=$(this).closest('tr').children('td:eq(0)').text();
        let imforId = Number(id);
        console.log(id);

        $.ajax({
            url: "iddetail?imforId=" + imforId,
            // url:"iddetail",
            type: "GET",
            // data:{
            //     imforId:imforId
            // },
            success: function (result) {
                // console.log(result); // 字串
                let res = JSON.parse(result); // 字串轉成javascript物件
                // console.log(res);
                $("input[id='name']").val(res.name);
                $("input[id='phone']").val(res.phone);
                $("input[id='add']").val(res.add);
                $("input[id='notes']").val(res.notes);
            },
            error: function (err) {
                console.log(err);
            }
        })
    })


    $("#ckShipDetail").dialog({
        autoOpen: false,
        width: 800,
        modal: true,
    }); 

    //點選日期
    $(".editShipDate").on("click",function(){
        $(this).children("span").hide();
        
        // $(this).children("input").removeAttr("hidden");
        $(this).children("input").css("display","block");
    })
    
    $(".editShipState").on("click",function(){
        // $(this).children("span").show();
        $(this).closest('tr').children('td:eq(5)').children("span").show();
        $(this).closest('tr').children('td:eq(5)').children("input").css("display","none");
        // $(this).children("input").css("display","none");
    })

    // $(".editShipDate").on("mouseleave",function(){
    //     $(this).children("span").show();
    //     $(this).children("input").css("display","none");
    // })

    //修改出貨日期
    $(".form-control.shipDate").on("change",function(){
        console.log($(".form-control.shipDate"));
        console.log($(this));   
        let id=$(this).closest('tr').children('td:eq(0)').text();
        console.log(id);
        let shipDate = $(this).val();
        console.log(shipDate); 
        console.log(typeof shipDate);  

        $.ajax({
            url:"editordershipdate",
            type:"POST",
            data:{
                shipDate:shipDate,
                id:id
            },
            success:function(result){
                console.log(result);
                let date = Date.parse(result);
                console.log(date);
                swal.fire({
                    icon: "success",
                    html: "<h5>修改成功</h5>",
                })
                .then(function () {
                    location.reload();
                //     // window.location.href='/Design/F/orderrecord';
                //     // console.log(result)
                });
            },
            error: function (err) {
                console.log(err);
            }
        })
    });  

    //修改出貨狀態
    $(".shipStateSelect").on("change",function(){
        // console.log($(".shipStateSelect"));
        let id=$(this).closest('tr').children('td:eq(0)').text();
        console.log($(id));
        let shipState = $(this).children('option:selected').text()
        console.log(shipState);
        
        $.ajax({
            url:"editordershipstate",
            type:"POST",
            data:{
                shipState:shipState,
                id:id
            },
            beforeSend: function () {
                swal.fire({
                    didOpen: () => {
                      Swal.showLoading();
                    },
                    timer: 3000
                });
            },
            success:function(result){
                swal.fire({
                    icon: "success",
                    html: "<h5>修改成功</h5>",
                })
            },
            error: function (err) {
                console.log(err);
            }
        })
    })

    //依出貨狀態搜尋
    $("#selectShippingState").on("change",function(){
        console.log($("#selectShippingState"));
        let shipState = $("#selectShippingState>option:selected").text();
        console.log(shipState);
        let url = 'allorder?shipState='+shipState;
        if(shipState !="所有訂單"){
            window.location.href=url;
        }else{
          window.location.href='/Design/B/allorder';
        }
    })
</script>

</body>

</html>
