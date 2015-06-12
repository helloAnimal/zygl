<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>
<%@page import="com.zygl.common.util.CurrentInfoUtils" %>
<%@page import="com.zygl.domain.login.SysUserDomain" %>
<%
    SysUserDomain sysUserDomain = CurrentInfoUtils.getCurrentUser();
%>
<!DOCTYPE html>
<html>
<head>
    <title>主页</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <jsp:include page="/include/easyUI.jsp"/>
    <link rel="stylesheet" href="${basePath}/style/css/style.css">
</head>

<body>

<div class="mainindex">
    <div class="welinfo">
        <span><img src="${basePath}/style/images/sun.png" alt="天气"/></span> <b>【<%=sysUserDomain.getRealName() %>】</b>
        <label id="dayType"></label>，欢迎使用住院管理系统 <a href="#">帐号设置</a>
    </div>
    <div class="welinfo">
        <span><img src="${basePath}/style/images/time.png" alt="时间"/></span> <i>您上次登录的时间：2013-10-09 15:22</i> （不是您登录的？<a
            href="#">请点这里</a>）
    </div>
    <div class="xline"></div>
    <ul class="iconlist">
        <li><img src="${basePath}/style/images/ico01.png"/>

            <p>
                <a href="#">管理设置</a>
            </p></li>
        <li><img src="${basePath}/style/images/ico02.png"/>

            <p>
                <a href="#">发布文章</a>
            </p></li>
        <li><img src="${basePath}/style/images/ico03.png"/>

            <p>
                <a href="#">数据统计</a>
            </p></li>
        <li><img src="${basePath}/style/images/ico04.png"/>

            <p>
                <a href="#">文件上传</a>
            </p></li>
        <li><img src="${basePath}/style/images/ico05.png"/>

            <p>
                <a href="#">目录管理</a>
            </p></li>
        <li><img src="${basePath}/style/images/ico06.png"/>

            <p>
                <a href="#">查询</a>
            </p></li>
    </ul>
</div>
</body>
<script type="text/javascript">
    function getText() {
        var _date = new Date();
        var _time = _date.getHours();
        var _text = '';
        if (_time >= 6 && _time < 9)
            _text = '早上好';
        else if (_time >= 9 && _time < 11)
            _text = '上午好';
        else if (_time >= 11 && _time < 13)
            _text = '中午好'
        else if (_time >= 13 && _time < 17)
            _text = '下午好';
        else
            _text = '晚上好';
        return _text;
    }
    $(function () {
        $("#dayType").text(getText());
    });
</script>
</html>
