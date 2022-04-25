<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginout</title>
</head>
<body>
<form:form class="form" method="POST" ModelAttribute="loginout">
<div class="input-area">
    <input type="submit" name="logout" value="登出"/>
</div>
</form:form>
</body>
</html>