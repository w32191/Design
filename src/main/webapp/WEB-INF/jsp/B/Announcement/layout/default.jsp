<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/message/add">新增公告</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/message/viewMessages">查看公告</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled">Disabled</a>
      </li>
    </ul>
  </div>
</nav>
<section id="main-content">
					<div class="row">
						<div class="col-lg-12">


							<div class="card">
							<c:forEach var="announcementWorkMessages" items="${page.content}">
								<div class="card-header">
								
									新增時間 <span> 
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
											value="${announcementWorkMessages.added}" />
									</span>
								</div>
								<div class="card-body">
									<c:out value="${announcementWorkMessages.content}" />

								</div>
								</c:forEach>
							</div>


						</div>


					</div>
			</div>
		</div>
		<!-- Footer -->

		</section>

<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>






