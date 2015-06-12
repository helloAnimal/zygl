<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>个人信息</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    <!-- 引用easyUI框架 -->
    <jsp:include page="/include/easyUI.jsp"/>
</head>

<body>
<table class="easyui-datagrid" title="个人信息修改" data-options="singleSelect:true,collapsible:true,showHeader:false">
    <thead>
    <tr>
        <th data-options="field:'itemid'">Item ID</th>
        <th data-options="field:'productid'">Product</th>
        <th data-options="field:'listprice'">List Price</th>
        <th data-options="field:'unitcost'">Unit Cost</th>
    </tr>
    </thead>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
    </tr>
</table>
</body>
<script type="text/javascript">
    /* $(function(){
     $.ajax({
     url:"login/findSysUserModelById.do",
     success:function(data){

     }
     });
     }); */
</script>
</html>
