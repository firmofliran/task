<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
*{
	padding: 0;
	margin: 0;
}
.head {
	height: 120px;
	width: 100%;
	background-color: #66CCCC;
	text-align: center;
	position: relative;
}
.title {
	font-family: "宋体";
	color: #FFFFFF;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%); /* 使用css3的transform来实现 */
	font-size: 36px;
}
.tu{
color: white;
font-size: 22px;
background-color: #418dd6;
}
.all {
	margin-left: 30%;
}
</style>
<script src="jquery-1.11.3/jquery.js"></script>
<script src="echarts.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/SchoolToDepart",
			type : "get",
			dataType : "json",
			success : function(data) {
				var alloption = "";
				for ( var i in data) {
					alloption = alloption
							+ '<option value='+data[i].department+'>'
							+ data[i].department + '</option>'
				}
				$("select[name=acceptpeople]").append(alloption)
				$("select[name=selectdepart]").append(alloption)
			}
		})
		$("#a").click(
				function() {
					//alert($(".choose option:selected"));return;
					$.ajax({
						// url:"Datashow",
						url : "Datashow",
						data : "sign=prizeinfo&department="+$(".choose option:selected").val(),
						type : "get",
						dataType : "json",
						success : function(msg) {
							//alert(data1.length)
							var myChart = echarts.init(document
									.getElementById('main'));
							// 基于准备好的dom，初始化echarts实例
							var arrykey = [];
							var arryvalue = [];
							for ( var i in msg) {
								arrykey.push(i);
								arryvalue.push(msg[i]);
							}
							// 指定图表的配置项和数据
							var option = {
								color : [ 'blue' ],
								title : {
									text : '学生参加比赛人数图',
									target : 'blank'
								},
								
								tooltip : {},
								legend : {
									data : [ '获奖信息' ]
								},
								xAxis : {
									// data: arrykey
									data : arrykey,
									name : '比赛类型',
									fontStyle : '15px',
									axisLabel: {
						                interval:0,
						                rotate:35, //代表逆时针旋转45度
						                textStyle: {    //文字样式
								            color: "black",
								            fontSize: 14,
								            fontFamily: 'Microsoft YaHei'
								            }

						            }
								},
								yAxis : {
									name : '人数',
									nameTextStyle : { //---坐标轴名称样式
										color : "red",
										padding : [ 5, 0, 0, 5 ], //---坐标轴名称相对位置
									},
								},
								series : [ {
									name : '获奖信息',
									type : 'bar',
									//  data: arryvalue
									data : arryvalue,
									legendHoverLink : true,
								/*  barWidth:'30',
								 barCategoryGap:'10', */
								} ]
							};

							// 使用刚指定的配置项和数据显示图表。
							myChart.setOption(option);
						}
					})
				})
		$("#a1").click(
				function() {
					$.ajax({
						// url:"Datashow",
						url : "Datashow",
						type : "get",
						data : "sign=allarticle",
						dataType : "json",
						success : function(msg) {
							//alert(data1.length)
							var myChart = echarts.init(document
									.getElementById('main1'));
							// 基于准备好的dom，初始化echarts实例
							//var arrykey = [];
							//var arryvalue = [];
							//var str ="";
							//for ( var i in msg) {
								//arrykey.push(i);
								//alert("{name:\""+i+"\",value:"+msg[i]+"}")
								//str="{name:\""+i+"\",value:"+msg[i]+"}";
							//	arryvalue.push(msg[i]);
							//}
							//var obj = eval("("+arryvalue+")")
							//str ="["+str.substring(0,str.lastIndexOf(","))+"]"
							//alert(arryvalue)
							// 指定图表的配置项和数据
							var option = {
								title : {
									text : '学生论文专利人数图',
									target : 'blank'
								},
								tooltip : {},
								/* legend : {
									data : [ '论文','专利信息' ]
								}, */
								series : [ {
									name :  [ '发表文章信息' ],
									type : 'pie',
								  // data: arryvalue
									data : [{value:msg["论文"],name:"论文人数"},{value:msg["专利"],name:'专利人数'}]//arryvalue,
								} ]
							};

							// 使用刚指定的配置项和数据显示图表。
							myChart.setOption(option);
						}
					})
				})
	})
</script>
<body>
	<!-- <div class="choose">
		<label>选择要发送的学院</label> <select name="acceptpeople">
			<option>请选择学院</option>
		</select>
	</div> -->
	<div class="head">
		<div class="title">数据分析</div>
	</div>
	<!-- <div>
		<label>选择要发送的学院</label> <select name="category">
			<option>学科竞赛</option>
			<option>科研立项</option>
		</select>
	</div>  -->
	<div class="all">
		<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
		<input type="button" value="所有比赛人数详情" id="a" class="tu">
		<input type="button" value="论文专利人数详情"id="a1" class="tu">
		<div id="main" style="width: 600px; height:520px;border-bottom:20px;"></div>
		<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
		<div id="main1" style="width: 600px; height: 550px;"></div>
	</div>
	<div class="allpetent">
	</div>
</body>
</html>