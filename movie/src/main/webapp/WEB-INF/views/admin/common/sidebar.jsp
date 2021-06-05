<%--
  Created by IntelliJ IDEA.
  User: Alishiz
  Date: 2021/5/4/0004
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index">
                <a href="management/index">
                    <i class="fa fa-dashboard"></i>
                    <span>首页</span>
                </a>
            </li>
            <li id="user-info">
                <a href="management/userInfo">
                    <i class="fa fa-users"></i>
                    <span>用户信息管理</span>
                </a>
            </li>
            <li id="movie-info">
                <a href="management/movieInfo">
                    <i class="fa  fa-film"></i> <span>电影信息管理</span>
                </a>
            </li>

            <li id="schedule-info">
                <a href="management/scheduleInfo">
                    <i class="fa fa-building-o "></i> <span>电影场次管理</span>
                </a>
            </li>
            <!--<li id="city-info">
                <a href="management/cityInfo">
                    <i class="fa fa-building-o "></i> <span>城市信息管理</span>
                </a>
            </li>
            <li id="cinema-info">
                <a href="management/cinemaInfo">
                    <i class="fa fa-institution "></i> <span>影院信息管理</span>
                </a>
            </li>-->

            <li id="order-info">
                <a href="management/orderInfo">
                    <i class="fa fa-cart-arrow-down"></i> <span>订单信息管理</span>
                </a>
            </li>
            <li id="movie-appraise">
                <a href="management/movieAppraise">
                    <i class="fa fa-keyboard-o"></i> <span>电影评价管理</span>
                </a>
            </li>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!--<li id="admin-info">
<a href="management/adminInfo">
<i class="fa  fa-user"></i>
<span>管理员信息管理</span>

</a>
</li>-->
<!--<li id="movie-type-info">
<a href="management/movieTypeInfo">
<i class="fa fa-video-camera"></i> <span>电影类型管理</span>
</a>
</li>-->