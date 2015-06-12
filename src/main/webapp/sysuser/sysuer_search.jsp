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
<div class="div_table">
    <div class="title_table">
        <span>查询条件</span>
    </div>
    <div>
        <table class="t_table">
            <tr>
                <td style="width:10%;text-align:right;">姓名：</td>
                <td><input id="realName" name="realName" class="input-text" style="width:200px;"/></td>
                <td style="width:10%;text-align:right;">登陆账号：</td>
                <td><input id="account" name="account" class="input-text" style="width:200px;"/></td>
                <td style="width:10%;text-align:right;">电话：</td>
                <td><input id="telephone" name="telephone" class="input-text" style="width:200px;"/></td>
            </tr>
            <tr>
                <td colspan="6" style="text-align:center;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
                       onclick="javascript:searchSysUser()" style="width:60px;">查询</a>
                </td>
            </tr>
        </table>
    </div>

    <table id="sysUserDataGrid">
        <thead>
        <th field="realName" data-options="halign:'center',align:'center'">姓名</th>
        <th field="account" data-options="halign:'center',align:'center'">登陆账号</th>
        <th field="organizationId" data-options="halign:'center',align:'center'">所在部门</th>
        <th field="mobilePhone" data-options="halign:'center',align:'center'">科室电话</th>
        <th field="telephone" data-options="halign:'center',align:'center'">手机</th>
        <th field="presentAddress" data-options="halign:'center',align:'center'">目前住址</th>
        <th field="email" data-options="halign:'center',align:'center'">邮件</th>
        <th field="nativePlace" data-options="halign:'center',align:'center'">籍贯</th>
        <th field="emergencyContact" data-options="halign:'center',align:'center'">紧急联系人</th>
        <th field="emergencyPhone" data-options="halign:'center',align:'center'">紧急联系人电话</th>
        </thead>
    </table>
</div>
</body>
<script type="text/javascript">
    //初始化控件
    $(function () {
        $("#sysUserDataGrid").datagrid({
            border: false,
            pagination: true,
            rownumbers: true,
            singleSelect: true,
            toolbar: [
                {
                    text: "添加",
                    iconCls: "icon-add",
                    handler: function () {
                        location.href = "${basePath}/sysuser/sysuser_add.jsp";
                    }
                },
                "-",
                {
                    text: "编辑",
                    iconCls: "icon-edit",
                    handler: sysUser_edit
                },
                "-",
                {
                    text: "删除",
                    iconCls: "icon-remove",
                    handler: sysUser_delete
                }
            ]

        });
        var p = $("#sysUserDataGrid").datagrid("getPager");
        p.pagination({
            onSelectPage: function (pageNumber, pageSize) {//选择页的时候触发
                callAjax(getParams(pageNumber, pageSize));
            }
        });
        //初始化数据
        callAjax(getParams());
    });
    //获取参数值
    function getParams(pageNumber, pageSize) {
        var _params = {};
        _params["account"] = $("#account").val();
        _params["realName"] = $("#realName").val();
        _params["telephone"] = $("#telephone").val();
        _params["pageNumber"] = pageNumber;
        _params["pageSize"] = pageSize;
        return _params;
    }
    //查询用户
    function searchSysUser() {
        callAjax(getParams());
    }

    //调用ajax
    function callAjax(_params) {
        $.ajax({
            url: "${basePath}/login/findSysUserDomainList.do",
            type: "POST",
            data: {
                account: _params.account,
                realName: _params.realName,
                telephone: _params.telephone,
                pageNumber: _params.pageNumber,
                pageSize: _params.pageSize
            }
        }).done(function (data) {
            $("#sysUserDataGrid").datagrid("loadData", data);
        });
    }

    //编辑用户
    function sysUser_edit() {
        //获取选择的数据行的id
        var row = $("#sysUserDataGrid").datagrid("getSelected");
        if (row != null) {
            location.href = "${basePath}/login/findSysUserDomainById.do?id=" + row.id;
        } else {
            $.messager.alert("提示", "请选择一条数据！");
        }
    }
    //删除
    function sysUser_delete() {
        //获取选择的数据行的id
        var row = $("#sysUserDataGrid").datagrid("getSelected");
        if (row != null) {
            $.messager.confirm("提示", "确定删除？", function (r) {
                        if (r) {
                            $.ajax({
                                url: "${basePath}/login/deleteSysUserById.do",
                                type: "POST",
                                data: {
                                    id: row.id
                                }
                            }).done(function (data) {
                                if (data) {
                                    $.messager.alert("提示", "删除成功！", null, function () {
                                        location.href = "${basePath}/sysuser/sysuer_search.jsp";
                                    });
                                } else {
                                    $.messager.show("提示", "删除失败！");
                                }
                            });
                        }
                    }
            );
        } else {
            $.messager.alert("提示", "请选择一条数据！");
        }

    }
</script>
</html>
