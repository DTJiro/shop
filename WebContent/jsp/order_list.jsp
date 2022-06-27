<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>会员登录</title>
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

				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong>我的订单</strong>
					<table class="table table-bordered">
						<c:forEach items="${pb.data }" var="o">
							<tbody>
								<tr class="success">
									<th colspan="2">订单编号:${o.oid } </th>
									<th colspan="1">
										<c:if test="${o.state == 0 }"><a href="${pageContext.request.contextPath }/order?method=getById&oid=${o.oid}">去付款</a></c:if>
										<c:if test="${o.state == 1 }">已付款</c:if>
										<c:if test="${o.state == 2 }">确认收货</c:if>
										<c:if test="${o.state == 3 }">已完成</c:if>
									</th>
									<th colspan="2">金额:${o.total }元 </th>
								</tr>
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
								</tr>
								<c:forEach items="${o.items }" var="oi">
									<tr class="active">
										<td width="60" width="40%">
											<input type="hidden" name="id" value="22">
											<img src="${pageContext.request.contextPath}/${oi.product.pimage}" width="70" height="60">
										</td>
										<td width="30%">
											<a target="_blank">${oi.product.pname}</a>
										</td>
										<td width="20%">
											￥${oi.product.shop_price}
										</td>
										<td width="10%">
											${oi.count }
										</td>
										<td width="15%">
											<span class="subtotal">￥${oi.subtotal }</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:forEach>
						
					</table>
				</div>
			</div>
			<%@include file="/jsp/page.jsp" %>
		</div>

	</body>

</html>