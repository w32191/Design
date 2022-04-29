<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Widget</title>

    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>
</head>

<body class="bg-primary">

<div class="unix-login">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="index.html"><span>註冊Design後台管理系統</span></a>
                    </div>
                    <div class="login-form">
                        <h4>填寫詳細資料</h4>
                        <form:form class="form" name="member" ModelAttribute="memberregister" action="/Design/B/memberregister">
                        	<form:errors path="*"/>
                             <div class="form-group">
                                <label>姓名</label>
                                <input type="text" name="names" class="form-control" placeholder="請填入姓名">
                            </div>
                             <div class="form-group">
                                <label>電話</label>
                                <input type="text" name="phone" class="form-control" placeholder="請填入電話">
                            </div>
                             <div class="form-group">
                                <label>服務地區</label>
                                <input type="text" name="serviceArea" class="form-control" placeholder="請選擇服務地區">
                            </div>
                             <div class="form-group">
                                <label>公司地址</label>
                                <input type="text" name="address" class="form-control" placeholder="請填入公司地址">
                            </div>
                            <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">註冊</button>
                            <div class="register-link m-t-15 text-center">
                                <p>已有帳號<a href="/Design/B/login">登入</a></p>
                            </div>
                            </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>