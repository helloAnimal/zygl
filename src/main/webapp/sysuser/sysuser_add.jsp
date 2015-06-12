<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>增加用户</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <jsp:include page="/include/easyUI.jsp"/>
    <link rel="stylesheet" href="${basePath}/style/css/style.css">
</head>

<body>

<form id="form_add" method="post">
    <div class="div_table" style="border-bottom:0px;">
        <div class="title_table">
            <span>添加用户</span>
        </div>
        <table class="t_table" style="width:100%;">
            <tr>
                <td style="text-align:right;width:10%;">登陆账号：</td>
                <td style="width:25%;"><input id="account" name="account" type="text"
                                              class="easyui-validatebox input-text"
                                              value="" style="width:200px;"></td>
                <td style="text-align:right;width:10%;">姓名：</td>
                <td>
                    <input id="realName" name="realName" type="text" class="easyui-validatebox input-text"
                           data-options="required:true,missingMessage:'请输入姓名！'"
                           value="" style="width:200px;">
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">所在部门：</td>
                <td><input id="organizationId" name="organizationId" type="text" class="easyui-numberbox"
                           data-options="validType:['length[1,11]']"
                           value=""></td>
                <td style="text-align:right;">科室电话：</td>
                <td><input id="mobilePhone" name="mobilePhone" type="text" class="easyui-numberbox"
                           data-options="validType:['length[1,11]']"
                           value=""></td>
            </tr>
            <tr>
                <td style="text-align:right;">手机：</td>
                <td><input id="telephone" name="telephone" type="text" class="easyui-numberbox"
                           data-options="validType:['length[1,11]']"
                           value=""></td>
                <td style="text-align:right;">邮箱：</td>
                <td><input id="email" name="email" type="text" class="easyui-validatebox input-text"
                           data-options="validType:['email']"
                           value="" style="width:200px;"></td>
            </tr>
            <tr>
                <td style="text-align:right;">省市：</td>
                <td colspan="3">
                    <select id="province" name="province" class="easyui-combobox" style="width:110px;">
                    </select>
                    <select id="city" name="city" class="easyui-combobox" style="width:110px;">
                    </select>
                </td>

            </tr>
            <tr>
                <td style="text-align:right;">籍贯：</td>
                <td colspan="3">
                    <input id="nativePlace" name="nativePlace" type="text" class="easyui-validatebox input-text"
                           data-options=""
                           value="" style="width:50%;">
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">目前住址：</td>
                <td colspan="3">
                    <input id="presentAddress" name="presentAddress" type="text" class="easyui-validatebox input-text"
                           data-options=""
                           value="" style="width:50%;">
                </td>

            </tr>
            <tr>
                <td style="text-align:right;">紧急联系人：</td>
                <td>
                    <input id="emergencyContact" name="emergencyContact" type="text"
                           class="easyui-validatebox input-text"
                           data-options=""
                           value="" style="width:200px;">
                </td>
                <td style="text-align:right;">紧急联系电话：</td>
                <td>
                    <input id="emergencyPhone" name="emergencyPhone" type="text" class="easyui-numberbox"
                           data-options="validType:['length[1,11]']"
                           value="">
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">邮政编码(籍贯)：</td>
                <td colspan="3">
                    <input id="postalcode" name="postalcode" type="text" class="easyui-numberbox"
                           data-options="validType:['length[1,6]']"
                           value="">
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:right;border-right:0px;">
                    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                       onclick="javascript:addSysUser()">保存</a>
                    &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                                   onclick="javascript:cleanSysUser()">重置</a>
                    &nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back"
                                   onclick="location.href='javascript:history.go(-1)'">返回</a>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</form>
</body>
<script type="text/javascript">
    $(function () {
        //判断账号名是否重复
        $("#account").validatebox({
            required: true,
            missingMessage: "请输入登录账户！",
            validType: "remote['${basePath}/login/getByAccount.do','account']",
            invalidMessage: "账号名已存在,请重新输入！"
        });
    });
    function addSysUser() {
        if ($("#form_add").form("validate")) {
            $.messager.progress();	// 显示进度条
            $.messager.confirm("提示", "确认提交?", function (r) {
                if (r) {
                    $("#form_add").form("submit", {
                        url: "${basePath}/login/addSysUser.do",
                        success: function (data) {
                            if (data == "true") {
                                $.messager.alert("提示", "保存成功！", null, function () {
                                    $.messager.progress("close");
                                    location.href = "javascript:history.go(-1)";
                                })
                            } else {
                                $.messager.alert("提示", "保存失败！", null, function () {
                                    $.messager.progress("close");
                                })
                            }
                        }
                    });
                } else {
                    $.messager.progress("close");
                }
            });
        }
    }
    function cleanSysUser() {
        $("#form_add").form("reset");
    }

    $(function () {
        $(".easyui-combobox").combobox({
            editable: false
        });
        $.ajax({
            url: "${basePath}/area/getProvinceDomains.do",
            type: "post"
        }).done(function (data) {
            $("#province").combobox({
                data: data,
                editable: false,
                valueField: "provinceId",
                textField: "province",
                onSelect: function (record) {
                    selectCity(record.provinceId);
                },
                onLoadSuccess: function () {
                    $(this).combobox("setValue", null);
                }
            });
        });
        selectCity(0);
    });
    //选择市
    function selectCity(provinceId) {
        $.ajax({
            url: "${basePath}/area/getCityDomainByProvinceId.do",
            type: "post",
            data: {
                provinceId: provinceId
            }
        }).done(function (data) {
            $("#city").combobox({
                panelHeight: "atuo",
                editable: false,
                data: data,
                valueField: "cityId",
                textField: "city",
                verticalAlign: "top",
                onSelect: function (record) {

                },
                onLoadSuccess: function () {
                    $(this).combobox("setValue", null);
                }
            });
        });
    }

</script>
</html>
