<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>加入會員</title>
</head>
<body>
    
        <h1>加入會員</h1>
        <form:form class="form" method="POST" ModelAttribute="doRegister">
            <section class="form-input">
                <label>帳號/Email</label>
                <div class="input-area">
                    <input type="email" name="email" placeholder="請輸入您的Email"/>
                </div>
            </section>
            
            <p/>
            <section class="form-input">
                <label>密碼</label>
                <div class="input-area">
                    <input type="password" name="pwd" maxlength="16" placeholder="請輸入您的密碼"/>
                </div>
            </section>
            <p/>
            <section class="form-input">
                <label>再次輸入密碼</label>
                <div class="input-area">
                    <input type="password" name="checkpwd" maxlength="16" placeholder="請再次輸入您的密碼"/>
                </div>
            </section>
            <p/>
            <button>註冊</button>
            <span>已經是會員了嗎?<a href="/B/Account/login">立即登入</a></span>
    </form:form>
    
    <script src="/js/register.js"></script>
</body>
</html>