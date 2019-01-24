<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>咚咚咚书店</title>

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
    
	
<!-- 	<nav class="navbar navbar-default"> -->
<!--   <div class="container-fluid"> -->
<!-- 	<div class="row clearfix"> -->
		<div class="col-md-12 column ">
			<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
			
			
				<div class="navbar-header">
			      <a class="navbar-text" href="${pageContext.request.contextPath}/">
			        <img alt="Brand" src="tools/gy.jpg" >
			      </a>
			    </div>
			    
				<div class="navbar-text">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">咚咚书店</a>
				</div>
				
				<div class="collapse navbar-collapse navbar-text navbar-right" id="bs-example-navbar-collapse-1">
					<ul class="nav n1avbar-nav">
					</ul>
					<form class="navbar-form navbar-left " method="POST" action="${pageContext.request.contextPath}/search" role="search">
						<div class="form-group">
							<input type="text" name="bookName" class="form-control" required placeholder="您要查找的书名..." />
						</div> <button type="submit" class="btn btn-danger">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 
<!-- 							 顶部的登陆状态显示 -->
					<c:if test="${USER_SESSION.userName!=null}" >
				   		    <a>已登录: ${USER_SESSION.userName}  </a>
					</c:if>
					<c:if test="${USER_SESSION.userName==null}" >
				   			<a href="${pageContext.request.contextPath}/login"><font  face="arial" color="red">😥请登陆/注册</font> </a>
					</c:if>
<%-- 						${sessionScope.USER_SESSION} --%>
<%-- 						<%=request.getSession().getAttribute("userName") %> --%>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的咚咚咚<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="${pageContext.request.contextPath}/shoppingCarPage">购物车</a>
								</li>
								<li>
									 <a href="${pageContext.request.contextPath}/myOrders">我的订单</a>    <!-- 显示历史订单这个也要做！ -->
								</li>
								
					<c:if test="${USER_SESSION.userName!=null}" >
				   				<li class="divider">
								</li>
								<li>
									 <a href="${pageContext.request.contextPath}/logout">登出</a>
								</li>
					</c:if>
					<c:if test="${USER_SESSION.userName==null}" >
				   							   				<li class="divider">
								</li>
								<li>
									 <a href="${pageContext.request.contextPath}/login">登陆/注册</a>
								</li>
					</c:if>

							</ul>
						</li>
					</ul>
				</div>
				
			</nav>
		</div>
		</div>
	</div>
<!-- 	</div> -->
	
	
	
	
	<div class="container">
	
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					咚咚书店<small>&nbsp&nbsp你精神粮食的仓库</small>
				</h1>
			</div>
			<div class="row clearfix">
				<div class="col-md-2 column">
					<ul class="nav nav-pills">
					
<!-- 						这个分类也是自动数据库生成把，这样方便一点儿。 ！！！！-->
						<li class="active">
							 <a href="#"> <span class="badge pull-right">42</span> 未分类</a>
						</li>
						<li>
							 <a href="#"> <span class="badge pull-right">16</span> 教育</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10 column">
					<div class="carousel slide" id="carousel-495173">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-495173">
							</li>
							<li data-slide-to="1" data-target="#carousel-495173" class="active">
							</li>
							<li data-slide-to="2" data-target="#carousel-495173">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item">
								<img alt="" src="tools/lunbo1.jpg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
									<a herf="${pageContext.request.contextPath}/login" target="_blank">
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</a>
									</p>
								</div>
							</div>
							
							
							
							<div class="item active">
								<img alt="" src="tools/lunbo2.jpg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="tools/lunbo3.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-495173" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-495173" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					
					
					
					<br><br>
					<div class="row">  <!-- 里面这样子是一节 -->
											
							
					<c:forEach items="${page.rows}" var="book">
						<div class="col-md-4" >
							<div class="thumbnail">
<!-- 							<img alt="300x200" src="tools/default1.jpg" class="img-responsive" style="height:200px;width:200px"/> -->
								<a href="${pageContext.request.contextPath}/bookDetail?id=${book.id}" title="点击查询书籍详情"><img alt="300x200" src="${book.photo}" style="height:225px;width:100%"/></a>
								<div class="caption">
									<h5>
										<font color="red" size="4"><b>《${book.bookName }》</b></font>
									</h5>
									<p>
										<font color="grey">
										<p style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">作者：${book.author }</p>
										</font>
									</p>
									<p>
										${book.price }（/元）
									</p>
									<p>
<!-- 										 <a class="btn btn-primary" href="#">Action</a>  -->
										 <a class="btn btn-primary" href="${pageContext.request.contextPath}/bookDetail?id=${book.id}">购买</a>
									</p>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div>
					<div class="col-md-12 text-right">
		<itheima:page url="${pageContext.request.contextPath }/" />
    </div>
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