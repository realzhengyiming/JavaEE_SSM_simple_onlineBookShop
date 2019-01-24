<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登陆到咚咚咚书店</title>

    <!-- Bootstrap -->
    <link href="css/index/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style>
    .bg {
       background:url(images/index/login.jpg) no-repeat center fixed;
       background-size:contain;
	}
    
    </style>
<!--     验证输入不为空的js代码
<!-- <script src ="${pageContext.request.contextPath}/js/jsquery.min.js"> -->
<!-- <script> -->
<!-- functio check(){ -->
<!--  var userName = $("#userName").val(); -->
<!--  var password = $("#password").val(); -->
<!--  if(userName=="" || password==""){ -->
<!--  $("userName").text("账号密码不能为空"); //并且设置变红色嘛？ -->
<!-- </script> -->
  </head>
  <body>
  
<nav class="navbar navbar-default">
  <div class="container-fluid">
<div class="navbar-header">
      <a class="navbar-text" href="${pageContext.request.contextPath}/">
        <img alt="Brand" src="tools/gy.jpg" >
      </a>
    </div>
     <div class="navbar-text " >
      <a class="navbar-text " href="${pageContext.request.contextPath}/">
		       咚咚咚书店
      </a>
    </div>
    
    <div class="navbar-right navbar-text" >
	      <a class="navbar-text "  href="${pageContext.request.contextPath}/register">
			<font >注册</font>
	      </a>
    </div>

  </div>
</nav>
<br>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<img alt="140x140" src="images/index/login.jpg" class="img-rounded img-responsive"  />
		</div>
		<div class="col-md-6 column">
		<div class="row clearfix">
				<div class="col-md-2 column">
				</div>
				<div class="col-md-8 column">
					<form role="form" method="POST" action="${pageContext.request.contextPath}/loginCheck">
						
						<h2 class="text-center"><b>欢迎登陆咚咚咚书店</b></h2><br>
						
							<div class="form-group">
								 <label for="exampleInputEmail1">用户名</label><input type="text" class="form-control" id="exampleInputEmail1" name="userName"/>
							</div>
							<div class="form-group">
								 <label for="exampleInputPassword1">密码</label><input type="password" class="form-control" id="exampleInputPassword1" name="password"/>
							</div>
				<button type="submit" class="btn btn-default">登陆</button>
				<button type="reset" class="btn btn-default">清空</button>
						</form>
				</div>
				<div class="col-md-2 column">
				</div>
			</div>
			
		</div>
	</div>
</div>



    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/index/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/index/bootstrap.min.js"></script>
  </body>
</html>