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
    <link rel="stylesheet" href="css/index/jquery.spinner.css" />
    

	<!-- 这儿导入那个提交数量的表单放在这儿，然后就是加入购物车了 -->


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
      
      			<form class="navbar-form navbar-left " method="POST" action="${pageContext.request.contextPath}/search" role="search">
						<div class="form-group">
							<input type="text" name="bookName" class="form-control" required placeholder="您要查找的书名..." />
						</div> <button type="submit" class="btn btn-danger">搜索</button>
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
			<div class="row clearfix">
				<div class="col-md-1 column">
				</div>
				<div class="col-md-10 column">
					<div class="row clearfix">
						<div class="col-md-6 column">
							<img alt="140x140" style="width:400px;height:400px"; src="${book.photo}" />
						</div>
						<div class="col-md-6 column">
<!-- 							<h3> -->
<!-- 								h3. 这是一套可视化布局系统. -->
<!-- 							</h3> -->
							<table class="table table-condensed">
										<p style="margin-top: 80px;margin-bottom: 50px;"><font size="6">书名:《${book.bookName}》</font></p>
											<dl>
											   <dt><p style="margin-bottom: 20px;"><font size="4">作者：&nbsp;&nbsp;${book.author}</font></p></dt>
												<dt>
												     <p style="margin-bottom: 20px;font-size: 18px;">图书简介：&nbsp;&nbsp;<font style="margin-left: 40px;color: gray">  ${book.describes }</font></p>
												</dt>
											</dl>
										<p style="margin-top: 30px;font-size: 18px;">书本价格:<font color="red">${book.price}</font>（/元）</p><br><br>
										剩余数量:<font color="red" font-size: 18px;>${book.number}</font> （件）<br><br>
										
										<input id="buyNumber" type="text" class="spinnerExample"/> <br><br>
										<br>
										
										<button class="btn  btn-danger" onclick="buy(${book.id})">立即购买</button>&nbsp;&nbsp;
										<button  class="btn btn-info"  onClick="intoOrder(${book.id})" href="javascript:;">加入购物车</button><br><br>
							</table>
						</div>
					</div>

				</div>
				<div class="col-md-1 column">
				</div>
			</div>
		</div>
	</div>
</div>
<br><br><br><br><br><br>


    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在后面的前边) -->
    <script src="js/index/jquery.min.js"></script>
<!--     <script type="text/javascript" src="js/index/jquery-1.8.0.min.js"></script> -->
<script type="text/javascript" src="common/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/index/jquery.spinner.js"></script>


<script type="text/javascript">
	$('.spinnerExample').spinner({});
</script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/index/bootstrap.min.js"></script>
    
    <!--  直接购买书籍  -->
    <script type="text/javascript">
	function buy(id){
		var bookNumber = $('#buyNumber').val();
		//window.alert(""+bookNumber);
		//window.alert(""+id);
		var userName = $('#loginName').text(); 
		var userid = $('#userid').text(); 
		//var photo = $('#photo').text()
	
		//var book_id=id;
		//var userid = ${USER_SESSION.id} //获取用户id
	     if (userName =="xx"){
	            parent.layer.alert("您还未登陆，2秒后跳转登陆");
                setTimeout(function(){//两秒后跳转
                       window.location.replace("${pageContext.request.contextPath}/login?detailID=${book.id}");
				  },2000);
	     }
	     else if(bookNumber=='0'){
            parent.layer.alert("购买数量必须大于0！请检查购买数量");
		}else if(bookNumber>'${book.number}'){
			parent.layer.alert("购买数量不可以大于书本库存！请检查购买数量");
		}
		else{
				layer.confirm('确认把书名:   ${book.bookName}  <br>数量为：'+bookNumber +'  <br>立即购买吗？', function (index) {
			               $.ajax({
			                   type : "post",
			                   url : "createorder",                                           
			                   data : {
			                       "book_id" : id,
			                       "user_id" : userid,
			                       "book_num" :bookNumber,
			                      /*  "bookPrice" : ${book.price}, */
			                      /*  "photo": "${book.photo}", */
			                       "book_name": "${book.bookName}",
			                      /*  "author": "${book.author}",
			                       "publisher":  "${book.publisher}" */
			                    },
			                    success : function(data) {
			                        if (data == "ok") {
			                            parent.layer.alert("购买完成！");
			                            
			                            setTimeout(function(){//两秒后跳转
										     //alert("恭喜你注册成功，两秒后跳转。"); 
										     //location.href = "index.php";//PC网页式跳转
			                            	window.location.reload();
										  },2000);
			                        } else {
			                        	
			                            parent.layer.alert("购买失败,您可能还未登陆！2秒后跳转")  //成功插入购物车后
					                    
			                            setTimeout(function(){//两秒后跳转
										     //alert("恭喜你注册成功，两秒后跳转。"); 
										     //location.href = "index.php";//PC网页式跳转
					                            window.location.replace("${pageContext.request.contextPath}/login");
										  },2000);
			                            
			                            parent.layer.alert("购买失败！");
			                        }                                              
			                    }                            
			                });
			            });
		}
	} 
</script>
<!-- 加入购物车的ajax -->
<script type="text/javascript">

	/* 添加购物车 */
function intoOrder(id){
	var bookNumber = $('#buyNumber').val();
	var bookName = $('#postBookName').val();
	var bookPrice = $('#postBookPrice').val();
	var bookPhoto = $('#postBookPhoto').val();
	//window.alert(""+bookNumber);
	//window.alert(""+id);
	var userName = $('#loginName').text(); 
     if (userName=="xx"){
            parent.layer.alert("您还未登陆，2秒后跳转登陆");
            setTimeout(function(){//两秒后跳转
                   window.location.replace("${pageContext.request.contextPath}/login?detailID=${book.id}");
			  },2000);
     }
     else if(bookNumber=='0'){
        parent.layer.alert("购买数量必须大于0！请检查购买数量");
	}else if(bookNumber>'${book.number}'){
		parent.layer.alert("购买数量不可以大于书本库存！请检查购买数量");
	}
	else{
			layer.confirm('确认把书名:   ${book.bookName}  <br>数量为：'+bookNumber +'  <br>加入购物车吗？', function (index) {
		               $.ajax({
		                   type : "post",
		                   url : "intoOrder",                                           
		                   data : {
		                       "bookId" : id,
		                       "userName" : userName,
		                       "bookName":"${book.bookName}",
		                       "bookPrice": ${book.price},
		                       "bookNumber" :bookNumber,
		                       "bookPhoto":"${book.photo}",
		                    },
		                    success : function(data) {
		                        if (data == "ok") {
		                            parent.layer.alert("已加入购物车");
		                            
		                            setTimeout(function(){//两秒后跳转
		                            	window.location.reload();
									  },2000);
		                        } else {
		                        	
		                            parent.layer.alert("加入购物车失败,您可能还未登陆！2秒后跳转")  //成功插入购物车后
				                    
		                            setTimeout(function(){//两秒后跳转
				                            window.location.replace("${pageContext.request.contextPath}/login");
									  },2000);
		                            
		                            parent.layer.alert("加入购物车失败！");
		                        }                                              
		                    }                            
		                });
		            });
	}
} 
</script>
       						<li style="display:none;">
							 
<!-- 							 顶部的登陆状态显示   这个隐藏于放在了最后面，用来放一些待会需要提取的东西 -->
					<c:if test="${USER_SESSION.userName!=null}" >
				   		    <p  id="loginName">${USER_SESSION.userName}</p>
				   			<p  id="userid">${USER_SESSION.id}</p>
				   		    
				   		    
					</c:if>
					<c:if test="${USER_SESSION.userName==null}" >
				   			<p id="loginName" href="${pageContext.request.contextPath}/login">xx</p>
					</c:if>
						<p id="postBookName">${book.bookName}</p>
						<p id="postBookPrice">${book.price}</p>
						<p id="postBookPhoto">${book.photo}</p>

						</li>
    
  </body>
</html>