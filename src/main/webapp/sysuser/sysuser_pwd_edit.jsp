<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>修改密码</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <jsp:include page="/include/easyUI.jsp"/>
    <link rel="stylesheet" href="${basePath}/style/css/style.css">
</head>
<body>

<div class="div_table" style="border-bottom:0px;">
    <div class="title_table">
        <span>修改密码</span>
    </div>

    <form id="form" method="post">
        <table class="t_table" style="border: 0px;">
            <tr>
                <td style="width:20%;text-align:right;">请输入新密码：</td>
                <td>
                    <input id="password" name="password" type="password" class="easyui-validatebox input-text"
                           style="width:200px;"
                           data-options="required:true,missingMessage:'请输入新密码！'"/><em>*</em>
                </td>

            </tr>
            <tr>
                <td style="text-align:right;">请再次输入密码：</td>
                <td>
                    <input id="repassword" name="repassword" type="password" class="easyui-validatebox input-text"
                           style="width:200px;"
                           data-options="required:true,missingMessage:'请再次输入密码！'"
                           validType="equalTo['#password']" invalidMessage="两次密码必须一致！"/><em>*</em>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                       onclick="javascript:modifyPassword()" style="width:70px;">保存</a>
                    &nbsp;</td>
                <td>
                    &nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                             onclick="javascript:cleanPassword()" style="width:70px;">重置</a>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
<script type="text/javascript">
    $(function () {
        $.extend($.fn.validatebox.defaults.rules, {
            equalTo: {
                validator: function (value, param) {
                    return value == $(param[0]).val();
                },
                message: "两次密码必须一致！"
            }
        });
    });
    //修改密码
    function modifyPassword() {
        $("#form").form("submit", {
            url: "${basePath}/login/modifySysUserPassword.do",
            onSubmit: function () {
                var isValid = $("#form").form("validate");
                return isValid;
            },
            success: function (data) {
                if (data == "true") {
                    $.messager.alert("提示", "修改成功！请重新登录", null, function () {
                        $.ajax({
                            url: "${basePath}/loginOut.do"
                        }).done(function (data) {
                            parent.location.href = "${basePath}/login/login.jsp";
                        });
                    });
                } else {
                    $.messager.alert("提示", "修改失败！");
                }
            }
        });
    }
    //清空
    function cleanPassword() {
        $("#form").form("clear");
    }
</script>
</html>
