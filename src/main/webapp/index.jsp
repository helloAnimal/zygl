<%@page import="com.zygl.domain.login.SysUserDomain"%>
<%@page import="com.zygl.common.util.CurrentInfoUtils"%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	SysUserDomain sysUserDomain =CurrentInfoUtils.getCurrentUser();
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>住院管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 引用easyUI框架 -->
<jsp:include page="/include/easyUI.jsp" />
<!-- 系统js、css -->
<jsp:include page="/include/zygl.jsp" />
</head>

<body id="layout" class="easyui-layout">
	<div data-options="region:'north',border:false">
		<div class="panel-header" style="border: 0;height:40px;">
			<a href="javascript:void(0)" id="mb" class="easyui-menubutton"     
	        	data-options="menu:'#mm',iconCls:'icon-man'" style="float: right;">
	        	<%=sysUserDomain.getRealName() %>
	        </a>   
			<div id="mm" style="width:150px;">   
			    <div data-options="iconCls:'icon-tip'">修改密码</div>   
			    <div data-options="iconCls:'icon-redo'">退出</div>   
			</div> 
		</div>
	</div>
	<div data-options="region:'south',split:true" style="height:5%;text-align: center;">©2009-2015. 住院管理系统.</div>
	<div data-options="region:'west',split:true" title="导航菜单" style="width:16%;">
		<ul id="tree"></ul>
	</div>
	<div data-options="region:'center'" style="overflow:hidden;">
		<div id="tabs">
			<div title="欢迎首页" style="padding:0 10px;display:block;">
				<p>
					欢迎【<%=sysUserDomain.getRealName() %>】登陆住院管理系统！
				</p>
			</div>
		</div>
	</div>
	<div id="loginDiv">
		<a id="loginOut" href="javaScript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-redo'" onclick="loginOut();" >退出系统</a>
	</div>
	
</body>
<script type="text/javascript">
	//主界面初始化
	$(function() {
		$("#tree").tree({
			url : "login/tree.do",
			lines : true,
			animate : true,
			onClick : function(node) {
				if (node.url) {
					if ($("#tabs").tabs("exists", node.text)) {
						$("#tabs").tabs("select", node.text);
						var tab = $("#tabs").tabs("getSelected");
						tab.panel("refresh", node.url);
					} else {
						$("#tabs").tabs("add", {
							title : node.text,
							closable : true,
							href : node.url
						});
					}
				}
			},
			onLoadSuccess : function(node, data) {
				var _this = this;
				if (data) {
					$(data).each(function(index, value) {
						if (this.state == "closed") {
							$(_this).tree("expandAll");
						}
					});
				}
			}
		});
		//tabs
		$("#tabs").tabs({
			fit : true,
			border : false,
			tools : "#loginDiv",
			toolPosition:"right"
		});
	});
	//退出
	function loginOut() {
		$.ajax({
			url : "loginOut.do"
		}).done(function(data){
			location.href = "login.jsp";
		});		
	}
</script>
</html>
