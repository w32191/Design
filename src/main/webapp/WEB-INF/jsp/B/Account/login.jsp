<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>會員登入</title>
    <head th:insert="load/css :: css"></head>
    <link rel="stylesheet" th:href="@{/css/login.css}">
</head>
<body>
    <main>
        <h1>會員登入</h1>
        <form id=loginForm method="POST" th:action="@{/login}" th:Object="${Account}" enctype="multipart/form-data" autocomplete="off">
        	<input type="hidden" id="MESSAGE" th:value="${MESSAGE}"/>
            <section class="form-input">
                <label>帳號/email</label>
                <div class="input-area">
                    <div class="input-img"><img th:src=""></div>
                    <input type="text" th:field="*{email}" placeholder="請輸入email"/>
                </div>
            </section>
            <section class="form-input">
                <label>密碼</label>
                <div class="input-area">
                    <div class="input-img"><img th:src="@{/images/lock.png}"></div>
                    <input type="password" th:field="*{pwd}" maxlength="16" placeholder="請輸入密碼"/>
                </div>
            </section>
            <button>登入</button>
            <span>還不是會員嗎<a th:href="@{/register}">立即加入</a></span>
        </form>
    </main>

</body>
</html>