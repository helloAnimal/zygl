<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>测试easyUI框架</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 引用easyUI框架 -->
<jsp:include page="include/easyUI.jsp" />
<script type="text/javascript">
	$(function() {
		$("#test").val("测试easyUI框架");
	});
</script>
</head>

<body>
	<input id="test" name="test" value="" lang="100" />
	<br>
</body>
</html>
