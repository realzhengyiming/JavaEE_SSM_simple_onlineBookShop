<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   
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
<!--[if IE 6]>
<script type="text/javascript" src="common/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加管理员 - 管理员管理 </title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="addAdminSubmit" >
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="password" class="input-text" autocomplete="off" value="" placeholder="密码" id="password" name="password">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input  class="btn btn-primary radius" type="button" onclick="admin_add()" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="common/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="common/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/admin//H-ui.min.js"></script>
<script type="text/javascript" src="js/admin/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="common/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="common/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="common/laypage/1.2/laypage.js"></script> 
<script type="text/javascript">
	function admin_add(){
		var adminName = $("#adminName").val();
		var password = $("#password").val();
	                $.ajax({
	                    type : "post",
	                    url : "addAdmin",                                           
	                    /* data : $("addAdminSubmit").serialize(), */
	                    data :JSON.stringify({adminName:adminName,password:password}),
	            		// 定义发送请求的数据格式为JSON字符串
	            		contentType : "application/json;charset=UTF-8",
	                    success : function(data) {
	                        if (data == "ok") {
	                        	alert("管理员添加成功");
		                        parent.location.reload();
	                        } else {
	                            parent.layer.alert("添加失败");
	                            window.location.reload();
	                        } 
	                       
	                    }                            
	                });
	                
	} 
</script>
</body>
</html>