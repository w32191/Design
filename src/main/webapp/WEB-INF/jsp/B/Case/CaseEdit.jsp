<%--
  Created by IntelliJ IDEA.
  User: kenny
  Date: 2022/4/26
  Time: 5:46 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="insertCaseDialog" hidden title="新增">
    <div class="card">
        <div class="card-title">
        </div>
        <div class="card-body">
            <div class="basic-elements">
                <form>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>標題：</label>
                                <label for="title"></label><input name="title" id="title" type="text"
                                                                  class="form-control"
                                                                  value="">
                            </div>
                            <div class="form-group">
                                <label>名字：</label>
                                <input name="name" id="name" type="text" class="form-control"
                                       value="">
                            </div>
                            <div class="form-group" name="classification">
                                <label>類別：</label>
                                <select class="form-control" id="classification">
                                </select>
                            </div>
                            <div class="form-group" name="location">
                                <label>地區：</label>
                                <select class="form-control" id="location">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Email：</label>
                                <input id="caseEmail" class="form-control"
                                       type="email" placeholder="Email"
                                       name="caseEmail">
                            </div>

                            <div class="form-group">
                                <label>結案時間：</label>
                                <input type="date" name="startDate"
                                       id="expiryDate" class="form-control">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>資訊：</label>
                                <textarea name="message" id="message" class="form-control" rows="3"
                                          placeholder="Text input"></textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
