<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DESIGN & DECOR</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--  CSS include page--%>
    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp"/>
    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
</head>
<body>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>
    <!-- page title area start -->
    <section class="page__title p-relative d-flex align-items-center"
             data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="page__title-inner text-center">
                        <h1>新增裝潢需求</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="${contextRoot}/F/Activity/index">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"><a
                                            href="${contextRoot}/F/Case"> Case</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- page title area end -->

    <!-- Cart Area Strat-->
    <section class="cart-area pt-100 pb-100">
        <div class="container">
            <span hidden id="spanEditId">${Case.id}</span>
            <div class="row">
                <div class="col-lg">
                    <form action="#">
                        <div class="table-content table-responsive">
                            <div class="card-body">
                                <div class="basic-elements">
                                    <form>
                                        <div class="row">
                                            <span hidden id="spanId">${Case.id}</span>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>標題：</label>
                                                    <input id="caseTitle" type="text" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>名字：</label>
                                                    <input id="caseName" type="text" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>E-mail：</label>
                                                    <input id="caseEmail" type="text" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>工程種類：</label>
                                                    <select class="form-control" id="classificationData">
                                                        <%--                                                        <option>1</option>--%>
                                                        <%--                                                        <option>2</option>--%>
                                                        <%--                                                        <option>3</option>--%>
                                                        <%--                                                        <option>4</option>--%>
                                                        <%--                                                        <option>5</option>--%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>地點：</label>
                                                    <select class="form-control" id="locationData">
                                                        <%--                                                        <option>1</option>--%>
                                                        <%--                                                        <option>2</option>--%>
                                                        <%--                                                        <option>3</option>--%>
                                                        <%--                                                        <option>4</option>--%>
                                                        <%--                                                        <option>5</option>--%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>結案時間：</label>
                                                    <input id="expiryDate" type="date" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>資訊：</label>
                                                    <textarea id="caseMessage" class="form-control" rows="20"
                                                              placeholder=""></textarea>
                                                </div>

                                                <div class="form-group" id="imgDiv">
                                                    <label>照片：</label><br/>
                                                    <input type="file" id="insertFile" class="imgur"
                                                           accept="image/*"
                                                           data-max-size="5000"/>
                                                    <img src="" id="insertCoverPhoto" width="200"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="coupon2">
                                    <button id="addCaseBtn" class="os-btn os-btn-black" style="margin-top: 25px"
                                            name="add_case" type="submit">確定
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Cart Area End-->
</main>

<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/static/front/universal/Case.js"></script>
<script>
    $('#addCaseBtn').mouseover(function () {
        $('#caseTitle').val("牆面開孔"),
            $('#caseName').val("偉德"),
            $('#classificationData> option:selected').text("拆除工程"),
            $('#locationData> option:selected').text("新竹市"),
            $('#caseEmail').val("lulu@hotmail.com"),
            $('#expiryDate').val("2022-08-20"),
            $('#caseMessage').val(`開孔高70公分×寬60公分，牆厚度25公分 如圖片所框處<br/>`),
            $('#insertCoverPhoto').attr('src', "https://i.imgur.com/LIBbI5r.jpg")

    })
</script>
</body>

</html>

