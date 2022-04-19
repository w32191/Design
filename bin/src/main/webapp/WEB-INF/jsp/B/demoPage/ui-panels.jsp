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
                                <li class="breadcrumb-item active">UI-Panels</li>
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
                                <h4>Panels</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">Panels are created with the <code>.panel</code>
                                    class, and content inside the panel has a
                                    <code>.panel-body</code> class:</p>

                                <div class="panel panel-default">
                                    <div class="panel-body">A Basic Panel</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Panel Heading</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.panel-heading</code> class
                                    adds a heading to the panel:</p>

                                <div class="panel panel-default">
                                    <div class="panel-heading">Panel Heading</div>
                                    <div class="panel-body">Panel Content</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Panel Footer</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">The <code>.panel-footer</code> class
                                    adds a footer to the panel:</p>

                                <div class="panel panel-default">
                                    <div class="panel-body">Panel Content</div>
                                    <div class="panel-footer">Panel Footer</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-title">
                                <h4>Panel Group</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">To group many panels together, wrap a
                                    <code>&lt;div&gt;</code> with class <code>.panel-group</code>
                                    around them.</p>

                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-body">Panel Content</div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-body">Panel Content</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-title">
                                <h4>Panels with Contextual Classes</h4>
                            </div>
                            <div class="card-body">
                                <p class="text-muted m-b-15">To color the panel, use contextual
                                    classes (<code>.panel-default</code>,
                                    <code>.panel-primary</code>, <code>.panel-success</code>, <code>.panel-info</code>,
                                    <code>.panel-warning</code>, or <code>.panel-danger</code>):</p>

                                <div class="panel-group">
                                    <div class="panel panel-default m-t-15">
                                        <div class="panel-heading">Panel with panel-default class
                                        </div>
                                        <div class="panel-body">Panel Content</div>
                                    </div>

                                    <div class="panel panel-primary m-t-15">
                                        <div class="panel-heading">Panel with panel-primary class
                                        </div>
                                        <div class="panel-body">Panel Content</div>
                                    </div>

                                    <div class="panel panel-success m-t-15">
                                        <div class="panel-heading">Panel with panel-success class
                                        </div>
                                        <div class="panel-body">Panel Content</div>
                                    </div>

                                    <div class="panel panel-info m-t-15">
                                        <div class="panel-heading">Panel with panel-info class</div>
                                        <div class="panel-body">Panel Content</div>
                                    </div>

                                    <div class="panel panel-warning m-t-15">
                                        <div class="panel-heading">Panel with panel-warning class
                                        </div>
                                        <div class="panel-body">Panel Content</div>
                                    </div>

                                    <div class="panel panel-danger m-t-15">
                                        <div class="panel-heading">Panel with panel-danger class
                                        </div>
                                        <div class="panel-body">Panel Content</div>
                                    </div>
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
