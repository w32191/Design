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
<title>公告 - DESIGN & DECOR</title>

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
								<h1>Hello, <span>Welcome Here</span></h1>
                            <a type="button" id="insertBtn"
                                    class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5" href="${contextRoot}/B/Announcement/add">
                                <i class="ti-plus"></i>新增公告
                            </a>
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
									<div class="card-header">

										新增時間 <span> <fmt:formatDate
												pattern="yyyy-MM-dd HH:mm:ss EEEE"
												value="${announcementWorkMessages.added}" />
										</span>
									</div>
									<div class="card-body">
										<c:out value="${announcementWorkMessages.content}" />
										<div class="edit-link">
											<a href="${contextRoot}/B/Announcement/editMessage?id=${announcementWorkMessages.id}">編輯</a> | 
											<a onclick="return confirm('確認刪除')"href="${contextRoot}/B/Announcement/deleteMessage?id=${announcementWorkMessages.id}">刪除</a>
										</div>
									</div>
								</c:forEach>

								<div class="row justify-content-center">
									<div class="col-9">
										<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

											<c:choose>
												<c:when test="${page.number != pageNumber-1 }">
													<a
														href="${contextRoot}/B/Announcement/viewMessages?p=${pageNumber}"><c:out
															value="${pageNumber}" /> </a>
												</c:when>

												<c:otherwise>
													<c:out value="${pageNumber}" />
												</c:otherwise>

											</c:choose>

											<c:if test="${pageNumber != page.totalPages}">
		    |
		   									</c:if>

											</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		
		</section>

	

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



















