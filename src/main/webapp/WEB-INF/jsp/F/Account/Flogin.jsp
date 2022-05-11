<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Design Login</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


    <%--  CSS include page--%>
    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp"/>
    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>

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
							<h1>Login</h1>
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
                        <h3 class="text-center mb-60">Login</h3>
                        <form:form class="form" method="POST" modelAttribute="Flogin"
                                   action="/Design/F/Flogin">
                            <label for="email">信箱</label>
                            <%--                            <input name="email" type="email" placeholder="請輸入信箱"/>--%>
                            <form:input path="email" type="email" placeholder="請輸入信箱"/>
                            <form:errors path="email" cssClass="error"/>
                            <label for="pwd">密碼</label>
                            <%--                            <input name="pwd" type="password" placeholder="請輸入密碼"/>--%>
                            <form:input path="pwd" type="password" placeholder="請輸入密碼"/>
                            <form:errors path="pwd" cssClass="error"/>
                            <div class="login-action mb-20 fix">
                                <span class="forgot-login f-right">
                                        <a href="#">忘記密碼</a>
                                    </span>
                            </div>
                            <button class="os-btn w-100">登入</button>
                            <div class="or-divide"><span>or</span></div>
                            <a href="/Design/F/Fregister" class="os-btn os-btn-black w-100"> 註冊</a>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- login Area End-->
</main>
  
  	<%-- footer page --%>
	<jsp:include page="../IncludePage/layoutPage/footerPage.jsp" />

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
  <script type="text/javascript">
		$('#Flogin1').on("click", function() {
			$('#email').val('Abcd1234@gmail.com');
			$('#pwd').val('Passw0rd');
		})
		
		$('#Flogin2').on("click", function() {
			$('#email').val('Acvbnm12345@gmail.com');
			$('#pwd').val('Passw0rd');
		})
	</script>
<c:choose>
    <c:when test="${errorMsg!=null}">
        <script>
          Swal.fire({
            position: 'top',
            icon: 'error',
            title: '請先登入！！',
            showConfirmButton: false,
            timer: 1500
          });
        </script>
    </c:when>
</c:choose>

</body>

</html>
