<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				width: 100%;
			}
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>
		
		<%@include file="/jsp/head.jsp" %>

		<div class="row" style="width:1210px;margin:0 auto;">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a href="./index.jsp">首页</a></li>
				</ol>
			</div>
			<c:forEach items="${pb.data }" var="p">
				<div class="col-md-2">
					<a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}">
						<img src="${pageContext.request.contextPath}/${p.pimage}" width="170" height="170" style="display: inline-block;">
					</a>
					<p><a href="${pageContext.request.contextPath }/product?method=getById&pid=${p.pid}" style='color:green'>${fn:substring(p.pname,0,10) }..</a></p>
					<p><font color="#FF0000">商城价：&yen;${p.shop_price }</font></p>
				</div>
			</c:forEach>

		</div>

		<div style="width:380px;margin:0 auto;margin-top:50px;">
			<ul class="pagination" style="text-align:center; margin-top:10px;">
				
				<c:if test="${pb.pageNumber == 1 }">
					<li class="disabled">
						<a href="javascript:void(0)" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>

				<c:if test="${pb.pageNumber != 1 }">
					<li>
						<a href="${pageContext.request.contextPath }/product?method=findByPage&pageNumber=${pb.pageNumber-1}&cid=${param.cid}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>

				<c:forEach begin="1" end="${pb.totalPage }" var = "n">
					<c:if test="${pb.pageNumber == n }">
						<li class="active"><a href="javascript:void(0)">${n }</a></li>
					</c:if>
					<c:if test="${pb.pageNumber != n }">
						<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&pageNumber=${n}">${n }</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${pb.pageNumber == pb.totalPage }">
					<li  class="disabled">
						<a href="javascript:void(0)" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pb.pageNumber != pb.totalPage }">
					<li>
						<a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&pageNumber=${pb.pageNumber+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				
			</ul>
		</div>
	</body>

</html>