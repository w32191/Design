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
                        <a><span>後台系統</span></a>
                    </div>
                    <div class="login-form">
                        <h4>登入</h4>
                        <form:form class="form" name="account" ModelAttribute="login">
                            <div class="form-group">
                                <label>信箱</label>
                                <input type="email" name="email" class="form-control" placeholder="請輸入信箱 ">
                            </div>
                            <div class="form-group">
                                <label>密碼</label>
                                <input type="password" name="pwd" class="form-control" placeholder="請輸入密碼">
                            </div>
                            <div class="checkbox">
                                <label class="pull-right">
                                    <a href="#">Forgotten Password?</a>
                                </label>   
                                <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30">
                                登入
                            </button>
                            </div>
                            </form:form>
                            <p/>
                            <div class="register-link m-t-15 text-center">
                                <p>還不是會員嗎?<a href=""> 立即加入</a></p>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>