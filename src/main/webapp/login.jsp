<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class="login-bg">
<head>
<title>住院管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="thirdUI/easyui/jquery.min.js"></script>
<script src="thirdUI/bootstrap/js/bootstrap.min.js"></script>
<script src="thirdUI/bootstrap/js/theme.js"></script>

<!-- bootstrap -->
<link href="thirdUI/bootstrap/css/bootstrap/bootstrap.css" rel="stylesheet">
<link href="thirdUI/bootstrap/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet">
<!-- global styles -->
<link rel="stylesheet" type="text/css" href="thirdUI/bootstrap/css/compiled/layout.css">
<link rel="stylesheet" type="text/css" href="thirdUI/bootstrap/css/compiled/elements.css">
<link rel="stylesheet" type="text/css" href="thirdUI/bootstrap/css/compiled/icons.css">
<link rel="stylesheet" type="text/css" href="thirdUI/bootstrap/css/compiled/signin.css" media="screen" />

<!-- libraries -->
<link rel="stylesheet" type="text/css" href="thirdUI/bootstrap/css/lib/font-awesome.css">
<!-- this page specific styles -->
<jsp:include page="/include/easyUI.jsp" />
</head>
<body>
	<!-- background switcher -->
	<div class="bg-switch visible-desktop">
		<div class="bgs">
			<a href="#" data-img="landscape.jpg" class="bg active"> <img src="thirdUI/bootstrap/css/img/bgs/landscape.jpg" />
			</a> <a href="#" data-img="blueish.jpg" class="bg"> <img src="thirdUI/bootstrap/css/img/bgs/blueish.jpg" />
			</a> <a href="#" data-img="7.jpg" class="bg"> <img src="thirdUI/bootstrap/css/img/bgs/7.jpg" />
			</a> <a href="#" data-img="8.jpg" class="bg"> <img src="thirdUI/bootstrap/css/img/bgs/8.jpg" />
			</a> <a href="#" data-img="9.jpg" class="bg"> <img src="thirdUI/bootstrap/css/img/bgs/9.jpg" />
			</a> <a href="#" data-img="10.jpg" class="bg"> <img src="thirdUI/bootstrap/css/img/bgs/10.jpg" />
			</a> <a href="#" data-img="11.jpg" class="bg"> <img src="thirdUI/bootstrap/css/img/bgs/11.jpg" />
			</a>
		</div>
	</div>
	<form id="loginDiv" action="<%=basePath%>login.do" method="post">
		<div class="login-wrapper">
			<a href="index.html"><img class="logo" src="thirdUI/bootstrap/css/img/logo-white.png"> </a>
	
			<div class="box">
				<div class="content-wrap">
					<h6>住院管理系统</h6>
					<input id="account" class="easyui-validatebox textbox" type="text" name="account" style="width: 100%;" 
							value="admin"
							data-options="required:true,missingMessage:'请输入帐号名'" /> 
					<input id="password" class="easyui-validatebox textbox" type="password" name="password" style="width: 100%;"
							value="123"
							data-options="required:true,missingMessage:'请输入密码'"
					/> <a href="#" class="forgot">忘记密码?</a>
					<div class="remember">
						<input id="remember-me" type="checkbox"> <label for="remember-me">记住密码</label>
					</div>
					<a id="login" class="btn-glow primary login" href="javascript:void(0);" onclick="submitForm()">登录</a>
				</div>
			</div>
	
			<div class="no-account">
				<!-- <p>还没账号?</p>
				<a href="signup.html">注册</a> -->
			</div>
		</div>
	</form>

</body>
<script type="text/javascript">
	$(function() {
		//背景切换
		var $btns = $(".bg-switch .bg");
		$btns.click(function(e) {
			e.preventDefault();
			$btns.removeClass("active");
			$(this).addClass("active");
			var bg = $(this).data("img");
			$("html").css("background-image","url('thirdUI/bootstrap/css/img/bgs/" + bg + "')");
		});
		$("#account").focus();
	});
	
	//登陆提交
	function submitForm() {
		if (!$("#account").validatebox("isValid")) {
			$("#account").focus();
		} else if (!$("#password").validatebox("isValid")) {
			$("#password").focus();
		} else {
			//服务器提交
			$("#loginDiv").get(0).submit();
		}
	}
</script>
</html>