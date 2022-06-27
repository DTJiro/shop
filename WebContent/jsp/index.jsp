<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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
</head>

	<body>
		<div class="container-fluid">

			<%@include file="/jsp/head.jsp" %>

			<div class="container-fluid">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${pageContext.request.contextPath}/img/11.jpg" width="100%">
							<div class="carousel-caption">
							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/12.jpg" width="100%">
							<div class="carousel-caption">

							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath}/img/13.jpg" width="100%">
							<div class="carousel-caption">

							</div>
						</div>
					</div>

					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>最新商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="${pageContext.request.contextPath}/products/hao/big.jpg" height="400" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">


					<c:forEach items="${nList }" var="p">
						<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
							<a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}">
								<img src="${pageContext.request.contextPath}/${p.pimage}" width="130" height="130" style="display: inline-block;">
							</a>
							<p><a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}" style='color:#666'>${fn:substring(p.pname,0,10) }..</a></p>
							<p><font color="#E4393C" style="font-size:16px">&yen;${p.shop_price }</font></p>
						</div>
					</c:forEach>				
				</div>
			</div>			
            <div class="container-fluid">
				<img src="${pageContext.request.contextPath}/products/hao/ad.jpg" width="100%"/>
			</div>

			<div class="container-fluid">
				<div class="col-md-12">
					<h2>热门商品&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="${pageContext.request.contextPath}/products/hao/big1.jpg" width="270" style="display: inline-block;"/>
				</div>
				<div class="col-md-10">

					<c:forEach items="${hList }" var="p">
						<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
							<a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}">
								<img src="${pageContext.request.contextPath}/${p.pimage}" width="130" height="130" style="display: inline-block;">
							</a>
							<p><a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}" style='color:#666'>${fn:substring(p.pname,0,10) }..</a></p>
							<p><font color="#E4393C" style="font-size:16px">&yen;${p.shop_price }</font></p>
						</div>
					</c:forEach>
				</div>
			</div>			
		</div>
	</body>

</html>