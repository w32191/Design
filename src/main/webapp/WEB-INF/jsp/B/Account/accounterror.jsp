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

<title>DESIGN & DECOR</title>

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
							<a><span>Design後台系統</span></a>
						</div>
						<form:form class="form" action="/Design/B/accountError">
						<div class="login-form">
							<h4>無此帳號</h4>
							<button type="submit"
								class="btn btn-primary btn-flat m-b-30 m-t-30">返回</button>
						</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>






	<script>
                
                    document.getElementById('loginbutton').addEventListener('click' ,function(){
                        Swal.fire({
                            icon: 'success',
                            title: '登入成功',
                            showConfirmButton: false,
                            timer: 1500
                    }).then((result) => {
                        success: then(function (){
                            window.location.href="/Design/B/index"
                        });
                        error: then(function(){
                            window.location.href="/Design/B/error"
                        });

                    })
                    })
                </script>


</body>

</html>
