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

    <title>訂單</title>
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
        }  
        
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
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>Hello, <span>Welcome Here</span></h1>
                            <!-- <button type="button" id="insertBtn"
                                    class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5">
                                <i class="ti-plus"></i>新增案件
                            </button> -->
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">Table-Jsgrid</li>
                            </ol>
                        </div>
                    </div>
                </div>
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
                                                    <!-- <th><select style="border: none" id="classificationData"
                                                                class="btn-group"></select></th>
                                                    <th><select style="border: none" id="locationData"
                                                                class="btn-group"></select></th> -->
                                                    <th style="width: 280px;">出貨日期</th>                
                                                    <th>
                                                        <select style="border: none;">
                                                           <option value="">訂單狀態</option>
                                                           <option value="">未付款</option>
                                                           <option value="">備貨中</option>
                                                           <option value="">已出貨</option>
                                                           <option value="">已取消</option>
                                                       </select>
                                                    </th>
                                                    <!-- <th>編輯</th>
                                                    <th>刪除</th> -->
                                                </tr>
                                                </thead>
                                                <tbody id="table_tbody">
                                                   <c:forEach var="allOrder" items="${allOrder}"> 
                                                      <tr>
                                                         <!-- <td></td> -->
                                                         <td class="product-name" id="imforId">${allOrder.id}</td>
                                                         <td>
                                                             <fmt:formatDate pattern="yyyy-MM-dd" value="${allOrder.orderDate}" />
                                                         </td>
                                                         <td>$${allOrder.total}</td>
                                                         <td>
                                                             <a class="showmore" style="color: #337ab7;">Show More</a>
                                                         </td>
                                                         <td>
                                                            <button type="button" class="btn btn-warning">明細</button>
                                                         </td>
                                                         <td>
                                                            <input type="date" name="editExpiryDate" id="editExpiryDate" 
                                                               class="form-control" >
                                                         </td>
                                                         <td>
                                                            <select id="selectState">
                                                               <option id="op1" value="" selected>未付款</option>
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
                                                                            <th class="product-quantity">數量</th>
                                                                            <th class="product-price">單價</th>
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

                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a class="page-link">Previous</a>
                                                </li>
                                                <li class="page-item"><a class="page-link">1</a></li>
                                                <li class="page-item active">
                                                        <span class="page-link">${findAllPage.number+1}
                                                             <span class="sr-only">(current)</span>
                                                        </span>
                                                </li>
                                                <li class="page-item"><a class="page-link"
                                                                         href="/Design/B/Cases?offset=${findAllPage.number+2}">3</a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="page-link">Next</a>
                                                </li>
                                            </ul>
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

            <%--新增案件的彈跳視窗--%>
            <div id="insertCaseDialog" hidden title="新增案件">
                <div class="card">
                    <div class="card-title">
                    </div>
                    <div class="card-body">
                        <div class="basic-elements">
                            <form>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>標題：</label>
                                            <label for="title"></label><input name="title" id="title" type="text"
                                                                              class="form-control"
                                                                              value="">
                                        </div>
                                        <div class="form-group">
                                            <label>名字：</label>
                                            <input name="name" id="name" type="text" class="form-control"
                                                   value="">
                                        </div>
                                        <div class="form-group" name="classification">
                                            <label>類別：</label>
                                            <select class="form-control" id="classification">
                                            </select>
                                        </div>
                                        <div class="form-group" name="location">
                                            <label>地區：</label>
                                            <select class="form-control" id="location">
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Email：</label>
                                            <input id="caseEmail" class="form-control"
                                                   type="email" placeholder="Email"
                                                   name="caseEmail">
                                        </div>

                                        <div class="form-group">
                                            <label>結案時間：</label>
                                            <input type="date" name="startDate"
                                                   id="expiryDate" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>資訊：</label>
                                            <textarea name="message" id="message" class="form-control" rows="3"
                                                      placeholder="Text input"></textarea>
                                        </div>
                                        <div class="form-group" id="imgDiv">
                                            <input type="file" class="imgur" accept="image/*" data-max-size="5000"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%--編輯按件的彈跳視窗--%>
            <div id="editCaseDialog" hidden title="修改案件">
                <div class="card">
                    <div class="card-title">
                    </div>
                    <div class="card-body">
                        <div class="basic-elements">
                            <form>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>：</label>
                                            <input name="editTitle" id="editTitle" type="text" class="form-control" value="">
                                        </div>
                                        <div class="form-group">
                                            <label>名字：</label>
                                            <input name="editName" id="editName" type="text" class="form-control" value="">
                                        </div>
                                        <div class="form-group">
                                            <label>標題：</label>
                                            <input name="editTitle" id="editTitle" type="text" class="form-control" value="">
                                        </div>
                                        <div class="form-group">
                                            <label>名字：</label>
                                            <input name="editName" id="editName" type="text" class="form-control" value="">
                                        </div>
                                        
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>資訊：</label>
                                            <textarea name="editMessage" id="editMessage" class="form-control" rows="3"
                                                      placeholder="Text input"></textarea>
                                        </div>
                                    </div>
                                    <input type="text" hidden id="updateCaseId">
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

<!-- JavaScript -->
 <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
   <script src="http://code.jquery.com/jquery.js"></script>
   <script src="js/jquery-ui.min.js"></script>
 <!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
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
                    product_data +="<td class='product-name'>"+product.fkProduct.name+"</td>"
                    product_data +="<td class='product-price product__price-2'>"+product.orderMount+"</td>"
                    product_data +="<td class='product-price product__price-2'>$"+product.price+"</td>"
                    product_data += "</tr>"
                    });
                  $(orderList).append(product_data);
                },
                error: function (err) {
                    console.log(err);
                        }
                    })
                })


    </script>

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
<%--<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables-init.js"></script>--%>


<script src="${contextRoot}/static/back/universal/taiwan_districts.js"></script>
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<!-- <script src="${contextRoot}/static/back/universal/Case.js"></script> -->

<%--<script>--%>
<%--    console.log(Taiwan_districts);--%>
<%--</script>--%>

</body>

</html>