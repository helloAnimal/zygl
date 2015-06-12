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
    <jsp:include page="/include/easyUI.jsp"/>
    <link rel="stylesheet" href="${basePath}/style/css/style.css">
</head>

<body style="background:#f0f9fd;">
<div style="border-right: 1px dotted #d0dee5;height: 100%;">
    <ul id="tree"></ul>
</div>


</body>
<script type="text/javascript">
    //主界面初始化
    $(function () {
        $("#tree").tree({
            url: "${basePath}/login/tree.do",
            lines: true,
            animate: true,
            onClick: function (node) {
                if (node.url) {
                    var rightFrame = $(window.parent.document).find("#rightFrame");
                    rightFrame.attr("src", "${basePath}" + node.url);
                    var topFrame = $(window.parent.frames["topFrame"].document).find("#pathText");
                    var root = $("#tree").tree("getRoot", node.target);
                    var liHtmli = "";
                    <%--liHtmli+="<li><a href=\"javascript:void(0);\" target=\"rightFrame\">"+root.text+"</a></li>"--%>
                    <%--liHtmli+="<li><a href=\"${basePath}"+node.url+"\" target=\"rightFrame\">"+node.text+"</a></li>"--%>
                    liHtmli += "<li>" + root.text + "</li>"
                    liHtmli += "<li>" + node.text + "</li>"
                    topFrame.html(liHtmli);
                }
            },
            onLoadSuccess: function (node, data) {
                var _this = this;
                if (data) {
                    $(data).each(function (index, value) {
                        if (this.state == "closed") {
                            $(_this).tree("expandAll");
                        }
                    });
                }
            }
        });

    });
</script>
</html>
