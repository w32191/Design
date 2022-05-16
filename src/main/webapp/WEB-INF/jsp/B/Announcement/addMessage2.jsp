<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增公告 - DESIGN & DECOR</title>

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
                            <h1></h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">FORM VALIDATION</li>
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
                            <div class="card-header">新增公告</div>
                            <div class="card-body">
                                <form:form class="form" method="POST"
                                        action="/Design/B/Announcement/add"
                                        modelAttribute="announcementWorkMessages">

                                <!-- form:errors  bindingResult 回傳的物件 -->

                                <div class="input-group mb-3 col-sm-5">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="contact"><span
                                                style="color: red">*</span>公告類型</label>
                                    </div>
                                    <select class="form-control"
                                            aria-describedby="announcement_type"
                                            name="type" id="announcement_type" required>
                                        <option value="" style="display: none"></option>
                                        <option value="系統維護">系統維護</option>
                                        <option value="活動通知">活動通知</option>
                                        <option value="重要公告">重要公告</option>
                                            <%-- 												<c:forEach items="${page.type}" --%>
                                            <%-- 													var="announcementWorkMessages"> --%>
                                            <%-- 													<c:choose> --%>
                                            <%-- 														<c:when --%>
                                            <%-- 															test="${announcementWorkMessages.Type == announcementWorkMessages.Type}"> --%>
                                            <%-- 															<option value="${announcementWorkMessages.id}" selected="selected"> --%>
                                            <%-- 																${announcementWorkMessages.type}</option> --%>
                                            <%-- 														</c:when> --%>
                                            <%-- 														<c:otherwise> --%>
                                            <%-- 															<option value="${announcementWorkMessages.id}"> --%>
                                            <%-- 																${announcementWorkMessages.type}</option> --%>
                                            <%-- 														</c:otherwise> --%>
                                            <%-- 													</c:choose> --%>
                                            <%-- 												</c:forEach> --%>
                                    </select>
                                </div>
                                <div class="input-group mb-3 col-sm-5">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="titleId"
                                               id="titleSapn"><span
                                                style="color: red">*</span>公告標題</label>
                                    </div>
                                    <div class="input-group">
                                        <form:textarea path="title" class="form-control"
                                                       id="titleId" />
                                    </div>
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="contentId"
                                               id="contentSpan"><span
                                                style="color: red">*</span>公告內容</label>
                                    </div>
                                    <div class="input-group">
                                        <form:textarea path="content" class="form-control"
                                               rows="5" cssStyle="height: 100%" id="contentId" />
                                    </div>
                                    <input type="submit" name="submit" value="輸入" class="btn btn-primary">
                                    </form:form>
                                </div>
                            </div>
                        </div>

            </section>
        </div>
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>

<!-- Select2 -->
<script
        src="${contextRoot}/static/back/assets/js/lib/select2/select2.full.min.js"></script>
<script
        src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate.min.js"></script>
<script
        src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate-init.js"></script>
<!-- scripit init-->
<script>
  $('#titleSapn').on('click', function () {
    $('#titleId').val("【5/18凌晨暫停服務～系統進行維護升級】");
  });
  $('#contentSpan').on('click', function () {
    $('#contentId').val(
        "【5/18凌晨暫停服務～系統進行維護升級】 為了提供更好的服務，將於2022/5/18(三)凌晨01:00 ~ 05:00時段內進行系統維護升級，此時段內將無法使用支付轉帳，若造成您的困擾敬請見諒！")
  })
</script>
</body>

</html>
