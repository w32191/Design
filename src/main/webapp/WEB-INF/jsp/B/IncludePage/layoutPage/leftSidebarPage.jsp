<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!-- sidebar start -->
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <ul>
                <div class="logo">
                    <a href="index.html"><span>Design</span></a>
                </div>

                <li class="label">功能選單</li>
                <li>
                    <a href="/Design/B/Activity/Calendar" class="sidebar-sub-toggle">
                        <i class="ti-calendar"></i> 活動
                        <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li>
                            <a href="/Design/B/Activity/">
                                <i class="ti-view-list-alt"></i>活動管理
                            </a>
                        </li>
                        <li>
                            <a href="/Design/B/Activity/Calendar">
                                <i class="ti-view-list-alt"></i>活動管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="label">訂單管理</li>
                <li>
                    <a href="/Design/B/" class="sidebar-sub-toggle">
                        <i class="ti-calendar"></i> ＸＸＸＸ
                        <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li>
                            <a href="/Design/B/">
                                <i class="ti-view-list-alt"></i>ＸＸＸＸＸ
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/Design/B/CasePage"><i class="ti-layout-tab"></i> Case管理</a>
                </li>
                <li>
                    <a href="/Design/B/Demo"><i class="ti-agenda"></i> 模板DemoPage</a>
                </li>


                <!--                 登出 -->
                <li><a href="dologout"><i class="ti-close"></i> 登出</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- sidebar end -->
