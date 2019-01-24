<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<!DOCTYPE html>

<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登陆到咚咚咚书店</title>

    <!-- Bootstrap -->
<!--     <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!--  <link rel="stylesheet" href="css/index/jquery.spinner.css" /> -->
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
<ul class="breadcrumb ">
    <li><a href="#">咚咚书店</a></li>
    <li><a href="#">我的购物车</a> <span class="divider">/</span></li>
</ul>

<h3 class="text-center text-success">购物车列表</h3>

<div class="container">
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
                <div class="span1">
                </div>
                <div class="span10">
<!--                    <img alt="140x140" src="img/a.jpg" class="img-rounded" /> -->
                    
                                        <table class="table ">
                        <thead>
                            <tr>
                                <th style="width: 70px;"> #
                                </th>  
                               <th>图片</th>
                                <th >书名</th>
                                <th >单价</th>
                                <th >数量</th>
                                <th style="width: 200px; white-space: nowrap;">操作</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        
                        
                        <form action="${pageContext.request.contextPath}/confirmOrder" method="post">

               
                        <!-- 这儿这个是遍历生成的 ${status.index-1+1} ,自动生成的序列放在这儿-->
                        <c:forEach items="${cars}" var="car" varStatus="status">
                            <tr id="tr-${car.bookId}"> 
                                <td><input id=1 class="ck" type="checkbox" value="${car.bookPrice}" name="items[${status.index-1+1}].bookPrice" /></td>  <!-- 这个是价格传递，如果后台价格为空则舍弃那个item -->
                              
                                <p style="display:none"><!-- 这个是隐藏的表单域，用来传送表单的东西 -->
                                <input value="${car.id}" name="items[${status.index-1+1}].id"/>
                                <input value="${USER_SESSION.userName}" name="items[${status.index-1+1}].userName"/>
                                <input value="${car.bookName}" name="items[${status.index-1+1}].bookName"/>
                                <input value="${car.bookId}" name="items[${status.index-1+1}].bookId"/>
                                <input value="${car.bookPhoto}" name="items[${status.index-1+1}].bookPhoto"/>
                                </p>
                                
                                
                                
                                <td><img alt="" src="${car.bookPhoto}" style="height:100px;width:100px"/></td>
                                <td>${car.bookName}</td>
                                <td><span class>${car.bookPrice }</span></td>
                                
                                <td><input class="spinnerExample" id="buyNumber" type="number" name="items[${status.index-1+1}].bookNum" style="width:35px" value="${car.bookNum}" min="0" max="99"/><br />
                               
                                <!-- 自动引入按钮的东西 -->
                                &nbsp;&nbsp;</td>
                            
                                <td><button class="btn-danger" type="button" onclick="deleteTr(${car.id})">删除 </button>
                                &nbsp;</td>
                            </tr>
                        </c:forEach>

                   

                                        
                        </tbody>
                    </table>
                       <button type="submit" class="btn btn-info">确认订单</button><br />
<!--                            <input type="submit" value="Submit"> -->
                        </form>
                    
                <h3 class="center">总价格是：<span id="totalprice">--</span></h3>
                    
                </div>
                <div class="span1">
                </div>
            </div>
        </div>
    </div>
</div>



<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/index/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 --><!-- 增加减少数量按钮 -->
<script type="text/javascript" src="common/layer/2.4/layer.js"></script>
<!-- <script type="text/javascript" src="js/index/jquery.spinner.js"></script> -->
<!-- <script type="text/javascript"> -->
<!-- // //     $('.spinnerExample').spinner({}); -->
<!-- </script> -->

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/index/bootstrap.min.js"></script>
    
<!-- 计算商品的总价格 --> 
<!--     <h2>我的购物车</h2> 没有id，只有name -->
<!--     <input type="checkbox" name="fruits" value="5">苹果(5元)&nbsp;&nbsp;&nbsp;数量：<input type="number" min="1" value="1" id="苹果数量" class="numbers"><br/> -->
<!--     <input type="checkbox" name="fruits" value="3">香蕉(3元)&nbsp;&nbsp;&nbsp;数量：<input type="number" min="1" value="1" id="香蕉数量" class="numbers"><br/> -->
<!--     <input type="checkbox" name="fruits" value="7">西瓜(7元)&nbsp;&nbsp;&nbsp;数量：<input type="number" min="1" value="1" id="西瓜数量" class="numbers"><br/> -->
<!--     <input type="checkbox" name="fruits" value="8">栗子(8元)&nbsp;&nbsp;&nbsp;数量：<input type="number" min="1" value="1" id="栗子数量" class="numbers"><br/> -->
<!--     <input type="checkbox" name="fruits" value="10">哈密瓜(10元)数量：<input type="number" min="1" value="1" id="哈密瓜数量" class="numbers"><br/> -->
   

    <script>
    var bookItem = document.getElementsByClassName('ck'); //这个是提取价格的,难怪不能修改
    var numbers = document.getElementsByClassName("spinnerExample");
    var increase =  document.getElementsByClassName("increase");
    var decrease =  document.getElementsByClassName("decrease");
//     var delButton = document.getElementsByClassName("del");
    
//     for(var i=0;i<delButton.length;i++){
//       delButton[i].onclick = delButton[i].remove;
//     //点击后才执行删除操作才对啊
//     }
    
    
    for(var i=0;i<numbers.length;i++){
        numbers[i].onclick = count;
    }
    for(var i=0;i<decrease.length;i++){
        decrease[i].onclick = count;
    }
    
    for(var i=0;i<increase.length;i++){
        increase[i].onclick = count;
    }
    
    for(var i=0;i<bookItem.length;i++){
        bookItem[i].onclick = count;
    }
    
    //count the total price
    function count(){
        var totalprice = 0;
        for(var i=0;i<bookItem.length;i++){
            if(bookItem[i].checked){
                var number = parseFloat(numbers[i].value);
                totalprice += parseFloat(parseFloat(bookItem[i].value))*number;
            }
        }
        document.getElementById('totalprice').innerHTML = totalprice;
    }
    
    //这个是删除的方法
    function deleteTr(id){
        layer.confirm('确认要删除吗？', function (index) {
                       $.ajax({
                           type : "post",
                           url : "${pageContext.request.contextPath}/deleteCar",    //点击了按钮，就执行了form的提交，原来如此                                         
                           data : {
                               "id" : id    //把idpost过去
                            },
                            success : function(data) {
                                if (data == "ok") {
                                     parent.layer.alert("删除成功"); 
                                    /* trItem.remove();
                                    layer.closeAll(); */
                                     window.location.reload(); //刷新这个页面
                                } else {
                                    parent.layer.alert("删除失败")
                                }                                              
                            }                            
                        });
                    });
        } 
        
    
/*     //这个是删除按钮的东西
    var delButton = document.getElementsByClassName("del btn-danger");
    function deleteTr(id){
        var trItem = $('#tr-'+id);
//      parent.layer.alert("确认删除这本书吗？??"+id);//成功插入购物车后
         parent.layer.alert("确认删除这本书吗？??"+id,function() {
               trItem.remove();
               layer.closeAll();
         });
//         var trItem =document.getElementsById(1); //如果id和传过来的按钮的id对得上的话就就可以 ，全都都一开始准备好了
//         trItem.remove();
//         alert(trItem);
    } */
            
    
    </script>
    

    
<!-- 加入购物车的ajax -->

  </body>
</html>
