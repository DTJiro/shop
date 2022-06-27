<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#allmap{height:500px;width:100%;}
		#r-result,#r-result table{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=VknLy5cdMswqwDTE0OANw9eDcR4ydjE7"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<title>线路规划</title>
</head>
<body>
	<div id="allmap"></div>
	<div id="driving_way">
		<select>
			<option value="0">最少时间</option>
			<option value="1">最短距离</option>
			<option value="2">避开高速</option>
		</select>
		<input type="button" id="result" value="查询"/>
	</div>
	<div><a href="javascript:history.back();">返回</a></div>
	<div id="r-result"></div>
</body>
</html>
<script type="text/javascript">
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			alert('您的位置：'+r.point.lng+','+r.point.lat);
			var start=new BMap.Point(r.point.lng,r.point.lat);
			var end = "商铺";
			var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME,BMAP_DRIVING_POLICY_LEAST_DISTANCE,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];
			$("#result").click(function(){
				map.clearOverlays(); 
				var i=$("#driving_way select").val();
				search(start,end,routePolicy[i]); 
				function search(start,end,route){ 
					var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true},policy: route});
					driving.search(start,end);
				}
			});
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
</script>