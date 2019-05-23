<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>比赛详情介绍</title>
</head>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

.head-bm {
	display: inline-block;
	margin-left: 10px;
}

.top {
	width: 100%;
	height: 40px;
	background-color: #c3eae7;
	font-size: x-large;
	font-family: fantasy;
}

.head-cen {
font-weight:bold;
font-size:30px;
text-align: center;
color:#5b686b;
}

.divone {
	margin: 20px 10% 10px 10%;
	padding: 20px 0 20px 80px;
	background-color: #eae7ec;
	line-height: 50px;
}

.divone-head {
	font-size: xx-large;
	color:#5b686b;
}

.div-top {
	margin:0 10% 20px 10%;
	padding-bottom:20px;
	background-color: #eae7ec;
}

#top-head {
	font-size: 20px;
	text-align: center;
	background: #26d1dd;
	color: white;
	box-shadow: -1px -2px 10px black;
}

.sub {
display:inline-block;
	width: 80px;
	height: 30px;
	font-size: 26px;
	font-family: "宋体";
	margin-left: 50px;
	text-align: center;
	background: #15b29f;
	color:white;
	text-align: center;
	border-radius: 20%;
}

#top-bm {
	display: none;
	position: absolute;
	line-height:35px;
	z-index: 1001;
	width: 430px;
	opacity: 1;
	padding-bottom:20px;
	background: #f5f5ef;
	border-radius: 20px;
    border: 2px solid #5e98ea;
	
}
.tijiao{
	margin-top: 20px;
	margin-bottom: 20px;
}

.tdstyle {
	color: red;
	font-size: 20px;
}

.score {
	display: inline-block;
	float:right;
	margin-right:30px;
	color: red;
	border: 2px gray solid;
	padding: 0 10px;
	text-align: center;
}

.ms {
	margin-left: 80px;
	padding-top: 40px;
	padding-bottom: 50px;
}

.table-top {
	font-family: "宋体";
	font-size: x-large;
}

.tb {
	display: inline-block;
	width: 6px;
	height: 25px;
	background: red;
}

.content {
	letter-spacing: 4px;
	font-size: large;
	margin-left: 80px;
}

.div-bm {
	width: 100px;
	height: 30px;
	color: white;
	cursor: pointer;
	background-color: #e25122;
	margin: 20px auto;
	padding-top: 5px;
	border-radius: 10%;
	text-align: center;
	background-color: #e25122;
	margin: 20px auto;
	padding-top: 5px;
	margin: 20px auto;
	padding-top: 5px;
	padding-top: 5px;
}

.dark {
	width: 100%;
	z-index: 2;
	position: absolute;
	background-color: gray;
	opacity: 0.7;
}
.bmtd{padding-left:40px;letter-spacing: 5px;color:#8a8a8a;font-weight: lighter;}
</style>
<script src="jquery-1.11.3/jquery.js"></script>
<script type="text/javascript">
	$(function() {

		//所有input标签和将来出现提示的td标签
		var arrinput = document.getElementsByTagName("input");
		var td1 = document.getElementById("td1");
		var td2 = document.getElementById("td2");
		var arrtd = [ td1, td2 ];
		//表单验证 鼠标移上去提示消失
		for (var i = 0; i < arrtd.length; i++) {
			arrtd[i].num = i; //为两个标签设置标志 ，当鼠标移input上去时,找到与input标志相等时td将其提示去掉
			arrinput[i].index = i;//设置标志
			arrinput[i].onmouseover = function() {
				arrtd[this.index].innerHTML = "";
			}
		}
		//按钮移上去效果
		$(".div-bm").hover(function() {
			$(this).css("backgroundColor", "#f3093b")
		}, function() {
			$(this).css("backgroundColor", "")
		});

		//判断用户是否已经登录才能进行报名
		$(".div-bm")
				.click(
						function() {

							if ("${sessionScope.student.identify !='xs'}" === "true") {
								if (confirm("请先登录,去首页登录")) {
									window.top.location.href = "${pageContext.request.contextPath}/shou.jsp"
								}
							} else if ("${sessionScope.student.identify =='xs'}" === "true") {
								$("#top-bm").css({
									"z-index" : "2",
									"position" : "absolute",

								}).css("backgroundColor", "#e6e6e1");
								$("<div class='dark'></div>").css("height",
										$(document).outerHeight())
										.insertBefore("body")
								//让报名弹出层在当前滚动页面的中心显示
								var _scrollHeight = $("html").scrollTop();//获取当前窗口距离页面顶部高度 
								_windowHeight = $(window).height();//获取当前窗口高度 
								var bm = $("#top-bm");

								_windowWidth = $(window).width();//获取当前窗口宽度 
								_popupHeight = bm.height();//获取弹出层高度 
								_popupWeight = bm.width();//获取弹出层宽度 
								_posiTop = (_windowHeight - _popupHeight) / 2
										+ _scrollHeight;
								_posiLeft = (_windowWidth - _popupWeight) / 2;
								$("#top-bm").css({
									"left" : _posiLeft,
									"top" : _posiTop,
								});
								//
								$('html,body').css('overflow', "hidden");
								$("#top-bm").show();
							}
						});
		//隐藏遮罩层和报名
		$(".qx").click(function() {
			$("#top-bm").hide();
			$(".dark").remove();
			//遮罩层隐藏后浏览器恢复可滚动
			$('html,body').css('overflow', "auto");
		});

		//表单验证
		$("#isjoin")
				.click(
						function() {
							for (var i = 0; i < arrinput.length; i++) {
								if (arrinput[i].value == "") {
									arrtd[i].innerHTML = "此项不能为空";
									arrtd[i].className = "tdstyle";
								}
							}
							//有空值或学号不正确则不能提交
							for (var i = 0; i < arrinput.length; i++) {

								if (arrinput[i].value == ""
										|| arrinput[0].value != "${sessionScope.student.sno}") {
									//判断报名输入的学号是否等于session中的学号，如果不是则不允许提交
									if (i == 0) {
										if (arrinput[0] != "${sessionScope.student.sno}"
												&& arrinput[0] != "") {
											arrtd[0].innerHTML = "请正确输入学号";
											arrtd[0].className = "tdstyle";
											return false;
										}
									}
									return false;
								}
							}

							//预加载弹出加载gif图片
							/*	$(
										"<div class='zhezhao'><img src='${pageContext.request.contextPath}/images/load.gif' class='gif'></div>")
										.prependTo("body").css(
												{
													"height" : $(document)
															.outerHeight(true),
													"width" : "100%",
													"z-index" : "1000",
													"position" : "absolute",
													"background-color" : "gray",
													"opacity" : "0.8"
												});
								var _scrollHeight = $("html").scrollTop();//获取当前窗口距离页面顶部高度 
								_windowHeight = $(window).height();//获取当前窗口高度 
								var gif = $(".gif");

								_windowWidth = $(window).width(),//获取当前窗口宽度 
								_popupHeight = gif.height(),//获取弹出层高度 
								_popupWeight = gif.width();//获取弹出层宽度 
								_posiTop = (_windowHeight - _popupHeight) / 2 + _scrollHeight;
								_posiLeft = (_windowWidth - _popupWeight) / 2;
								
								$(".gif").css({
									"position" : "absolute",
									"left" : _posiTop,
									"top" : _posiLeft,
								});*/
							//$(".dark").remove();
							//到达这里之后代表验证通过可以将数据发到后台进行处理
							var sno = $("input[name='sno']").val();
							var name = $("input[name='name']").val();
							//var stuclass = $("input[name='stuclass']").val();
							//var department = $("input[name='department']")
							//		.val();
							$
									.ajax({
										type : "post",
										url : "${pageContext.request.contextPath}/baoming",
										data : "sno="
												+ sno
												+ "&name="
												+ name
												+ "&pid=${requestScope.detail.pid}",
										success : function(msg) {
											var obj = jQuery.parseJSON(msg);
											if (obj.flag == false) {
												$("#td1").text("您已经报过名").css(
														"color", "red");
											} else if (obj.flag == true) {
												$("#td1").text("报名成功").css(
														"color", "red");
											} else if (obj.flag == 'failed') {
												$("#td1")
														.text("信息丢失，请刷新一下")
														.css("color", "red")
														.css("fontSize", "15px");
											} else {
												alert("未知的")
											}
											//移除加载gif和遮罩层
											//$(".zhezhao").remove();
										},
										error : function(xhr) {
											alert("请联系管理员")
										},
									})
						});
		$("input[type='text']").css('backgroundColor', "#a0ebe9");
		$("#formone span").hover(function(){
			$(this).css("backgroundColor","#058f0d");
		},function(){
			$(this).css("backgroundColor","");
		})

	})
	/*function() {
		if ("${sessionScope.student.identify =='xs'}" === "true") {//将字符串的true是否等于结果字符串true
			//判断是否报过名
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4
						&& xhr.status == 200) {
					var json = xhr.responseText;
					var jsonobj = eval("(" + json + ")");

					if (jsonobj.flag == true) {
						//alert("您已经报过名了")
					} else if (jsonobj.flag == false) {
						//alert("没有报过名");
						$("#top-bm").css({
							"z-index" : "2",
							"position" : "absolute"
						})
								.css("backgroundColor",
										"#e6e6e1");
						$("<div class='dark'></div>")
								.insertBefore("body")
						$("#top-bm").show();

					} else if (jsonobj.flag == 'loser') {
						alert("出现信息丢失，请刷新一下")
					} else {
						alert("aa")
					}
				}
			}
			xhr
					.open(
							"get",
							"${pageContext.request.contextPath}/baoming?pid=${requestScope.detail.pid}",
							true);
			xhr.send(null);
			//alert("已登录可以进行报名");
			//用户已经登录则可以打开报名表单，否则打不开

		} else if ("${sessionScope.student.identify !='xs'}") {
			if (confirm("请先登录,去首页登录")) {
				window.top.location.href = "${pageContext.request.contextPath}/shou.jsp"
			}
		}
	}*/
</script>
<body>
	<div class="top">
		<div class="head-bm">

			<div id=top-bm>
				<div id="top-head">比赛报名</div>
					<table id="tj" class="tijiao">

						<tr>
							<td class="bmtd">学号</td><td><input type="text" name="sno" /></td>
							<td id="td1"></td>
						</tr>
						<tr>
							<td class="bmtd">姓名</td><td><input type="text" name="name" /></td>
							<td id="td2"></td>
						</tr>
						<!-- 将项目编号放入到隐藏域中 -->
						<tr>
							<td><input type="hidden" value="${requestScope.detail.pid}"
								name="id" /></td>
						</tr>
					</table>
					<span id="isjoin" class="sub" >提交</span>
					<span  class="sub qx" >取消</span>
			</div>
		</div>
		<div class="head-cen"> 比赛详情介绍</div>
	</div>
	<div class="divone">
		<span class="divone-head">比赛名称/${requestScope.detail.pname}(${requestScope.detail.grade})</span>
		<span class="divone-head score">${requestScope.detail.score}积分</span>
		<div>
			<span class="table-top">比赛编号/${requestScope.detail.pid}</span><br>
			<span class="table-top">比赛类别/${requestScope.detail.category}</span><br>
			<span class="table-top">比赛时间/${requestScope.detail.publishtime}</span><br>
			<span class="table-top">举办地点/${requestScope.detail.competitionplace}</span>
		</div>
	</div>
	<div class="div-top">
		<div class="ms">
			<span class="tb"></span>&nbsp;&nbsp;&nbsp;<span class="divone-head ">项目描述:</span>
		</div>
		<div class="content">${requestScope.detail.content}</div>
	</div>
	<div class="div-bm">
		<span id="bm">点击报名</span>
	</div>
</body>
</html>