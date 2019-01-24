<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登陆到咚咚咚书店</title>

    <!-- Bootstrap -->
  <!--   <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/index/jquery.spinner.css" />
 <link href="css/index/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
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

<p>&nbsp;</p>

<div class="container-fluid">
<div class="row-fluid">
<div class="span12">
<ul class="breadcrumb">
	<li><a href="${pageContext.request.contextPath}/">咚咚书店</a></li>
	<li><a href="#">我的订单</a> <span class="divider">/</span></li>
</ul>

<h3 class="text-center text-success">历史订单列表</h3>

<table class="table ">
	<thead>
		<tr>
			<th style="width: 70px;">#</th>
			
			<th style="width: 300px;">购书概况</th>
			<th style="width: 50px;">数量</th>
			<th style="width: 150px;">购买价格</th>
			
			<th style="width: 150px;">购买时间</th>
			<th style="width: 200px; white-space: nowrap;">操作</th>
		</tr>
	</thead>
	<tbody id="tbody">
	
	<c:forEach items="${page.rows}" var="order">
		<tr>		
			<td><input class="ck" type="checkbox" /></td>
	
			<td>
			     书名：${order.book_name}<br><br>
			
			</td>
			<td  id="num" >${order.book_num}
			&nbsp;</td>
			<td  id="singPrice">￥<span>${order.price}</span>
			
			</td>
			
			<td>${order.time}</td>
			<td>
			<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${order.id})">删除</a>
			&nbsp;</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<itheima:page url="${pageContext.request.contextPath }/myOrders" />
</div>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/index/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 --><!-- 增加减少数量按钮 -->
<script type="text/javascript" src="common/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/index/jquery.spinner.js"></script>
<script type="text/javascript">
	$('.spinnerExample').spinner({});
</script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/index/bootstrap.min.js"></script>
    
<!-- 加入购物车的ajax -->
<script type="text/javascript">

var listObj = getAllData();
var table = document.getElementById("table")
var box = document.getElementById("box")
var tbody = document.getElementById("tbody");
var totalPrice = document.getElementById("totalPrice");
var allCheck = document.getElementById("allCheck");



	if(listObj.length == 0) { //购物车为空
	    box.className = "box";
	    table.className = "hide";
	} else {
	    box.className = "box hide";
	    table.className = "";
	    for(var i = 0, len = listObj.length; i < len; i++) {
	        var tr = document.createElement("tr");
	        tr.setAttribute("pid", listObj[i].pid);
	            //{"pid":值,"pImg":值,"pName":值,"pDesc":值,"price":值,"pCount":1},
	        tr.innerHTML = '<td>' +
	            '<input type="checkbox" class="ck"  />' +
	            '</td>' +
	            '<td>' +
	            '<img src="' + listObj[i].pImg + '" alt="" />' +
	            '</td>' +
	            '<td>' +
	            listObj[i].pDesc +
	            '</td>' +
	            '<td>' +
	            '<button class="down">-</button><input type="text" value="' + listObj[i].pCount + '" readonly="readonly" /><button class="up">+</button>' +
	            '</td>' +
	            '<td>' +
	            '￥<span>' + listObj[i].price + '</span>' +
	            '</td>' +
	            '<td>' +
	            '￥<span>' + listObj[i].price * listObj[i].pCount + '</span>' +
	            '</td>' +
	            '<td>' +
	            '<button class="del" >删除</button>' +
	            '</td>';
	        tbody.appendChild(tr);
	    }
	}

	/*
	    功能：计算总价格
	 */
	var cks = document.querySelectorAll("tbody .ck");
	function getTotalPrice() {
	    cks = document.querySelectorAll("tbody .ck");
	    var sum = 0;
	    for(var i = 0, len = cks.length; i < len; i++) {
	        if(cks[i].checked) { //如果当前被选中
	            var tr = cks[i].parentNode.parentNode;
	            var temp = tr.children[5].firstElementChild.innerHTML;
	            sum = Number(temp) + sum;
	        }
	    }
	    return sum;
	}
	/*循环遍历为每一个checkbox添加一个onchange事件*/
	for(var i = 0, len = cks.length; i < len; i++) {
	    cks[i].onchange = function() {
	        checkAllChecked();
	        totalPrice.innerHTML = getTotalPrice();
	    }
	}

	/*全选实现*/
	allCheck.onchange = function() {
	    if(this.checked) {
	        for(var i = 0, len = cks.length; i < len; i++) {
	            cks[i].checked = true;
	        }
	    } else {
	        for(var i = 0, len = cks.length; i < len; i++) {
	            cks[i].checked = false;
	        }
	    }
	    totalPrice.innerHTML = getTotalPrice();
	}

	var downs = document.querySelectorAll(".down"); //一组减的按钮
	var ups = document.querySelectorAll(".up"); //一组加的按钮
	var dels = document.querySelectorAll(".del"); //一组删除按钮
	for(var i = 0, len = downs.length; i < len; i++) {
	    downs[i].onclick = function() {
	        var txtObj = this.nextElementSibling;//下一个兄弟节点
	        var tr = this.parentNode.parentNode;
	        var pid = tr.getAttribute("pid");
	        txtObj.value = txtObj.value - 1;
	        if(txtObj.value < 1) {
	            txtObj.value = 1;
	            updateObjById(pid, 0)
	        } else {
	            updateObjById(pid, -1)
	        }
	        tr.children[0].firstElementChild.checked = true;
	        checkAllChecked();
	        var price = tr.children[4].firstElementChild.innerHTML;
	        tr.children[5].firstElementChild.innerHTML = price * txtObj.value;
	        totalPrice.innerHTML = getTotalPrice();

	    }

	    ups[i].onclick = function() {
	        var txtObj = this.previousElementSibling;//上一个兄弟节点
	        var tr = this.parentNode.parentNode;
	        var pid = tr.getAttribute("pid");
	        txtObj.value = Number(txtObj.value) + 1;
	        updateObjById(pid, 1)
	        tr.children[0].firstElementChild.checked = true;
	        checkAllChecked()
	        var price = tr.children[4].firstElementChild.innerHTML;
	        tr.children[5].firstElementChild.innerHTML = price * txtObj.value;
	        totalPrice.innerHTML = getTotalPrice();
	    }

	    dels[i].onclick = function() {
	        var tr = this.parentNode.parentNode;
	        var pid = tr.getAttribute("pid")
	        if(confirm("确定删除？")) {
	            //remove()  自杀
	            tr.remove();
	            listObj = deleteObjByPid(pid);
	        }
	        if(listObj.length == 0) { //购物车为空
	            box.className = "box";
	            table.className = "hide";
	        } else {
	            box.className = "box hide";
	            table.className = "";
	        }
	        totalPrice.innerHTML = getTotalPrice();
	    }
	}

	/*检测是否要全选*/
	function checkAllChecked() {
	    var isSelected = true; //全选是否会选中
	    for(var j = 0, len = cks.length; j < len; j++) {
	        if(cks[j].checked == false) {
	            isSelected = false;
	            break;
	        }
	    }
	    allCheck.checked = isSelected;
	}
//自动实现计算
	function calc() {
		  var singPrice = document.getElementById("singPrice").text;
		  var count = document.getElementById("count").text;
		  //判断value
		  if (isNaN(singPrice)) {
		      document.getElementById("singPrice").value = "";     
		     return false;
		  }
		   if (isNaN(count)) {
		      document.getElementById("count").value = "";     
		     return false;
		  }
		  var totalPrice = singPrice * count;
		  document.getElementById("totalPrice").innerHTML = (totalPrice).toFixed(2); 


		}

	function deleteCustomer(id) {
	    if(confirm('确实要删除该客户吗?')) {
	$.post( "<%=basePath%>deleteOrder", {"id":id},
	  function(data) {
        if (data == "OK") {
            parent.layer.alert("成功删除");
            
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
                    window.location.replace("${pageContext.request.contextPath}/myOrders");
			  },2000);
            
            parent.layer.alert("删除失败！");
        }                                              
    }
	);
	    }
	}
</script>
    
  </body>
</html>