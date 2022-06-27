<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员注册</title>

<link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/fasthover.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.countdown.css" /> <!-- countdown --> 
<!-- //js -->  
<!-- web fonts --> 
<link href='http://fonts.googleapis.com/css?family=Glegoo:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //web fonts -->  
<!-- start-smooth-scrolling -->
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css" type="text/css"/>
<style type="text/css">
  body{
   margin-top:20px;
   margin:0 auto;
 }
 .carousel-inner .item img{
	 width:100%;
	 height:300px;
 }
 .container .row div{ 
	 /* position:relative;
	 float:left; */
 }
 
font {
    color: #3164af;
    font-size: 18px;
    font-weight: normal;
    padding: 0 10px;
}
</style>

</head>
<body>
	<%@include file="/jsp/head.jsp" %>

	<div class="container" style="width:100%;background:url('${pageContext.request.contextPath}/image/regist_bg.jpg');">
		<div class="row"> 
		
			<div class="col-md-2"></div>
		
			<div class="col-md-8" style="background:#fff;padding:40px 80px;margin:30px;border:7px solid #ccc;">
				<font>会员注册</font>USER REGISTER
				<form class="form-horizontal" style="margin-top:5px;" method="post" action="${pageContext.request.contextPath }/user">
					<input type="hidden" name="method" value="register">
					 <div class="form-group">
					    <label for="username" class="col-sm-2 control-label">用户名</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="username">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" id="inputPassword3" placeholder="请输入密码" name="password">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" id="confirmpwd" placeholder="请输入确认密码">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-6">
					      <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="email">
					    </div>
					  </div>
					 <div class="form-group">
					    <label for="usercaption" class="col-sm-2 control-label">姓名</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="usercaption" placeholder="请输入姓名" name="name">
					    </div>
					  </div>
					  <div class="form-group opt">  
					  <label for="inlineRadio1" class="col-sm-2 control-label">性别</label>  
					  <div class="col-sm-6">
					    <label class="radio-inline">
					  <input type="radio" name="sex" id="inlineRadio1" value="1"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="sex" id="inlineRadio2" value="0"> 女
					</label>
					</div>
					  </div>
					  <div class="form-group">
					    <label for="usercaption" class="col-sm-2 control-label">联系电话</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="usercaption" placeholder="请输入联系电话" name="telephone">
					    </div>
					  </div>		
					  <div class="form-group">
					    <label for="date" class="col-sm-2 control-label">出生日期</label>
					    <div class="col-sm-6">
					      <input type="date" class="form-control"  name="birthday">		      
					    </div>
					  </div>
					 
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <input type="submit"  width="100" value="注册" name="submit" border="0"
						    style="background: url('${pageContext.request.contextPath}/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
						    height:35px;width:100px;color:white;">
					    </div>
					  </div>
					</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.idealforms.js"></script>
<div style="text-align:center;">

</div>
</body>
</html>