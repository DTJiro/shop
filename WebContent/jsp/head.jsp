<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- for bootstrap working -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-3.1.1.min.js"></script>
	<!-- //for bootstrap working -->
	<!-- header modal -->
	<!-- 顶部 -->
	<div class="header" id="home1">
		<div class="container">
		<c:if test="${empty user }">
			<div class="w3l_login">
				<a href="${pageContext.request.contextPath }/jsp/login.jsp" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
			</div>
		</c:if>
		<c:if test="${not empty user }">
			<div style="position: absolute;display: inline-block;float: left;margin:0.8em 0 0 0;">
				<a href="${pageContext.request.contextPath }/jsp/update.jsp">${user.name }<a/>:你好!
				
				<a href="${pageContext.request.contextPath }/order?method=findMyOrdersByPage&pageNumber=1">我的订单</a>
				<a href="${pageContext.request.contextPath }/jsp/logout.jsp">退出</a>
			</div>
		</c:if>
			<div class="w3l_logo">
				<img src="${pageContext.request.contextPath }/img/logo.png" height="70px" />
			</div>
			<div class="search">
				<input class="search_box" type="checkbox" id="search_box">
				<label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
				<div class="search_form">
					<form action="#" method="post">
						<input type="text" name="Search" placeholder="Search...">
						<input type="submit" value="Send">
					</form>
				</div>
			</div>
			<div class="cart cart box_1"> 
				<form action="${pageContext.request.contextPath }/jsp/cart.jsp" method="post" class="last"> 
					<input type="hidden" name="cmd" value="_cart" />
					<input type="hidden" name="display" value="1" />
					<button class="w3view-cart" type="submit" name="submit" value=""><img src="${pageContext.request.contextPath }/img/cart.png" width="90px" style="padding-right: 40px" /></button>
				</form>   
			</div>  
		</div>
	</div>
	<!-- //header -->
	<!-- 导航栏 -->
	<div class="navigation">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header nav_2">
					<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> 
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath }" class="act">首页</a></li>	
						<!-- Mega Menu -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">商品分类 <b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-3">
										<ul class="multi-column-dropdown" id="c_ul">
										</ul>
									</div>
									<div class="col-sm-4">
										<div class="w3ls_products_pos">
											<h4>30%<i>Off/-</i></h4>
											<img src="images/1.jpg" alt=" " class="img-responsive" />
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath }/jsp/map.jsp">线下门店</a></li>
						<li><a href="#">加入我们</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
<script type="text/javascript">
	$(function(){
		//发送ajax 查询所有分类
		$.post("${pageContext.request.contextPath}/category",{"method":"findAll"},function(obj){
			//alert(obj);
			//遍历json列表,获取每一个分类,包装成li标签,插入到ul内部
			//$.each($(obj),function(){});
			$(obj).each(function(){
				//alert(this.cname);
				$("#c_ul").append("<li><a href='${pageContext.request.contextPath}/product?method=findByPage&pageNumber=1&cid="+this.cid+"'>"+this.cname+"</a></li>");
			});
		},"json");
	})
</script>