<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>无标题栏</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${basePath}/style/css/style.css">
    <script type="text/javascript" src="${basePath}/style/js/jquery.min.js"></script>
</head>

<body style="background:#f0f9fd;">
<div class="lefttop"><span></span>导航菜单</div>
<dl class="leftmenu">
    <dd>
        <div class="title">
            <span><img src="${basePath}/style/images/leftico01.png"/></span>管理信息
        </div>
        <ul class="menuson">
            <li class="active"><cite></cite><a href="${basePath}/login/center.jsp" target="rightFrame">首页</a><i></i>
            </li>
            <li><cite></cite><a href="${basePath}/sysuser/sysuser_pwd_edit.jsp" target="rightFrame">修改密码</a><i></i></li>
            <li><cite></cite><a href="${basePath}/sysuser/sysuer_search.jsp" target="rightFrame">用户管理</a><i></i></li>
            <li><cite></cite><a href="${basePath}/area/area.jsp" target="rightFrame">省市区</a><i></i></li>
            <!-- <li><cite></cite><a href="right.html" target="rightFrame">数据列表</a><i></i></li>
            <li><cite></cite><a href="imgtable.html" target="rightFrame">图片数据表</a><i></i></li>
            <li><cite></cite><a href="form.html" target="rightFrame">添加编辑</a><i></i></li>
            <li><cite></cite><a href="imglist.html" target="rightFrame">图片列表</a><i></i></li>
            <li><cite></cite><a href="imglist1.html" target="rightFrame">自定义</a><i></i></li>
            <li><cite></cite><a href="tools.html" target="rightFrame">常用工具</a><i></i></li>
            <li><cite></cite><a href="filelist.html" target="rightFrame">信息管理</a><i></i></li> -->
            <li><cite></cite><a href="login/tab.html" target="rightFrame">Tab页</a><i></i></li>
            <li><cite></cite><a href="login/error.jsp" target="rightFrame">404页面</a><i></i></li>
        </ul>
    </dd>


    <dd>
        <div class="title">
            <span><img src="${basePath}/style/images/leftico02.png"/></span>其他设置
        </div>
        <ul class="menuson">
            <li><cite></cite><a href="#">编辑内容</a><i></i></li>
            <li><cite></cite><a href="#">发布信息</a><i></i></li>
            <li><cite></cite><a href="#">档案列表显示</a><i></i></li>
        </ul>
    </dd>


    <dd>
        <div class="title"><span><img src="${basePath}/style/images/leftico03.png"/></span>编辑器</div>
        <ul class="menuson">
            <li><cite></cite><a href="#">自定义</a><i></i></li>
            <li><cite></cite><a href="#">常用资料</a><i></i></li>
            <li><cite></cite><a href="#">信息列表</a><i></i></li>
            <li><cite></cite><a href="#">其他</a><i></i></li>
        </ul>
    </dd>


    <dd>
        <div class="title"><span><img src="${basePath}/style/images/leftico04.png"/></span>日期管理</div>
        <ul class="menuson">
            <li><cite></cite><a href="#">自定义</a><i></i></li>
            <li><cite></cite><a href="#">常用资料</a><i></i></li>
            <li><cite></cite><a href="#">信息列表</a><i></i></li>
            <li><cite></cite><a href="#">其他</a><i></i></li>
        </ul>

    </dd>

</dl>

</body>
<script type="text/javascript">
    $(function () {
        //导航切换
        $(".menuson li").click(function () {
            $(".menuson li.active").removeClass("active")
            $(this).addClass("active");
        });

        $(".title").click(function () {
            var $ul = $(this).next("ul");
            $("dd").find("ul").slideUp();
            if ($ul.is(":visible")) {
                $(this).next("ul").slideUp();
            } else {
                $(this).next("ul").slideDown();
            }
        });
    })
</script>
</html>
