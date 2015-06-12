<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/include/path.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>住院管理系统首页</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<frameset rows="128,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="${basePath}/login/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"
           title="topFrame"/>
    <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
        <frame src="${basePath}/login/left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame"
               title="leftFrame"/>
        <frame src="${basePath}/login/center.jsp" name="rightFrame" id="rightFrame" title="rightFrame"/>
    </frameset>
</frameset>
<body>
</body>
</noframes>
</html>
