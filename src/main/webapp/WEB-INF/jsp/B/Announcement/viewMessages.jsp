<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="org.springframework.util.Base64Utils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>公告</title>

    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>
</head>
<body>
<%--Left SideBar--%>
<jsp:include page="../IncludePage/layoutPage/leftSidebarPage.jsp"/>

<%--Header--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<p />
    <c:forEach var="workMessage" items="${page.content}">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">
						新增時間 
						<span>
						<span>${workMessage.content}</span>
						<fmt:formatDate
								pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${announcementWorkMessages.added}" />
						</span>
					</div>
					<div class="card-body">
						<c:out value="${announcementWorkMessages.content}" />

					</div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</body>
</html>