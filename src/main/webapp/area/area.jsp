<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>省市区联动</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <jsp:include page="/include/easyUI.jsp"/>
    <link rel="stylesheet" href="${basePath}/style/css/style.css">
</head>

<body>
<select id="province" name="province" class="easyui-combobox" style="width:120px;">
</select>
<select id="city" name="city" class="easyui-combobox" style="width:120px;">
</select>
<select id="area" name="area" class="easyui-combobox" style="width:120px;">
</select>

<div>
    <a class="easyui-linkbutton" name="" href="javascript:void(0);" onclick="getSelectVal()">获取值</a>
</div>
</body>
<script type="text/javascript">
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
        selectArea(0);
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
                        data: data,
                        valueField: "cityId",
                        textField: "city",
                        verticalAlign: "top",
                        onSelect: function (record) {
                            selectArea(record.cityId);
                        },
                        onLoadSuccess: function () {
                            $(this).combobox("setValue", null);
                        }
                    });
                });
    }
    //选择区
    function selectArea(cityId) {
        $.ajax({
            url: "${basePath}/area/getAreaDomainsByCityId.do",
            type: "post",
            data: {
                cityId: cityId
            }
        }).done(function (data) {
                    $("#area").combobox({
                        panelHeight: "atuo",
                        data: data,
                        valueField: "areaId",
                        textField: "area",
                        onLoadSuccess: function () {
                            $(this).combobox("setValue", null);
                        }
                    });
                });
    }
    function getSelectVal() {
        var val = $("#province").combobox("getValue");
        var val1 = $("#city").combobox("getValue");
        var val2 = $("#area").combobox("getValue");
        console.log(val + ":" + val1 + ":" + val2);
    }
</script>
</html>
