<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Navbar</title>

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
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">UI-Navbar</li>
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
                            <div class="card-title">
                                <h4>Navigation Bars</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">A standard navigation bar is created
                                    with <code>&lt;nav class="navbar navbar-default"&gt;</code>.</p>
                                <nav class="navbar navbar-default">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                            <li><a href="#">Page 3</a></li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Inverted Navigation Bar</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">Just change the
                                    <code>.navbar-default</code> class into
                                    <code>.navbar-inverse</code>:</p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                            <li><a href="#">Page 3</a></li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navigation Bar With Dropdown</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">The following example adds a dropdown
                                    menu for the "Page 1" button:</p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown"
                                                   href="#">Page 1
                                                    <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Page 1-1</a></li>
                                                    <li><a href="#">Page 1-2</a></li>
                                                    <li><a href="#">Page 1-3</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Page 2</a></li>
                                            <li><a href="#">Page 3</a></li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Right-Aligned Navigation Bar</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">The <code>.navbar-right</code> class is
                                    used to right-align navigation bar buttons. </p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                        </ul>
                                        <ul class="nav navbar-nav navbar-right">
                                            <li><a href="#"><span
                                                    class="glyphicon glyphicon-user"></span> Sign Up</a>
                                            </li>
                                            <li><a href="#"><span
                                                    class="glyphicon glyphicon-log-in"></span> Login</a>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Buttons</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">To add buttons inside the navbar, add
                                    the <code>.navbar-btn</code> class on a Bootstrap button:
                                </p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Link</a></li>
                                            <li><a href="#">Link</a></li>
                                        </ul>
                                        <button class="btn btn-danger navbar-btn">Button</button>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Forms</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">To add form elements inside the navbar,
                                    add the <code>.navbar-form</code> class to a form element and
                                    add an input(s). Note that we have added a
                                    <code>.form-group</code> class to the div container holding the
                                    input. This adds proper padding if you have more than one inputs
                                    (you will learn more about this in the Forms chapter).</p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                        </ul>
                                        <form class="navbar-form navbar-left">
                                            <div class="form-group">
                                                <input type="text" class="form-control"
                                                       placeholder="Search">
                                            </div>
                                            <button type="submit" class="btn btn-default">Submit
                                            </button>
                                        </form>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Input Addons</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">You can also use the
                                    <code>.input-group</code> and <code>.input-group-addon</code>
                                    classes to attach an icon or help text next to the input field.
                                    You will learn more about these classes in the Bootstrap Inputs
                                    chapter.</p>
                                <form class="navbar-form navbar-left">
                                    <div class="input-group">
                                        <input type="text" class="form-control"
                                               placeholder="Search">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" type="submit">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Text</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">Use the <code>.navbar-text</code> class
                                    to vertical align any elements inside the navbar that are not
                                    links (ensures proper padding and text color).</p>
                                <nav class="navbar navbar-inverse">
                                    <ul class="nav navbar-nav">
                                        <li><a href="#">Link</a></li>
                                        <li><a href="#">Link</a></li>
                                    </ul>
                                    <p class="navbar-text">Some text</p>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Fixed Navigation Bar</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">The <code>.navbar-fixed-bottom</code>
                                    class makes the navigation bar stay at the bottom:</p>
                                <nav class="navbar navbar-inverse">
                                    <ul class="nav navbar-nav">
                                        <li><a href="#">Link</a></li>
                                        <li><a href="#">Link</a></li>
                                    </ul>
                                    <p class="navbar-text">Some text</p>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer">
                            <p>2018 © Admin Board. - <a href="#">example.com</a> / More Templates <a
                                    href="https://shop194286523.taobao.com/" title="狮王素材官网"
                                    target="_blank">Bootstrap模板下载</a> - Collect from <a
                                    href="https://shop194286523.taobao.com/" title="狮王素材官网"
                                    target="_blank">狮王素材</a></p>
                        </div>
                    </div>
                </div>
            </section>
            <section id="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navigation Bars</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">A standard navigation bar is created
                                    with <code>&lt;nav class="navbar navbar-default"&gt;</code>.</p>
                                <nav class="navbar navbar-default">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                            <li><a href="#">Page 3</a></li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Inverted Navigation Bar</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">Just change the
                                    <code>.navbar-default</code> class into
                                    <code>.navbar-inverse</code>:</p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                            <li><a href="#">Page 3</a></li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navigation Bar With Dropdown</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">The following example adds a dropdown
                                    menu for the "Page 1" button:</p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li class="dropdown">
                                                <a class="dropdown-toggle" data-toggle="dropdown"
                                                   href="#">Page 1
                                                    <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Page 1-1</a></li>
                                                    <li><a href="#">Page 1-2</a></li>
                                                    <li><a href="#">Page 1-3</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Page 2</a></li>
                                            <li><a href="#">Page 3</a></li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Right-Aligned Navigation Bar</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">The <code>.navbar-right</code> class is
                                    used to right-align navigation bar buttons. </p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                        </ul>
                                        <ul class="nav navbar-nav navbar-right">
                                            <li><a href="#"><span
                                                    class="glyphicon glyphicon-user"></span> Sign Up</a>
                                            </li>
                                            <li><a href="#"><span
                                                    class="glyphicon glyphicon-log-in"></span> Login</a>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Buttons</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">To add buttons inside the navbar, add
                                    the <code>.navbar-btn</code> class on a Bootstrap button:
                                </p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Link</a></li>
                                            <li><a href="#">Link</a></li>
                                        </ul>
                                        <button class="btn btn-danger navbar-btn">Button</button>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Forms</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">To add form elements inside the navbar,
                                    add the <code>.navbar-form</code> class to a form element and
                                    add an input(s). Note that we have added a
                                    <code>.form-group</code> class to the div container holding the
                                    input. This adds proper padding if you have more than one inputs
                                    (you will learn more about this in the Forms chapter).</p>
                                <nav class="navbar navbar-inverse">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <a class="navbar-brand" href="#">WebSiteName</a>
                                        </div>
                                        <ul class="nav navbar-nav">
                                            <li class="breadcrumb-item active"><a href="#">Home</a>
                                            </li>
                                            <li><a href="#">Page 1</a></li>
                                            <li><a href="#">Page 2</a></li>
                                        </ul>
                                        <form class="navbar-form navbar-left">
                                            <div class="form-group">
                                                <input type="text" class="form-control"
                                                       placeholder="Search">
                                            </div>
                                            <button type="submit" class="btn btn-default">Submit
                                            </button>
                                        </form>
                                    </div>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Input Addons</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">You can also use the
                                    <code>.input-group</code> and <code>.input-group-addon</code>
                                    classes to attach an icon or help text next to the input field.
                                    You will learn more about these classes in the Bootstrap Inputs
                                    chapter.</p>
                                <form class="navbar-form navbar-left">
                                    <div class="input-group">
                                        <input type="text" class="form-control"
                                               placeholder="Search">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" type="submit">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Navbar Text</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">Use the <code>.navbar-text</code> class
                                    to vertical align any elements inside the navbar that are not
                                    links (ensures proper padding and text color).</p>
                                <nav class="navbar navbar-inverse">
                                    <ul class="nav navbar-nav">
                                        <li><a href="#">Link</a></li>
                                        <li><a href="#">Link</a></li>
                                    </ul>
                                    <p class="navbar-text">Some text</p>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Fixed Navigation Bar</h4>
                            </div>
                            <div class="card-bady">
                                <p class="text-muted m-b-15">The <code>.navbar-fixed-bottom</code>
                                    class makes the navigation bar stay at the bottom:</p>
                                <nav class="navbar navbar-inverse">
                                    <ul class="nav navbar-nav">
                                        <li><a href="#">Link</a></li>
                                        <li><a href="#">Link</a></li>
                                    </ul>
                                    <p class="navbar-text">Some text</p>
                                </nav>

                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->

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
