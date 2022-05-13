<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="utf-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1">

				<title>Focus Admin: Widget</title>

				<!-- Common Styles -->
				<jsp:include page="../IncludePage/staticPage/BackCssPage.jsp" />
				<link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css" rel="stylesheet" />

			</head>

			<body class="bg-primary">
				<div class="unix-login">
					<div class="container-fluid">
						<div class="row justify-content-center">
							<div class="col-lg-6">
								<div class="login-content">
									<div class="login-logo">
										<a href="index.html"><span>註冊Design後台管理系統</span></a>
									</div>
									<div class="login-form">
										<h4>註冊員工</h4>
										<form:form class="form" name="register" id="formId" ModelAttribute="doRegister">
											<form:errors path="*" />

											<div class="form-group">
												<label>信箱</label> <input type="email" id="email" name="email"
													class="form-control" placeholder="請填入信箱" required />
											</div>
											<div class="form-group">
												<label>密碼</label> <input type="password" id="pwd" name="pwd"
													class="form-control" placeholder="請填入密碼" required />
											</div>
											<div class="form-group">
												<label>再次輸入密碼</label> <input type="password" id="pwd2" name="pwd"
													class="form-control" placeholder="請填入密碼" required />
											</div>
											<button id="submitBtn"
												class="btn btn-primary btn-flat m-b-30 m-t-30">下一步</button>
											<div class="register-link m-t-15 text-center">
												<p>
													已有帳號<a href="/Design/B/login">登入</a>
												</p>
											</div>

										</form:form>
									</div>
									<div class="card">
										<p>
											<button id="putemailpwd">一鍵註冊</button>
										</p>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>

				<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp" />
				<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
				<script type="text/javascript">
					$('#putemailpwd').on("click", function () {
						$('#email').val('Asdf1234@gmail.com');
						$('#pwd').val('Passw0rd');
						$('#pwd2').val('Passw0rd');
					})

				</script>

				<script type="text/javascript">

					$('#submitBtn').on('click', checkpwd);


					function checkpwd(e) {
						e.preventDefault();

						var pwd = document.getElementById("pwd").value;
						var pwd2 = document.getElementById("pwd2").value;

						if (pwd != pwd2) {
							Swal.fire({
								position: 'top',
								icon: 'error',
								title: '密碼不一致',
								showConfirmButton: false,
								timer:1000
							}).then(function () {
							swal.close();
							});



							document.getElementById("pwd2").focus();


						} else {
							window.event.returnvalue = true
							$("#formId").submit();
						}



					}



				</script>

			</body>

			</html>