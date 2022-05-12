<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- sidebar start -->
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <ul>
                <div class="logo">
                    <a href=""><span>DESIGN & DECOR</span></a>
                </div>

				<li class="label">功能選單</li>

                <li>
                    <a href="/Design/B/Product/" class="sidebar-sub-toggle">
                        <i class="ti-layout-tab"></i> 商品管理
                        <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li>
                            <a href="/Design/B/Product/">
                                <i class="ti-view-list-alt"></i>商品管理
                            </a>
                        </li>
                        <li>
                            <a href="/Design/B/Product/stockManage">
                                <i class="ti-view-list-alt"></i>庫存管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/Design/B/allorder"><i class="ti-layout-tab"></i> 訂單管理</a>
                </li>


				<li><a href="/Design/B/Activity/Calendar"
					class="sidebar-sub-toggle"> <i class="ti-calendar"></i> 活動 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="/Design/B/Activity/Calendar"> <i
								class="ti-view-list-alt"></i>行事曆
						</a></li>
						<li><a href="/Design/B/Activity/findAll"> <i
								class="ti-view-list-alt"></i>管理
						</a></li>
					</ul></li>

				<li><a href="/Design/B/Case"><i class="ti-layout-tab"></i>
						Case管理</a></li>
				<li><a href="/Design/B/Design"><i class="ti-layout-tab"></i>
					Design管理</a></li>

				<li><a href="/Design/B/CommonQuestion"><i
						class="ti-comment-alt"></i> 常見問題管理</a></li>
				<li><a href="/Design/B/Announcement/viewMessages"><i
						class="ti-layout-tab"></i> 公告管理</a></li>
				<c:choose>
					<c:when test="${sessionScope.Baccount.permission > 98}">
					<li><a href="/Design/B/view"><i class="ti-user"></i>
						其他帳號管理</a></li>
					
					</c:when>
				</c:choose>
				<li><a href="/Design/B/memberupdate"><i class="ti-pencil-alt"></i>
						個人資料修改</a></li>

<%--				<li class="label">ＸＸ管理</li>--%>
<%--				<li><a href="/Design/B/" class="sidebar-sub-toggle"> <i--%>
<%--						class="ti-calendar"></i> ＸＸＸＸ <span--%>
<%--						class="sidebar-collapse-icon ti-angle-down"></span></a>--%>
<%--					<ul>--%>
<%--						<li><a href="/Design/B/"> <i class="ti-view-list-alt"></i>ＸＸＸＸＸ--%>
<%--						</a></li>--%>
<%--					</ul></li>--%>
				<li class="label">模板DemoPage</li>
				<li><a href="/Design/B/Demo"><i class="ti-agenda"></i>
						模板DemoPage</a></li>


				<!--                 登出 -->
				<li><a href="/Design/B/dologout"><i class="ti-close"></i> 登出</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- sidebar end -->
<script>
    document.getElementById('dologout').addEventListener('click',
        function () {
            Swal.fire({
                title: '確定要登出嗎?',
                text: "",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '是的'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '登出成功',
                        'success'
                    )
                }
            })
        })
</script>
