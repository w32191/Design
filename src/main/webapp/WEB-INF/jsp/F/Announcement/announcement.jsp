<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Outstock - Clean, Minimal eCommerce HTML5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%--  CSS include page--%>
<jsp:include page="../IncludePage/staticPage/FontCssPage.jsp" />
</head>
<body>
	<%--Header Page--%>
	<jsp:include page="../IncludePage/layoutPage/headerPage.jsp" />

	<main>

		<!-- page title area start -->
		<section class="page__title p-relative d-flex align-items-center"
			data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="page__title-inner text-center">
							<h1>Announcement</h1>
							<div class="page__title-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb justify-content-center">
										<li class="breadcrumb-item"><a href="index.html">Home</a></li>
										<li class="breadcrumb-item active" aria-current="page">
											Announcement</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- page title area end -->

		<!-- Cart Area Strat-->
		<section class="cart-area pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<form action="#">
							<div class="table-content table-responsive">

								<div class="postbox__line mt-65"></div>
								<div class="postbox__comments pt-90">
									<div class="postbox__comment-title mb-30">
										<h3>最新公告</h3>
									</div>
									<div class="card">
 										<c:forEach var="announcementWorkMessages" 
 											items="${page.content}"> 
											<h4>
 											<div class="card-header"> 
 												<span class="badge badge-secondary"><c:out value="${announcementWorkMessages.type}" /></span>
 												&nbsp; 
 												 <span> <fmt:formatDate 
 														pattern="yyyy-MM-dd HH:mm:ss "
 														value="${announcementWorkMessages.added}" />
 												</span> 
 												<c:out value="${announcementWorkMessages.title}" />
 											</div>
 											<h5> 
 											<div class="card-body">
 												<c:out value="${announcementWorkMessages.content}" />		
 											</div>
 											</h5>
 											</h4>
 										</c:forEach>
										
<%-- 										<c:forEach items="${page.content}" var="announcementWorkMessages"> --%>
<!--                                         <div class="card"> -->
<%--                                             <div class="card-header white-bg" id="test${announcementWorkMessages.id}"> --%>
<!--                                                 <h5 class="mb-0"> -->
<%--                                                     <button class="shop-accordion-btn collapsed" data-toggle="collapse" data-target="#collapsetest${announcementWorkMessages.id}" aria-expanded="false" aria-controls="collapsetest${announcementWorkMessages.id}"> --%>
<%--                                                         ${announcementWorkMessages.added} --%>
<!--                                                     </button> -->
<!--                                                 </h5> -->
<!--                                             </div> -->
<%--                                             <div id="collapsetest${announcementWorkMessages.id}" class="collapse" aria-labelledby="test${announcementWorkMessages.id}" data-parent="#accordion"> --%>
<!--                                                 <div class="card-body"> -->
<!--                                                     <div class="categories__list"> -->
<!--                                                         <ul> -->
<%--                                                             <li><a href="#">${announcementWorkMessages.content}</a></li> --%>
<!--                                                         </ul> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->

<%--                                     </c:forEach> --%>
																																																																																																									
										<div class="row justify-content-center">
											<div class="col-9">
												<c:forEach var="pageNumber" begin="1"
													end="${page.totalPages}">

													<c:choose>
														<c:when test="${page.number != pageNumber-1 }">
															<a
																href="${contextRoot}/F/Announcement/viewMessages?p=${pageNumber}"><c:out
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
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- Cart Area End-->
	</main>


	<%-- footer page --%>
	<jsp:include page="../IncludePage/layoutPage/footerPage.jsp" />

	<!-- JavaScript -->
	<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp" />
</body>

</html>
