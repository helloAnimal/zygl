<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>欢迎登录住院管理系统</title>
    <link rel="stylesheet" type="text/css" href="${basePath}/style/css/style.css">
    <script type="text/javascript" src="${basePath}/style/js/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/style/js/cloud.js"></script>
    <style type="text/css">
        dl, dt, dd, span {
            margin: 0;
            padding: 0;
            display: block;
        }
    </style>
</head>
<body style="background-color:#1c77ac; background-image:url(${basePath}/style/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>
<div class="logintop">
    <span>欢迎登录住院管理系统</span>
    <ul>
        <li><a href="javascript:void(0);">回首页</a></li>
        <li><a href="javascript:void(0);">帮助</a></li>
        <li><a href="javascript:void(0);">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <span class="systemlogo"></span>

    <form id="loginDiv" action="${basePath}/login.do" method="post">
        <div class="loginbox">
            <ul>
                <li><input id="account" name="account" type="text" class="loginuser" value="admin"/></li>
                <li><input id="password" name="password" type="password" class="loginpwd" value="123"/></li>
                <li><input id="login" name="login" type="button" class="loginbtn" value="登录" onclick="submitForm();"/>
                    <label><input type="checkbox" value="" checked="checked"/>记住密码</label>
                    <label><a href="javascript:void(0);">忘记密码？</a></label></li>
            </ul>
        </div>
    </form>
</div>
<div class="loginbm">住院管理系统 @2015</div>
</body>
<script type="text/javascript">
    $(function () {
        $(".loginbox").css({
            "position": "absolute",
            "left": ($(window).width() - 692) / 2
        });
        $(window).resize(function () {
            $(".loginbox").css({
                "position": "absolute",
                "left": ($(window).width() - 692) / 2
            });
        });
        var msg = "${message}";
        if (msg != "") {
            alert(msg);
        }
    });
    //登陆提交
    function submitForm() {
        if (validate()) {
            //服务器提交
            $("#loginDiv").get(0).submit();
        }
    }
    function validate() {
        if ($("#account").val() == "") {
            alert("请输入账号名！");
            $("#account").focus();
            return false;
        }
        if ($("#password").val() == "") {
            alert("请输入密码！");
            $("#password").focus();
            return false;
        }
        return true;
    }

</script>
</html>
