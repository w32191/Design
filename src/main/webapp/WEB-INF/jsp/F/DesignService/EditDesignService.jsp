<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DESIGN & DECOR</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--  CSS include page--%>
    <jsp:include page="../IncludePage/staticPage/FontCssPage.jsp"/>
    <link href="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.css"
          rel="stylesheet"/>
    <link href="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.css"
          rel="stylesheet"/>
</head>
<body>
<jsp:include page="../IncludePage/layoutPage/headerPage.jsp"/>

<main>
    <!-- page title area start -->
    <section class="page__title p-relative d-flex align-items-center"
             data-background="${contextRoot}/static/front/assets/img/page-title/page-title-1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="page__title-inner text-center">
                        <h1>編輯設計</h1>
                        <div class="page__title-breadcrumb">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a href="${contextRoot}/F/Activity/index">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"><a href="${contextRoot}/F/Design"> Design</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- page title area end -->

    <!-- Cart Area Strat-->
    <section class="cart-area pt-100 pb-100">
        <div class="container">
            <span hidden id="spanEditId">${Design.id}</span>
            <div class="row">
                <div class="col-lg">
                    <form action="#">
                        <div class="table-content table-responsive">
                            <div class="card-body">
                                <div class="basic-elements">
                                    <form>
                                        <div class="row">
                                            <span hidden id="spanId">${Design.id}</span>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>標題：</label>
                                                    <input id= "editTitle" type="text" class="form-control"
                                                    value="${Design.title}">
                                                </div>
                                                <div class="form-group">
                                                    <label>名字：</label>
                                                    <input id= "editName" type="text" class="form-control"
                                                           value="${Design.name}">
                                                </div>
                                                <div class="form-group">
                                                    <label>風格：</label>
                                                    <select class="form-control" id="editStyleList">
                                                        <%--                                                        <option>1</option>--%>
                                                        <%--                                                        <option>2</option>--%>
                                                        <%--                                                        <option>3</option>--%>
                                                        <%--                                                        <option>4</option>--%>
                                                        <%--                                                        <option>5</option>--%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>地點：</label>
                                                    <select class="form-control" id="editLocation">
                                                        <%--                                                        <option>1</option>--%>
                                                        <%--                                                        <option>2</option>--%>
                                                        <%--                                                        <option>3</option>--%>
                                                        <%--                                                        <option>4</option>--%>
                                                        <%--                                                        <option>5</option>--%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>設計費：</label><br/>
                                                    <a>$</a>
                                                    <input id= "editPrice" type="number" class="form-control"
                                                           value="${Design.price}">
                                                    <a>/坪</a>
                                                </div>
                                                <div class="form-group">
                                                    <label>資訊：</label>
                                                    <textarea id= "editMessage" class="form-control" rows="20"
                                                              placeholder="">${Design.message}</textarea>
                                                </div>
                                                <div class="form-group" id="imgDiv">
                                                    <label>封面照片：</label><br/>
                                                    <input type="file" id="insertFile" class="imgur"
                                                           accept="image/*"
                                                           data-max-size="5000"/>
                                                    <img src="${Design.coverPhoto}" id="editCoverPhoto" width="200"/>
                                                </div>
                                                <div class="form-group" id="imgDiv1">
                                                    <label>內文照片：</label><br/>
                                                    <input type="file" id="insertFile1" class="imgur1"
                                                           accept="image/*"
                                                           data-max-size="5000"/>
                                                    <img src="${Design.photo_1}" id="editPhoto_1" width="200"/>
                                                </div>
                                                <div class="form-group" id="imgDiv2">
                                                    <label>內文照片：</label><br/>
                                                    <input type="file" id="insertFile2" class="imgur2"
                                                           accept="image/*"
                                                           data-max-size="5000"/>
                                                    <img src="${Design.photo_2}" id="editPhoto_2" width="200"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="coupon2">
                                    <button id="editDesignServiceBtn" class="os-btn os-btn-black" style="margin-top: 25px"
                                            name="add_case" type="submit">確定
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Cart Area End-->
</main>

<%-- footer page --%>
<jsp:include page="../IncludePage/layoutPage/footerPage.jsp"/>

<!-- JavaScript -->
<jsp:include page="../IncludePage/staticPage/FontJsPage.jsp"/>
<script src="${contextRoot}/static/back/universal/lib/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
<script src="${contextRoot}/static/back/universal/lib/sweetalert2/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/static/front/universal/DesignService.js"></script>
<script>
    $('#editDesignServiceBtn').mouseover(function () {
        $('#editTitle').val("樸質"),
            $('#editname').val("EEIT140"),
            $('#editStyleList> option:selected').text("工業風格"),
            $('#editLocation> option:selected').text("台南市"),
            $('#editPrice').val(20000),
            $('#editMessage').val(`北京陽光城 溪山悅合院樣板間 360m2<br>
            以和諧自然的材料<br>
            肌理化表現<br>
            由光影強調畫面的純粹<br>
<br>
「不只是安身之所，也滿足人對生活的想像。」<br>
<br>
空間美學以洞穴般的形式呈現<br>
            從天井落下的光影隨時光演繹著<br>
            以綠意寫生至空間當中<br>
            自然感知<br>
            結合大地元素置入其中<br>
            泳池以量體崁卡的視感處理帶入材料的原始樣貌<br>
            以線性燈具結合植物點綴空間<br>
            串連場域和場域之間的關係<br>
            滿足一家人的多樣社交機能<br>
            表達極簡自然而內斂的心理感受<br>
            空間傳遞不同的儀式體驗<br>
            以和諧自然的材料<br>
            肌理化表現<br>
            由光影强調畫面的純粹<br>
            -<br>
「用設計情感凝聚，營造質樸的愜意」<br>
玄關延伸手法，將材質與側櫃體在視覺效果一體成形，錯落的吊燈呼應前後關係，使量體産生虛實變化，轉角處壁面燈帶，利用光影體現漆面，豐富空間氛圍。<br>
臥房墻體以肌理化處理，簡約幾何型態的軟裝搭配，使空間多一層表情和姿態。連結更衣室及睡眠空間，櫃體設計以通透的條紋玻璃結合金屬件，即使空間在光線穿透之下，仍保有隱蔽性。<br>
踏階簍空的形式，金屬隔屏簡約明快，線性光源詮釋了層次感，透過量體的虛實及內崁手法表現櫃體收納，大地色系的主色調，將溫暖舒適的元素表現於場域中。木格栅型式由壁面延伸轉折，上挑空區天花至二層空間，增加暖調空間的視覺連接，深刻體驗空間給予的包覆感，在型構交錯之間，隨著時間演譯光影。<br>`),
            $('#editCoverPhoto').attr('src',"https://i.imgur.com/pzpKzHq.jpg"),
            $('#editPhoto_1').attr('src',"https://i.imgur.com/sW6vnsv.jpg"),
            $('#editPhoto_2').attr('src',"https://i.imgur.com/nLEd8TW.jpg")

    })
</script>
</body>

</html>

