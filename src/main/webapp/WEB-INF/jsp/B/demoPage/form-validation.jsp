<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Focus Admin: Form Validation</title>

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
                            <h1>Form Validation</h1>
                        </div>
                    </div>
                </div>
                <!-- /# column -->
                <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                <li class="breadcrumb-item active">Form Validation</li>
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
                            <div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="#" method="post">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-username">Username <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control"
                                                       id="val-username" name="val-username"
                                                       placeholder="Enter a username..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-email">Email
                                                <span class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control"
                                                       id="val-email" name="val-email"
                                                       placeholder="Your valid email..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-password">Password <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control"
                                                       id="val-password" name="val-password"
                                                       placeholder="Choose a safe one..">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-confirm-password">Confirm Password <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <input type="password" class="form-control"
                                                       id="val-confirm-password"
                                                       name="val-confirm-password"
                                                       placeholder="..and confirm it!">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-select2">Select2 <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <select class="js-select2 form-control"
                                                        id="val-select2" name="val-select2"
                                                        style="width: 100%;"
                                                        data-placeholder="Choose one..">
                                                    <option></option>
                                                    <option value="html">HTML</option>
                                                    <option value="css">CSS</option>
                                                    <option value="javascript">JavaScript</option>
                                                    <option value="angular">Angular</option>
                                                    <option value="angular">React</option>
                                                    <option value="vuejs">Vue.js</option>
                                                    <option value="ruby">Ruby</option>
                                                    <option value="php">PHP</option>
                                                    <option value="asp">ASP.NET</option>
                                                    <option value="python">Python</option>
                                                    <option value="mysql">MySQL</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-select2-multiple">Select2 Multiple <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <select class="js-select2 form-control"
                                                        id="val-select2-multiple"
                                                        name="val-select2-multiple"
                                                        style="width: 100%;"
                                                        data-placeholder="Choose at least two.."
                                                        multiple>
                                                    <option></option>
                                                    <option value="html">HTML</option>
                                                    <option value="css">CSS</option>
                                                    <option value="javascript">JavaScript</option>
                                                    <option value="angular">Angular</option>
                                                    <option value="angular">React</option>
                                                    <option value="vuejs">Vue.js</option>
                                                    <option value="ruby">Ruby</option>
                                                    <option value="php">PHP</option>
                                                    <option value="asp">ASP.NET</option>
                                                    <option value="python">Python</option>
                                                    <option value="mysql">MySQL</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-suggestions">Suggestions <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <textarea class="form-control" id="val-suggestions"
                                                          name="val-suggestions" rows="5"
                                                          placeholder="What would you like to see?"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-skill">Best
                                                Skill <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <select class="form-control" id="val-skill"
                                                        name="val-skill">
                                                    <option value="">Please select</option>
                                                    <option value="html">HTML</option>
                                                    <option value="css">CSS</option>
                                                    <option value="javascript">JavaScript</option>
                                                    <option value="angular">Angular</option>
                                                    <option value="angular">React</option>
                                                    <option value="vuejs">Vue.js</option>
                                                    <option value="ruby">Ruby</option>
                                                    <option value="php">PHP</option>
                                                    <option value="asp">ASP.NET</option>
                                                    <option value="python">Python</option>
                                                    <option value="mysql">MySQL</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-currency">Currency <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control"
                                                       id="val-currency" name="val-currency"
                                                       placeholder="$21.60">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-website">Website <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control"
                                                       id="val-website" name="val-website"
                                                       placeholder="http://example.com">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"
                                                   for="val-phoneus">Phone (US) <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control"
                                                       id="val-phoneus" name="val-phoneus"
                                                       placeholder="212-999-0000">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-digits">Digits
                                                <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control"
                                                       id="val-digits" name="val-digits"
                                                       placeholder="5">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-number">Number
                                                <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control"
                                                       id="val-number" name="val-number"
                                                       placeholder="5.0">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-range">Range
                                                [1, 5] <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control"
                                                       id="val-range" name="val-range"
                                                       placeholder="4">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label"><a
                                                    data-toggle="modal" data-target="#modal-terms"
                                                    href="#">Terms &amp; Conditions</a> <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-lg-8">
                                                <label class="css-control css-control-primary css-checkbox"
                                                       for="val-terms">
                                                    <input type="checkbox" class="css-control-input"
                                                           id="val-terms" name="val-terms"
                                                           value="1">
                                                    <span class="css-control-indicator"></span> I
                                                    agree to the terms
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-8 ml-auto">
                                                <button type="submit" class="btn btn-primary">
                                                    Submit
                                                </button>
                                            </div>
                                        </div>
                                    </form>
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

<!-- Select2 -->
<script src="${contextRoot}/static/back/assets/js/lib/select2/select2.full.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate.min.js"></script>
<script src="${contextRoot}/static/back/assets/js/lib/form-validation/jquery.validate-init.js"></script>
<!-- scripit init-->
</body>

</html>
