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

    <title>設計服務 - DESIGN & DECOR</title>


    <!-- Styles -->
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>


    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
    <script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script>


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
                            <button type="button" id="insertBtn"
                                    class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5">
                                <i class="ti-plus"></i>新增設計
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
                                        <h4>設計</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table" id="tableTable">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>標題</th>
                                                    <th>名字</th>
                                                    <th><select style="border: none" id="styleData"
                                                                class="btn-group"></select></th>
                                                    <th><select style="border: none" id="locationData"
                                                                class="btn-group"></select></th>
                                                    <th>資訊</th>
                                                    <th>設計費</th>
                                                    <th>封面照片</th>
                                                    <th>內文照片_1</th>
                                                    <th>內文照片_2</th>
                                                    <th>
                                                        <a href="${contextRoot}/B/Case/CaseMessagedatetimeDesc">創建時間</a>
                                                    </th>
                                                    <th>編輯</th>
                                                    <th>刪除</th>
                                                </tr>
                                                </thead>
                                                <tbody id="table_tbody">


                                                </tbody>
                                            </table>
                                            <ul class="pagination" id="pageBtn">
                                                <%--                                                <li class="page-item">--%>
                                                <%--                                                    <a class="page-link" id="previousPage">Previous</a>--%>
                                                <%--                                                </li>--%>
                                                <%--                                                <li class="page-item" id="pages"><a class="page-link"></a></li>--%>
                                                <%--                                                <li class="page-item">--%>
                                                <%--                                                    <a class="page-link" id="nextPage">Next</a>--%>
                                                <%--                                                </li>--%>
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
            <div id="insertDesignDialog" hidden title="新增案件">
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
                                        <div class="form-group" name="style">
                                            <label>風格：</label>
                                            <select class="form-control" id="style">
                                            </select>
                                        </div>
                                        <div class="form-group" name="location">
                                            <label>地區：</label>
                                            <select class="form-control" id="location">
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>設計費：</label>
                                            <input id="price" class="form-control"
                                                   type="number" name="price">
                                        </div>

                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>資訊：</label>
                                            <textarea name="message" id="message" class="form-control"
                                                      style="height:100px"
                                                      placeholder="Text input"></textarea>
                                        </div>
                                        <div class="form-group" id="imgDiv">
                                            <input type="file" id="insertFile" class="imgur" accept="image/*"
                                                   data-max-size="5000"/>
                                            <img src="" id="insertCoverPhoto" width="200"/>
                                        </div>
                                        <div class="form-group" id="imgDiv1">
                                            <input type="file" id="insertFile1" class="imgur1" accept="image/*"
                                                   data-max-size="5000"/>
                                            <img src="" id="insertPhoto_1" width="200"/>
                                        </div>
                                        <div class="form-group" id="imgDiv2">
                                            <input type="file" id="insertFile2" class="imgur2" accept="image/*"
                                                   data-max-size="5000"/>
                                            <img src="" id="insertPhoto_2" width="200"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%--編輯按件的彈跳視窗--%>
            <div id="editDesignDialog" hidden title="修改案件">
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
                                            <label for="title"></label><input name="editTitle" id="editTitle"
                                                                              type="text"
                                                                              class="form-control"
                                                                              value="">
                                        </div>
                                        <div class="form-group">
                                            <label>名字：</label>
                                            <input name="editName" id="editName" type="text" class="form-control"
                                                   value="">
                                        </div>
                                        <div class="form-group" name="editStyle">
                                            <label>風格：</label>
                                            <select class="form-control" id="editStyle">
                                            </select>
                                        </div>
                                        <div class="form-group" name="editLocation">
                                            <label>地區：</label>
                                            <select class="form-control" id="editLocation">
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>設計費：</label>
                                            <input id="editPrice" class="form-control"
                                                   type="number" name="editPrice">
                                        </div>

                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>資訊：</label>
                                            <textarea name="editMessage" id="editMessage" class="form-control" rows="3"
                                                      style="height:100px"
                                                      placeholder="Text input"></textarea>
                                        </div>
                                        <div class="form-group" id="editimgDiv">
                                            <input type="file" id="editFile" class="imgur" accept="image/*"
                                                   data-max-size="5000"/>
                                            <img src="" id="editCoverPhoto" width="200"/>
                                        </div>
                                        <div class="form-group" id="editimgDiv1">
                                            <input type="file" id="editFile1" class="imgur" accept="image/*"
                                                   data-max-size="5000"/>
                                            <img src="" id="editPhoto_1" width="200"/>
                                        </div>
                                        <div class="form-group" id="editimgDiv2">
                                            <input type="file" id="editFile2" class="imgur" accept="image/*"
                                                   data-max-size="5000"/>
                                            <img src="" id="editPhoto_2" width="200"/>
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
<script src="${contextRoot}/static/back/universal/DesignService.js"></script>

<%--<script>--%>
<%--    console.log(Taiwan_districts);--%>
<%--</script>--%>

</body>

</html>