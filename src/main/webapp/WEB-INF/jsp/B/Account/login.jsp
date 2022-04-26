<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>會員登入</title>
</head>
<body>
        <h1>會員登入</h1>
        <form:form class="form" method="POST" ModelAttribute="login" >      	
        <input type="hidden" id="account" value="${account}"/>
        <form:errors type="text"/>
            <section class="form-input">
                <label>帳號/email</label>
                <div class="input-area">
                    <input type="text" name="email"  placeholder="請輸入email"/>
                </div>
            </section>
            <section class="form-input">
                <label>密碼</label>
                <div class="input-area">
                    <input type="password" name="pwd" maxlength="16" placeholder="請輸入密碼"/>
                </div>
            </section>
            <button>登入</button>
         </form:form>
            <span>還不是會員嗎<a href="">立即加入</a></span>

</body>
</html>