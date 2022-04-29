<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<div class="shop__sidebar">
    <div class="sidebar__widget mb-55">
        <div class="sidebar__widget-title mb-25">
            <h3>商品分類</h3>
        </div>
        <div class="sidebar__widget-content">
            <div class="categories">
                <div id="accordion">
                    <div class="card">
                        <div class="card-header white-bg" id="accessories">
                            <h5 class="mb-0">
                                <button class="shop-accordion-btn"
                                        data-toggle="collapse"
                                        data-target="#collapseAccessories"
                                        aria-expanded="true"
                                        aria-controls="collapseAccessories">
                                    家俱 Furniture
                                </button>
                            </h5>
                        </div>

                        <div id="collapseAccessories" class="collapse"
                             aria-labelledby="accessories"
                             data-parent="#accordion">
                            <div class="card-body">
                                <div class="categories__list">
                                    <ul>
                                        <li><a href="/Design/F/product/productbycategories?cate=Armchairs">扶手椅 Armchairs</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Lounge_Chair">休閒椅 Lounge Chair</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Side_Chairs">無扶手椅 Side Chairs</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Kids_Stuff">兒童桌椅 Kids Stuff</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Cupboards">櫃 子 Cupboards</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Sofa_Bed">沙 發, 床組 Sofa & Bed</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Bar_Stools">高腳椅 Bar Stools</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Office_Chairs">辦公椅 Office Chairs</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header white-bg" id="cloth">
                            <h5 class="mb-0">
                                <button class="shop-accordion-btn collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapsecloth"
                                        aria-expanded="false"
                                        aria-controls="collapsecloth">
                                    燈飾 Lightning
                                </button>
                            </h5>
                        </div>
                        <div id="collapsecloth" class="collapse"
                             aria-labelledby="cloth" data-parent="#accordion">
                            <div class="card-body">
                                <div class="categories__list">
                                    <ul>
                                        <li><a href="/Design/F/product/productbycategories?cate=Table_Lamps">桌 燈 Table Lamps</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Desk_Lamps">檯 燈 Desk Lamps</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Floor_Lamps">立 燈 Floor Lamps</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Suspensions">吊 燈 Suspensions</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=CW_Lamps">壁, 頂燈 C/W Lamps</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header white-bg" id="men">
                            <h5 class="mb-0">
                                <button class="shop-accordion-btn collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapsemen"
                                        aria-expanded="false"
                                        aria-controls="collapsemen">
                                    居家生活 Living
                                </button>
                            </h5>
                        </div>
                        <div id="collapsemen" class="collapse"
                             aria-labelledby="men" data-parent="#accordion">
                            <div class="card-body">
                                <div class="categories__list">
                                    <ul>
                                        <li><a href="/Design/F/product/productbycategories?cate=Accessories">生活配件 Accessories</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Stationery">書房文具 Stationery</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Electronics">家電音響 Electronics</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Candleholders">燭 台 Candleholders</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Vases">花 器 Vases</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Bathing">衛 浴 Bathing</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Mirror">鏡 子 Mirror</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header white-bg" id="music">
                            <h5 class="mb-0">
                                <button class="shop-accordion-btn collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapsemusic"
                                        aria-expanded="false"
                                        aria-controls="collapsemusic">
                                    風格配件 Accessories
                                </button>
                            </h5>
                        </div>
                        <div id="collapsemusic" class="collapse"
                             aria-labelledby="music" data-parent="#accordion">
                            <div class="card-body">
                                <div class="categories__list">
                                    <ul>
                                        <li><a href="/Design/F/product/productbycategories?cate=Jewellery">珠寶首飾 Jewellery</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Pocket_Items">隨身用品 Pocket Items</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Bottles">隨行器皿 Bottles</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Scarves">圍 巾, 披肩 Scarves</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header white-bg" id="decoration">
                            <h5 class="mb-0">
                                <button class="shop-accordion-btn collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapseDecoration"
                                        aria-expanded="false"
                                        aria-controls="collapseDecoration">
                                    餐飲 Dining
                                </button>
                            </h5>
                        </div>
                        <div id="collapseDecoration" class="collapse"
                             aria-labelledby="decoration"
                             data-parent="#accordion">
                            <div class="card-body">
                                <div class="categories__list">
                                    <ul>
                                        <li><a href="/Design/F/product/productbycategories?cate=Tableware">餐桌器皿 Tableware</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Cutlery">餐具刀叉 Cutlery</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Carafe">水杯水瓶 Carafe</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Thermo_Jug">保溫壺瓶 Thermo Jug</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Teatime">咖 啡, 茶具 Teatime</a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header white-bg" id="chair">
                            <h5 class="mb-0">
                                <button class="shop-accordion-btn collapsed"
                                        data-toggle="collapse"
                                        data-target="#collapsechair"
                                        aria-expanded="false"
                                        aria-controls="collapsechair">
                                    配件耗材 Other
                                </button>
                            </h5>
                        </div>
                        <div id="collapsechair" class="collapse"
                             aria-labelledby="chair" data-parent="#accordion">
                            <div class="card-body">
                                <div class="categories__list">
                                    <ul>
                                        <li><a href="/Design/F/product/productbycategories?cate=Supplies">燈飾, 消耗品 Supplies</a></li>
                                        <li><a href="/Design/F/product/productbycategories?cate=Parts">配件 Parts</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="sidebar__widget mb-50">
        <div class="sidebar__widget-title mb-25">
            <h3>精選品牌</h3>
        </div>
        <div class="sidebar__widget-content">
            <div class="brand">
                <ul>
                    <li><a href="/Design/F/product/productbybrand?brand=4">MENU.</a></li>
                    <li><a href="/Design/F/product/productbybrand?brand=6">Tom Dixon</a></li>
                    <li><a href="/Design/F/product/productbybrand?brand=15">Flos</a></li>
                    <li><a href="/Design/F/product/productbybrand?brand=9">BROKIS</a></li>
                    <li><a href="/Design/F/product/productbybrand?brand=8">B-Line</a></li>
                    <li><a href="/Design/F/product/productbybrand?brand=10">GRORG JESNSEN</a></li>
                    <li><a href="/Design/F/product/productbybrand?brand=12">ClassiCon</a></li>
                    <li><a href="/Design/F/product/productbybrand?brand=3">Rogaska</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>