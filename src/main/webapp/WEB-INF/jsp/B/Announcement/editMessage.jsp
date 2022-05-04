<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FORM VALIDATION</title>

<!-- Common Styles -->
<jsp:include page="../IncludePage/staticPage/BackCssPage.jsp" />
</head>

<body>
	<p />

	<%--Left SideBar--%>
	<jsp:include page="../IncludePage/layoutPage/leftSidebarPage.jsp" />
	<%--Header--%>
	<jsp:include page="../IncludePage/layoutPage/headerPage.jsp" />

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
								<c:forEach var="announcementWorkMessages"
									items="${page.content}">
										<div class="card-header">編輯訊息</div>
				<div class="card-body">

					<form:form class="form" method="POST" modelAttribute="announcementWorkMessage">
					
					 <form:input type="hidden" path="id" />
					 <form:input type="hidden" path="added" />

						<!-- form:errors  bindingResult 回傳的物件 -->
						<form:errors path="text" />

						<div class="input-group">
							<form:textarea path="text" class="form-control"></form:textarea>
						</div>

						<input type="submit" name="submit" value="送出">
					</form:form>


				</div>
								</c:forEach>

							
					
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		<!-- Footer -->
		<jsp:include page="../IncludePage/layoutPage/footerPage.jsp" />
		</section>
	</div>
	</div>
	</div>

	<!-- jQuery & Bootstrap-->
	<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp" />

	<!-- Select2 -->
	<script
		src="${contextRoot}/static/back/assets/js/lib/select2/select2.full.min.js"></script>
	<script
		src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate.min.js"></script>
	<script
		src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate-init.js"></script>
	<!-- scripit init-->

</body>

</html>















