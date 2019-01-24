<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登陆到咚咚咚书店</title>

    <!-- Bootstrap -->
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
 <link href="css/index/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->

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
     <div class="navbar-text" >
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		       咚咚咚书店
        
      </a>
      
      			<form class="navbar-form navbar-left " method="POST" action="${pageContext.request.contextPath}/search" role="search">
						<div class="form-group">
							<input type="text" name="bookName" class="form-control" required placeholder="您要查找的书名..." />
						</div> <button type="submit" class="btn btn-default">搜索</button>
				</form>
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
			<h3 class="text-center">
				查找到如下结果👇:）
			</h3>
			<div class="row clearfix">
				<div class="col-md-1 column">
				</div>
				<div class="col-md-10 column">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>
									编号
								</th>
								<th>
									书名
								</th>
								<th>
									价格(/元)
								</th>
								<th>
									剩余（件）
								</th>
								<th>
									购买
								</th>
							</tr>
						</thead>
						<tbody>
						
						
						<c:forEach items="${book.rows}" var="book">
							<tr>
								<td>
									${book.id}
								</td>
								<td>
									<a title="点击查看详情" href="${pageContext.request.contextPath}/bookDetail?id=${book.id}"><font coloe="red">${book.bookName}</font></a>
								</td>
								<td>
									${book.price}
								</td>
								<td>
									${book.number}
								</td>
								<td>
								<a href="${pageContext.request.contextPath}/bookDetail?id=${book.id}">购买</a>
									
								</td>
							</tr>
						</c:forEach>
						
							
								
						
							
							
						</tbody>
					</table>
					<p class="text-center"><font color="red">${resultState}</font></p>
				</div>
				<div class="col-md-1 column">
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