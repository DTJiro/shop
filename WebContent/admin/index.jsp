<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统登陆界面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css"/>
<link href="${pageContext.request.contextPath }/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/assets/js/jquery-1.8.2.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/supersized-init.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/scripts.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var $tab_li = $('#tab ul li');
	$tab_li.hover(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
		var index = $tab_li.index(this);
		$('div.tab_box > div').eq(index).show().siblings().hide();
	});	
});
</script>
<script type="text/javascript">
$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
</script>
</head>

<body>
<div>
<div class="screenbg" style="padding-top: 150px;">
    <div class="page-container">
        <h1><font color="white">Login</font></h1>
        <form action="${pageContext.request.contextPath }/admin" method="post">
        	<input type="hidden" name="method" value="login">
            <input type="text" name="username" class="username" placeholder="请输入用户名">
            <input type="password" name="password" class="password" placeholder="请输入密   码"><br/>
            <button type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;陆</button>
        </form>
    </div>
<ul>
    <li><a href="javascript:;"><img src="${pageContext.request.contextPath }/assets/img/backgrounds/1.jpg"></a></li>
    <li><a href="javascript:;"><img src="${pageContext.request.contextPath }/assets/img/backgrounds/2.jpg"></a></li>
    <li><a href="javascript:;"><img src="${pageContext.request.contextPath }/assets/img/backgrounds/3.jpg"></a></li>
  </ul>
    <!-- Javascript -->
</div>
</div>
</body>

</html>
