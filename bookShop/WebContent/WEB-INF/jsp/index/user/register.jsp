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

  </head>
  <body>
  
<nav class="navbar navbar-default">
  <div class="container-fluid">
<div class="navbar-header">
      <a class="navbar-text" href="${pageContext.request.contextPath}/">
        <img alt="Brand" src="tools/gy.jpg" >
      </a>
    </div>
     <div class="navbar-text" >
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		       咚咚咚书店
       
      </a>
    </div>
        <div class="navbar-right navbar-text" >
	      <a class="navbar-text "  href="${pageContext.request.contextPath}/">
			<font >返回主页</font>
	      </a>
    	</div>

  </div>
</nav>
<br>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-2 column">
				</div>
				<div class="col-md-8 column">
					<h3 class="text-center">
						欢迎加入咚咚书店👇，请继续填写注册信息
					</h3>
					<form role="form" action="${pageContext.request.contextPath}/registerCheck" method="post">
						<div class="form-group" >  
<!-- 						ajax验证是否存在这个用户 -->
							${ result}
							 <label for="exampleInputEmail1">用户名</label><input name="userName" type="text" class="form-control" id="exampleInputEmail1" required/>
						</div>
						<div class="form-group">
							 <label for="exampleInputPassword1">用户密码</label><input name="password" type="password" class="form-control" id="exampleInputPassword1" required/>
						</div>
						<div class="form-group">
							 <label for="phone">手机号码</label><input type="text" name="phone" class="form-control" id="phone" required />
						</div>
						<div class="form-group">
							 <label for="address">用户地址</label><input type="text" name="address" class="form-control" id="address" required/>
						</div>
						
						

						<button type="submit" class="btn btn-default center-block">提交注册😀</button>
					</form>
				</div>
				<div class="col-md-2 column">
				</div>
			</div>
		</div>
	</div>
</div>
<br><br><br><br><br><br>


    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>