<%@page import="com.zygl.domain.login.SysUserDomain" %>
<%@page import="com.zygl.common.util.CurrentInfoUtils" %>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>
<%
    SysUserDomain sysUserDomain = CurrentInfoUtils.getCurrentUser();
%>
<!DOCTYPE html>
<html>
<head>
    <title>顶部</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <jsp:include page="/include/easyUI.jsp"/>
    <link rel="stylesheet" href="${basePath}/style/css/style.css">
</head>
<body>
<div class="header">
    <div class="topleft">
        <a href="javascript:void(0);" target="_parent"><img src="${basePath}/style/images/logo.png" title="系统首页"/></a>
    </div>
    <div class="topright">
        <ul>
            <li><span><img src="${basePath}/style/images/help.png" title="帮助" class="helpimg"/></span><a
                    href="javascript:void(0);">帮助</a></li>
            <li><a href="javascript:void(0);">关于</a></li>
            <li><a href="javascript:void(0);" target="_parent" onclick="loginOut()">退出</a></li>
        </ul>
        <div class="user">
            <span><%=sysUserDomain.getRealName() %></span> <i>消息</i> <b>5</b>
        </div>
    </div>

</div>
<div class="lefttop" style="float: left;width: 187px;"><span></span>导航菜单</div>
<div class="place">
    <span>位置：</span>
    <ul class="placeul" id="pathText">
        <li>系统管理</li>
        <li>首页</li>
    </ul>
</div>
</body>
<script type="text/javascript">
    //退出
    function loginOut() {
        $.ajax({
            url: "${basePath}/loginOut.do"
        }).done(function (data) {
            parent.location.href = "${basePath}/login/login.jsp";
        });
    }
</script>
</html>
