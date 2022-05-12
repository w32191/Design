<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>登入 - DESIGN & DECOR</title>

<!-- Common Styles -->
<jsp:include page="../IncludePage/staticPage/BackCssPage.jsp" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--------------------------------->

</head>

<body class="bg-primary">


	<div class="unix-login">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="login-content">
						<div class="login-logo">
							<a><span>DESIGN & DECOR 後台系統</span></a>
						</div>
						<div class="login-form">
							<h4>登入 DESIGN & DECOR 後台</h4>
							<form:form class="form" name="account" ModelAttribute="login"
								action="/Design/B/login">
								<form:errors name="*" />
								<div class="form-group">
									<label>信箱</label> <input type="email" id="email" name="email"
										class="form-control" placeholder="請輸入信箱 " />
								</div>
								<br>
								<div class="form-group">
									<label>密碼</label> <input type="password" id="pwd" name="pwd"
										class="form-control" placeholder="請輸入密碼" />
								</div>
								<div class="checkbox">
									<label class="pull-right"> <a href="#">Forgotten
											Password?</a>
									</label>
									<button type="submit" id="loginbutton"
										class="btn btn-primary btn-flat m-b-30 m-t-30">登入</button>
								</div>
							</form:form>

							<p></p>
							<div class="register-link m-t-15 text-center">
								<p>
									註冊員工<a href="/Design/B/register"> 立即加入</a>
								</p>



							</div>

						</div>
						<div class="card">
							<p>
								<button id="one">超級帳號</button>
								<button id="two">一般帳號</button>
								<button id="three">修改個資後帳號</button>
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp" />
	<script type="text/javascript">
		$('#one').on("click", function() {
			$('#email').val('admin@gmail.com');
			$('#pwd').val('Passw0rd');
		})

		$('#two').on("click", function() {
			$('#email').val('Abcd1234@gmail.com');
			$('#pwd').val('Passw0rd');
		})

		$('#three').on("click", function() {
			$('#email').val('1234Abcd@gmail.com');
			$('#pwd').val('Passw0rd');
		})

		document.getElementById('loginbutton').addEventListener('click',
				function() {
					Swal.fire({
						icon : 'success',
						title : '登入成功',
						showConfirmButton : false,
						timer : 1500
					})
				})
	</script>

	<c:choose>
		<c:when test="${errorMsg!=null}">
			<script>
				Swal.fire({
					position : 'top',
					icon : 'error',
					title : '請先登入！！',
					showConfirmButton : false,
					timer : 1500
				});
			</script>
		</c:when>
		<c:when test="${RegisterResult == 'Success'}">
			<script>
				Swal.fire({
					position : 'top',
					icon : 'success',
					title : '註冊成功！！',
					showConfirmButton : false,
					timer : 1500
				});
			</script>
		</c:when>
		<c:when test="${RegisterResult == 'Error'}">
		<script>
				Swal.fire({
					position : 'top',
					icon : 'error',
					title : '註冊失敗！！',
					showConfirmButton : false,
					timer : 1500
				});
			</script>
		</c:when>
		<c:when test="${logoutResult != null}">
			<script>
				Swal.fire({
					position : 'top',
					icon : 'success',
					title : '已成功登出！！',
					showConfirmButton : false,
					timer : 1500
				});
			</script>
		</c:when>
	
	</c:choose>

</body>

</html>

