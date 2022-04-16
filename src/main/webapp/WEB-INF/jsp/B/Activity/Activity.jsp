<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>活動</title>

    <!-- Datatable -->
    <link href="${contextRoot}/static/back/assets/css/lib/data-table/dataTables.bootstrap.min.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/assets/css/lib/data-table/buttons.bootstrap.min.css"
          rel="stylesheet"/>
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>
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
                            <button type="button"
                                    class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5">
                                <i class="ti-plus"></i>新增活動
                            </button>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">Table-Basic</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>折扣活動</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover" id="table_data">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>主題</th>
                                            <th>圖片</th>
                                            <th>類型</th>
                                            <th>起始日</th>
                                            <th>結束日</th>
                                            <th>刪除</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${activities}" var="ac">
                                            <tr>
                                                <th scope="row" class="col-lg">${ac.id}</th>
                                                <td class="col-lg">${ac.subject}</td>
                                                <c:choose>
                                                    <c:when test="${ac.imgs.size() != 0 }">
                                                        <c:forEach items="${ac.imgs}" var="img"
                                                                   begin="0" end="0">
                                                            <td>
                                                                <img src="${img.link}" alt=""
                                                                     width="500"/>
                                                            </td>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>
                                                            <img src="" alt="沒有圖片" width="500"/>
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>

                                                <td class="color-danger col-lg">${ac.discountPercentage}%</td>
                                                <td>${ac.startDate}</td>
                                                <td>${ac.endDate}</td>
                                                <td>
                                                    <button type="button"
                                                            class="btn btn-danger delete">刪除
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>新增活動</h4>
                            </div>
                            <div class="card-body">

                                <form method="POST" enctype="multipart/form-data"
                                      id="insertActivityForm">
                                    <label for="subject">活動主題:</label>
                                    <input type="text" name="subject" id="subject"/><br/>
                                    <label for="uploadFile">上傳圖片</label>
                                    <input type="file" name="files" id="uploadFile"><br/>
                                </form>
                                <!-- button 不能放在form裏面 -->
                                <button id="ajaxBtn">Submit</button>
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <%--  <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/> --%>
            </section>
        </div>
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/datatables.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.flash.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/jszip.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="${contextRoot}/static/back/universal/Activity.js"></script>
<script>
  $('#ajaxBtn').click(function (event) {
    send();
  });

  function send() {
    const dataFile = new FormData();

    const data = {
      subject: $('#subject').val()
    }
    dataFile.append("file", $('#uploadFile')[0].files[0]);
    dataFile.append("json", JSON.stringify(data));

    $.ajax({
      type: "POST",
      url: "insertActivity",
      data: dataFile,
      processData: false, //防止jquery將data變成query String
      contentType: false,
      success: function (res) {
        console.log(res.link);
      },
      error: function (e) {
      }
    });
  }
</script>

</body>


</html>
