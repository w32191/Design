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
    <main>
        <h1>會員登入</h1>
        <form id=loginForm method="POST" action="@{/login}" enctype="multipart/form-data" autocomplete="off">
        	<input type="hidden" id="MESSAGE" value="${MESSAGE}"/>
            <section class="form-input">
                <label>帳號/email</label>
                <div class="input-area">
                    <input type="text"  placeholder="請輸入email"/>
                </div>
            </section>
            <section class="form-input">
                <label>密碼</label>
                <div class="input-area">
                    <input type="password" maxlength="16" placeholder="請輸入密碼"/>
                </div>
            </section>
            <button>登入</button>
            <span>還不是會員嗎<a href="">立即加入</a></span>
        </form>
    </main>

</body>
</html>