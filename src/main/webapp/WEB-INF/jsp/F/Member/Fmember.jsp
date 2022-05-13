<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Design 會員資料</title>
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
							<h1>會員詳細資料</h1>
							<div class="page__title-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb justify-content-center">
										<li class="breadcrumb-item"><a href="index.html">Home</a></li>
										<li class="breadcrumb-item active" aria-current="page">
											Login</li>
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
							<h3 class="text-center mb-60">會員資料</h3>
							<form:form class="form" name="member"
								ModelAttribute="Fmemberupdate" action="/Design/F/Fmemberupdate">
								<label for="email">信箱</label>
								<input name="email" id="email" type="email"
									value="${Faccount.email}" />
								<label for="names">姓名</label>
								<input name="names" id="names" type="text"
									value="${Fmemberupdate.names}" />
								<label for="phone">電話</label>
								<input name="phone" id="phone" type="tel"
									value="${Fmemberupdate.phone}" />
								<label for="address">地址</label>
								<input name="address" id="address" type="text"
									value="${Fmemberupdate.address}" />
								<br>
								<br>
								<br>
								<button class="os-btn w-100">修改</button>

							</form:form>
						</div>
						<button id="Fmem1">修改</button>
						<button id="Fmem2">恢復</button>
<!-- 						<button id="Fmem3">一鍵註冊後帳號修改</button> -->
<!-- 						<button id="Fmem4">一鍵註冊後帳號恢復</button> -->
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
		$('#Fmem1').on("click", function() {
			$('#names').val('XXXXX');
			$('#phone').val('0932446738');
			$('#address').val('新北市五股區五福路11號');
		})

		$('#Fmem2').on("click", function() {
			$('#names').val('CCCCCC');
			$('#phone').val('0932234567');
			$('#address').val('新北市三重區五華街282號');
		})
	</script>

</body>



</html>
