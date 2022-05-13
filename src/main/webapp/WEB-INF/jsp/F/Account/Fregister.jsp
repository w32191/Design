<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>註冊 - DESIGN & DECOR</title>
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
							<h1>註冊</h1>
							<div class="page__title-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb justify-content-center">
										<li class="breadcrumb-item"><a href="index.html">Home</a></li>
										<li class="breadcrumb-item active" aria-current="page">
											Register</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- page title area end -->

		<!-- login Area Strat-->
		<section class="login-area pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<div class="basic-login">
							<h3 class="text-center mb-60">註冊</h3>
							<form:form class="form" method="POST"
								ModelAttribute="FdoRegister">
								<label for="email-id">信箱</label>
								<input name="email" id="email" type="email" placeholder="請輸入信箱" />
								<label for="pass">密碼</label>
								<input name="pwd" id="pwd" type="password" placeholder="請輸入密碼" />
								<label for="pass">確認密碼</label>
								<input name="pwd2" id="pwd2" type="password" placeholder="請輸入密碼" />
								<div class="mt-10"></div>
								<br>
								<button type="submit" class="os-btn w-100">下一步</button>
								<div class="or-divide">
									<span>or</span>
								</div>
								<a href="/Design/F/Flogin" class="os-btn os-btn-black w-100">登入</a>
							</form:form>
						</div>
						<button id="Frelogininsert">一鍵輸入</button>
					</div>
				</div>
			</div>
		</section>
		<!-- login Area End-->
	</main>

	<%-- footer page --%>
	<jsp:include page="../IncludePage/layoutPage/footerPage.jsp" />

	<!-- JavaScript -->
	<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp" />

	<script type="text/javascript">
		$('#Frelogininsert').on("click", function() {
			$('#email').val('Acvbnm12345@gmail.com');
			$('#pwd').val('Passw0rd');
			$('#pwd2').val('Passw0rd');
		})
	</script>
</body>

</html>
