<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Focus Admin: Blank</title>

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
                                <li class="breadcrumb-item active">UI-Dropdown</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
            </div>
            <!-- /# row -->
            <section id="main-content">

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Basic Dropdown</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.dropdown</code> class
                                    indicates a dropdown menu. To open the dropdown menu, use a
                                    button or a link with a class of <code>.dropdown-toggle</code>
                                    and the <code>data-toggle="dropdown"</code> attribute. The
                                    <code>.caret</code> class creates a caret arrow icon (<span
                                            class="caret"></span>), which indicates that the button
                                    is a dropdown. Add the <code>.dropdown-menu</code> class to a
                                    <code>&lt;ul&gt;</code> element to actually build the dropdown
                                    menu.</p>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Dropdown Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Dropdown Divider</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.divider</code> class is used
                                    to separate links inside the dropdown menu with a thin
                                    horizontal border:</p>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Dropdown Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">JavaScript</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Dropdown Header</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.dropdown-header</code> class
                                    is used to add headers inside the dropdown menu:</p>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Dropdown Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li class="dropdown-header">Dropdown header 1</li>
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                        <li class="divider"></li>
                                        <li class="dropdown-header">Dropdown header 2</li>
                                        <li><a href="#">About Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Disable and Active items</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">To disable an item in the dropdown
                                    menu, use the <code>.disabled</code> class (gets a light-grey
                                    text color and a "no-parking-sign" icon on hover):</p>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Dropdown Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Normal</a></li>
                                        <li class="disabled"><a href="#">Disabled</a></li>
                                        <li class="breadcrumb-item active"><a href="#">Active</a>
                                        </li>
                                        <li><a href="#">Normal</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Dropdown Position</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">
                                    To right-align the dropdown, add the <code class="w3-codespan">.dropdown-menu-right</code>
                                    class to the element with .dropdown-menu:</p>
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Dropdown Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">About Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Dropup</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">If you want the dropdown menu to expand
                                    upwards instead of downwards, change the &lt;div&gt; element
                                    with class="dropdown" to <code
                                            class="w3-codespan">"dropup"</code>:</p>
                                <div class="dropup">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Dropup Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">About Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Dropdown Accessibility</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">To help improve accessibility for
                                    people using screen readers, you should include the following
                                    <code class="w3-codespan">role</code> and <code
                                            class="w3-codespan">aria-*</code> attributes, when
                                    creating a dropdown menu:</p>
                                <div class="dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button"
                                            id="menu1" data-toggle="dropdown">Tutorials
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                        <li role="presentation"><a role="menuitem" href="#">HTML</a>
                                        </li>
                                        <li role="presentation"><a role="menuitem" href="#">CSS</a>
                                        </li>
                                        <li role="presentation"><a role="menuitem" href="#">JavaScript</a>
                                        </li>
                                        <li role="presentation" class="divider"></li>
                                        <li role="presentation"><a role="menuitem" href="#">About
                                            Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Dropup</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">If you want the dropdown menu to expand
                                    upwards instead of downwards, change the &lt;div&gt; element
                                    with class="dropdown" to <code
                                            class="w3-codespan">"dropup"</code>:</p>
                                <div class="dropup">
                                    <button class="btn btn-primary dropdown-toggle" type="button"
                                            data-toggle="dropdown">Dropup Example
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                        <li><a href="#">JavaScript</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">About Us</a></li>
                                    </ul>
                                </div>
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
