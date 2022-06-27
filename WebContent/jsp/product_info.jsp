<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>竹子商铺</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${pageContext.request.contextPath }/css/style1.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${pageContext.request.contextPath }/css/fasthover.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${pageContext.request.contextPath }/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
		<!-- //Custom Theme files -->
		<!-- font-awesome icons -->
		<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet"> 
		<!-- //font-awesome icons -->
		<!-- js -->
		<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery.countdown.css" /> <!-- countdown --> 
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
<!-- //end-smooth-scrolling --> 
		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>

		<%@include file="/jsp/head.jsp" %>

		<div class="container">
			<div class="row">
				<div style="border: 1px solid #e4e4e4;width:930px;margin-bottom:10px;margin:0 auto;padding:10px;margin-bottom:10px;">
					<a href="./index.jsp">首页&nbsp;&nbsp;&gt;</a>
					<a href= "javascript:history.back(); "> 返回 </a> 
				</div>

				<div style="margin:0 auto;background-color: #000000;">
					<div class="col-md-6">
						<img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/${bean.pimage}">
					</div>

					<div class="col-md-6">
						<div><strong>${bean.pname }</strong></div>
						<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
							<div>编号：${bean.pid }</div>
						</div>

						<div style="margin:10px 0 10px 0;">商城价: <strong style="color:#ef0101;">￥：${bean.shop_price }元</strong> 市场 价： <del>￥${bean.market_price }元</del>
						</div>

						<div style="margin:10px 0 10px 0;">促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)" style="background-color: #f07373;">限时抢购</a> </div>

						<div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;background-color: #fffee6;">
							<div style="margin:5px 0 10px 0;">白色</div>
							<form action="${pageContext.request.contextPath }/cart" id="form1" method="get">
								<input type="hidden" name="method" value="add2cart">
								<input type="hidden" name="pid" value="${bean.pid }">
								<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
									<input id="quantity" name="count" value="1" maxlength="4" size="10" type="text"> </div>
							</form>
								<div style="margin:20px 0 10px 0;;text-align: center;">
							
									<a href="javascript:void(0)" onclick="subForm()">
										<input style="background: url('${pageContext.request.contextPath}/images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="button">
									</a>
								</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<br/>
				<div style="width:950px;margin:0 auto;">
					<div>
						<img src="img/timg.jpg" height="50px">
					</div>
					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>商品介绍</strong>
					</div>

					<div>
						<img src="${pageContext.request.contextPath}/${bean.pimage}">
					</div>

					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>${bean.pdesc }</strong>
					</div>
					

			</div>
		</div>
	
	</body>
	<script type="text/javascript">
		function subForm(){
			document.getElementById("form1").submit();
		}
	</script>
</html>