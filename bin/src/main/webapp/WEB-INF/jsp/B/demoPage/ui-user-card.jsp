<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: User Card</title>
    <!-- Common Styles -->
    <jsp:include page="../IncludePage/staticPage/BackCssPage.jsp"/>
</head>

<body>
<%--Left SideBar--%>
<jsp:include page="../IncludePage/layoutPage/leftSidebarPage.jsp"/>

<%--Header--%>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-r-0 title-margin-right">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>Hello, <span>Welcome Here</span></h1>
                        </div>
                    </div>
                </div><!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">UI-Blank</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /# column -->
            </div><!-- /# row -->
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Simple User Cards</h4>
                                <p>A very basic simple user cards.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li><a class="border-default" href=""><i
                                            class="ti-facebook"></i> </a></li>
                                    <li><a class="border-success" href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li><a class="border-info" href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Simple User Cards With Border</h4>
                                <p>A very basic simple user cards.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card border-success">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card border-danger">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card border-info">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card box-shadow">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card box-shadow">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card box-shadow">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="social-connect text-center">
                                <ul>
                                    <li class="social-item"><a href=""><i class="ti-facebook"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-twitter"></i>
                                    </a></li>
                                    <li class="social-item"><a href=""><i class="ti-linkedin"></i>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Simple User Cards</h4>
                                <p>A very basic simple user cards.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-danger btn-outline m-b-10 m-l-5">Follow
                                </button>
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5">Profile
                                </button>
                            </div>
                            <ul class="list-group m-t-30">
                                <li class="border-top p-20">By : Jhon doe</li>
                                <li class="border-top p-20">View : 105</li>
                                <li class="border-top p-20">Released : 16 Jan, 2017</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-danger btn-outline m-b-10 m-l-5">Follow
                                </button>
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5">Profile
                                </button>
                            </div>
                            <ul class="list-group m-t-30">
                                <li class="border-top p-20">By : Jhon doe</li>
                                <li class="border-top p-20">View : 105</li>
                                <li class="border-top p-20">Released : 16 Jan, 2017</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-danger btn-outline m-b-10 m-l-5">Follow
                                </button>
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5">Profile
                                </button>
                            </div>
                            <ul class="list-group m-t-30">
                                <li class="border-top p-20">By : Jhon doe</li>
                                <li class="border-top p-20">View : 105</li>
                                <li class="border-top p-20">Released : 16 Jan, 2017</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>User Profile Cards with Stats</h4>
                                <p>User profile cards with Stats in border & shadow variant.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success btn-outline m-b-10 m-l-5"><i
                                        class="ti-bell"></i><br><span>12+</span></button>
                                <button class="btn btn-success btn-outline m-b-10 m-l-5"><i
                                        class="ti-heart"></i><br><span>30</span></button>
                                <button class="btn btn-success btn-outline m-b-10 m-l-5"><i
                                        class="ti-envelope"></i><br><span>50+</span></button>
                                <button class="btn btn-success btn-outline m-b-10 m-l-5"><i
                                        class="ti-file"></i><br><span>45</span></button>
                                <button class="btn btn-success btn-outline m-b-10 m-l-5"><i
                                        class="ti-comment-alt"></i><br><span>34</span></button>
                            </div>
                            <ul class="list-group m-t-30">
                                <li class="border-top p-20">By : Jhon doe</li>
                                <li class="border-top p-20">View : 105</li>
                                <li class="border-top p-20">Released : 16 Jan, 2017</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-info btn-outline m-b-10 m-l-5"><i
                                        class="ti-bell"></i><br><span>12+</span></button>
                                <button class="btn btn-info btn-outline m-b-10 m-l-5"><i
                                        class="ti-heart"></i><br><span>30</span></button>
                                <button class="btn btn-info btn-outline m-b-10 m-l-5"><i
                                        class="ti-envelope"></i><br><span>50+</span></button>
                                <button class="btn btn-info btn-outline m-b-10 m-l-5"><i
                                        class="ti-file"></i><br><span>45</span></button>
                                <button class="btn btn-info btn-outline m-b-10 m-l-5"><i
                                        class="ti-comment-alt"></i><br><span>34</span></button>
                            </div>
                            <ul class="list-group m-t-30">
                                <li class="border-top p-20">By : Jhon doe</li>
                                <li class="border-top p-20">View : 105</li>
                                <li class="border-top p-20">Released : 16 Jan, 2017</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-card-profile round-img text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation m-t-27 m-b-27 text-center">
                                <h4>Michelle Howard</h4>
                                <h6>Managing Director</h6>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5"><i
                                        class="ti-bell"></i><br><span>12+</span></button>
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5"><i
                                        class="ti-heart"></i><br><span>30</span></button>
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5"><i
                                        class="ti-envelope"></i><br><span>50+</span></button>
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5"><i
                                        class="ti-file"></i><br><span>45</span></button>
                                <button class="btn btn-primary btn-outline m-b-10 m-l-5"><i
                                        class="ti-comment-alt"></i><br><span>34</span></button>
                            </div>
                            <ul class="list-group m-t-30">
                                <li class="border-top p-20">By : Jhon doe</li>
                                <li class="border-top p-20">View : 105</li>
                                <li class="border-top p-20">Released : 16 Jan, 2017</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="co-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>User Profile Cards with Cover Image</h4>
                                <p>User profile cards with Stats in border & shadow variant.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-bg-card pr">
                                <img class="img-fluid" src="assets/images/user-bg.jpg" alt="">
                            </div>
                            <div class="user-card-profile user-card-absolute round-img pa text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation p-t-100 text-center">
                                <span>Lorem Ipsum Dolar </span>
                                <span class="m-r-5 m-l-5"> | </span>
                                <span> Lorem Ipsum Dolar</span>
                                <h4>Lew Shown Pertison</h4>
                            </div>
                            <div class="social-connect text-center p-20">
                                <ul>
                                    <li class="social-item"><a href=""><i
                                            class="ti-facebook color-primary"></i> </a></li>
                                    <li class="social-item"><a href=""><i
                                            class="ti-twitter color-success"></i> </a></li>
                                    <li class="social-item"><a href=""><i
                                            class="ti-linkedin color-danger"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-bg-card pr">
                                <img class="img-fluid" src="assets/images/user-bg.jpg" alt="">
                            </div>
                            <div class="user-card-profile user-card-absolute round-img pa text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation p-t-100 text-center">
                                <span>Lorem Ipsum Dolar </span>
                                <span class="m-r-5 m-l-5"> | </span>
                                <span> Lorem Ipsum Dolar</span>
                                <h4>Lew Shown Pertison</h4>
                            </div>
                            <div class="social-connect text-center p-20">
                                <ul>
                                    <li class="social-item"><a href=""><i
                                            class="ti-facebook color-primary"></i> </a></li>
                                    <li class="social-item"><a href=""><i
                                            class="ti-twitter color-success"></i> </a></li>
                                    <li class="social-item"><a href=""><i
                                            class="ti-linkedin color-danger"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card-body">
                            <div class="user-bg-card pr">
                                <img class="img-fluid" src="assets/images/user-bg.jpg" alt="">
                            </div>
                            <div class="user-card-profile user-card-absolute round-img pa text-center">
                                <img class="height-150" src="assets/images/user.jpg" alt="">
                            </div>
                            <div class="designation p-t-100 text-center">
                                <span>Lorem Ipsum Dolar </span>
                                <span class="m-r-5 m-l-5"> | </span>
                                <span> Lorem Ipsum Dolar</span>
                                <h4>Lew Shown Pertison</h4>
                            </div>
                            <div class="social-connect text-center p-20">
                                <ul>
                                    <li class="social-item"><a href=""><i
                                            class="ti-facebook color-primary"></i> </a></li>
                                    <li class="social-item"><a href=""><i
                                            class="ti-twitter color-success"></i> </a></li>
                                    <li class="social-item"><a href=""><i
                                            class="ti-linkedin color-danger"></i> </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer -->
                <jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>
            </section>
        </div>
    </div>
</div>

<!-- jQuery & Bootstrap-->
<jsp:include page="../IncludePage/staticPage/BackJsPage.jsp"/>
</body>

</html>
