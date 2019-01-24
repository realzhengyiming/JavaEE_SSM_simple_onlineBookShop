<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="common/html5shiv.js"></script>
<script type="text/javascript" src="common/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="css/admin/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/admin/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="common/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="css/admin/style.css" />


 <link href="css/index/bootstrap.min.css" type="text/css" rel="stylesheet" />
	
	<!-- DataTables CSS -->
	<link href="css/boot/dataTables.bootstrap.css" type="text/css" rel="stylesheet" />
	

<!--[if IE 6]>
<script type="text/javascript" src="common/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>书籍列表</title>
</head>
<body onkeydown="enterSubmit(event)">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 书籍管理 <span class="c-gray en">&gt;</span> 书籍列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	 <span class="select-box inline">
	 <form name="form" id="form" action="findBooksByBookName" method="post" >
		<input type="text" name="bookName" id="bookName" placeholder=" 书籍名称" style="width:250px" class="input-text">
		<button name="submit" id="submit" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜书籍</button>
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="batchDeletes()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" data-title="添加书籍" data-href="insertBooksPage" onclick="Hui_admin_tab(this)" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加书籍</a></span> <span class="r">共有数据：<strong>${num}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg ">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th>书籍名称</th>
					<th width="180">书籍价格（元）</th>
					<th width="180">图片</th>
					<th width="180">书籍数量（件）</th>
					
					
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.rows}" var="book" varStatus="status">
				<tr class="text-c">
					<td style="vertical-align: middle;"><input type="checkbox" value="${book.id}" name="subcheck"></td>
					<td style="vertical-align: middle;">${requestScope.offset+status.index+rank_id}</td>
					<td style="vertical-align: middle;">${book.bookName}</td>
				    <td style="vertical-align: middle;">${book.price}</tN>
				    <td style="vertical-align: middle;"><img src="${book.photo}" style="width:160px;height:50px "/></td>
					<td style="vertical-align: middle;">${book.number}</td>
				    
					<td style="vertical-align: middle;">
					 <a style="text-decoration:none" class="ml-5" onClick="book_edit('信息编辑','editBookPage?id=${book.id}','${book.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
					 <a style="text-decoration:none" class="ml-5" onClick="book_del(${book.id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
		    </c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-md-12 text-right">
		<itheima:page url="${pageContext.request.contextPath }/findAllBooks" />
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="common/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="common/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/admin//H-ui.min.js"></script>
<script type="text/javascript" src="js/admin/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!-- 实现分页 -->
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/index/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="js/index/bootstrap.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="common/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="common/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="common/laypage/1.2/laypage.js"></script>
<!-- 书籍删除 -->
<script type="text/javascript">
function book_del(id){
	layer.confirm('确认要删除吗？', function (index) {
	               $.ajax({
	                   type : "post",
	                   url : "deleteBook",                                           
	                   data : {
	                       "id" : id
	                    },
	                    success : function(data) {
	                        if (data == "ok") {
	                            parent.layer.alert("删除成功");
	                            window.location.reload();
	                        } else {
	                            parent.layer.alert("删除失败")
	                        }                                              
	                    }                            
	                });
	            });
	} 
	
function batchDeletes(){
	       //判断至少写了一项
	       var checkedNum = $("input[name='subcheck']:checked").length;
	       if(checkedNum==0){
	           alert("请至少选择一项!");
	           return false;
	       }
	       if(confirm("确定删除所选项目?")){
	       var checkedList = new Array();
	       $("input[name='subcheck']:checked").each(function(){
	           checkedList.push($(this).val());
	       });
	       $.ajax({
	           type:"POST",
	           url:"batchDeletesBooks",
	           data:{"delitems":checkedList.toString()},
	           datatype:"html",
	           success:function(data){
	               $("[name='checkbox2']:checkbox").attr("checked",false);
	               location.reload();//页面刷新
	           },
	           error:function(data){
	               art.dialog.tips('删除失败!');
	           }
	       });
	       }
}
function book_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}



/* 监控回车时间 */
function enterSubmit(obj) {
    //当enter 键按下后，需要执行的事件
        var button = document.getElementById('submit');
        if (obj.keyCode == 13) {
            button.click();
            obj.returnValue = false;
        }
    }
</script> 
</body>
</html>