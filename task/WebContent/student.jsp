<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进入学生页面</title>
</head>
<script src="jquery-1.11.3/jquery.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

body {
	background-color: #d1d7db;
}

.nav {
	background-color: green;
}

.nav a {
	color: white;
}

.headimg {
	width: 150px;
	height: 150px;
}

.headimg img {
	border-radius: 50%;
	width: 150px;
	height: 150px;
}

.left {
	margin-left: 50px;
	margin-top: 50px;
	padding: 30px 30px;
	background-color: #3ac3d6;
	width: 200px;
}

.left-caidan {
	line-height: 40px;
	height: 300px;
}

.left-caidan li {
	padding-left: 40px;
}

#prizeinfo {
	display: inline-block;
	margin-top: 40px;
	padding-left: 30px;
	padding-right: 30px;
	font-size: large;
	color: #eaeef4;
	background-color: #63a9de;
}

li {
	list-style: none;
	color: #56595e;
}

.addbored {
	border: 2px #7e5ec4 solid
}

.compe {
	position: absolute;
	left: 400px;
	top: 90px;
	font-size: 18px;
	background-color: #d5dbdf;
}

.com-head {
	font-size: xx-large;
}

.compe-center {
	width: 1100px;
	height: 300px;
	overflow: auto;
}

.compe a {
	color: #3a80e3;
}

.compe-table {
	width: 100%;
}

.compe-content {
	font-size: 14px;
	letter-spacing: 3px;
	font-family: "宋体";
}

.compe-table td {
	line-height: 40px;
	padding-left: 30px;
}

.compe-old {
	display: block;
	width: 100%;
	height: 200px;
}

.compe-current {
	display: none;
	width: 100%;
	height: 200px;
}

.compe-botton {
	display: inline-block;
	padding-left: 15px;
	padding-bottom:20px;
	width: 300px;
	background-color: #e8eff4;
	margin-top: 30px;
	margin-right: 100px;
	line-height: 30px;
}
.compe-currentcompe{
	display: inline-block;
	padding-left: 15px;
	padding-bottom:20px;
	width: 900px;
	background-color: #e8eff4;
	margin-top: 30px;
	margin-right: 100px;
	line-height: 30px;}
.compe-bottonhead {
	margin-top: 30px;
}

.botton-a {
	font-size: xx-large;
}

.botton-two {
	font-size: 22px;
}

.botton-a a {
	margin-right: 80px;
}

.addcaidan {
	backgroundColor: gray;
	fontSize: large;
}

.addprize {
	backgroundColor: red;
}

.div-one {
	display: block;
}

/*修改密码的样式*/
.div-two {
	background: #d7dcdd;
	display: none;
	height: 500px;
	width: 800px;
}

.pass-header {
	padding: 20px 0 0 20px;
	font-size: 40px;
	font-family: "宋体"
}

.pass-center {
	color: #0f8002;
	font-weight: 600;
	margin-top: 40px;
	padding-left: 20px;
}

.pass-content {
	margin-left: 50px;
	margin-top: 50px;
}

.pass-table tr {
	line-height: 30px;
}

.xg-span {
	background: #1e81cc;
	color: white;
	display: inline-block;
	width: 70px;
	text-align: center;
}
/*个人认证*/
.div-three {
	display: none;
	font-family: "宋体";
	font-size: 22px;
}

.div-three1 {
	width: 800px;
	height: 300px;
	padding-bottom: 20px;
	background: #f1f0f0;
}

.rz-header {
	margin: 0 0 20px 30px;
	padding-top: 20px;
}

.rz-table {
	margin: 0 0 20px 30px;
	line-height: 40px;
	float: left;
}

.rz-img {
	width: 140px;
	height: 160px;
	float: right;
	margin-right: 120px;
}

.div-three2 {
	margin-top: 10px;
	margin-bottom: 40px;
	width: 800px;
	height: 350px;
	background: #fbf8f8;
	padding-bottom: 10px;
	background: #f1f0f0;
}

.rzy-img {
	width: 260px;
	height: 200px;
	float: right;
	margin-right: 120px;
}
/*赛事查询*/
.div-four {
	display: none;
	width: 800px;
	height: 500px;
	background: #fbf8f8;
	padding-bottom: 20px;
	background: #e7eeed;
	width: 800px;
}

.div-four-header {
	font-size: 30px;
	font-family: "宋体"
}

.div-four-header, .div-four-center {
	margin: 0 0 20px 30px;
	padding-top: 20px;
}

.xz {
	padding-left: 80px;
}
.prizeresult{
	width:100%;
	text-align: center;
}
.result {
	margin: 50px 20px 0 20px;
	color: #3f9533;
	padding: 40px 0;
	text-align: center;
	background: #dbdbdb;
}

.div-four-center span {
	margin-left: 80px;
	background: #55bfb2;
	color: white;
	padding: 2px 10px;
}
</style>
<body>
	<script>
		$(function() {
			//点击排名跳转
			$(".pm").hover(function() {
				$(this).css({
					"backgroundColor" : "#cdcdcd",
					"color" : "white",
					"cursor" : "pointer"
				});
			}, function() {
				$(this).css({
					"backgroundColor" : "",
					"color" : ""
				})
			})
			$(".pm").click(function() {
				window.location.href = "rank.do";
			})
			//设置菜单栏效果
			var $li = $(".left-caidan li");
			$li.click(function() {
				$(this).siblings().removeClass("addbored");
				$(this).addClass("addbored");
			})
			$li.hover(function() {
				$(this).css({
					"backgroundColor" : "gray",
					"fontSize" : "large"
				});
			}, function() {
				$(this).css({
					"backgroundColor" : "",
					"fontSize" : ""
				});
			})

			//设置上传按钮效果
			$("#prizeinfo").mouseenter(function() {
				$("#prizeinfo").css("backgroundColor", "#3d4be8");
			});
			$("#prizeinfo").mouseout(function() {
				$("#prizeinfo").css("backgroundColor", "");

			});
			//设置间隔变色
			var $tr = $(".compe-table tr:odd")
					.css("backgroundColor", "#bbbcc5");

			$(".nav a").hover(function() {
				$(this).css("color", "red")
			}, function() {
				$(this).css("color", "")
			})
			//当前参加比赛和以前参加比赛的显示与隐藏
			$(".botton-a>a").hover(function(){
				$(this).css("color","#163bf0");
			},function(){$(this).css("color","")})
			$(".aone").click(function(){
				$(this).css({"backgroundColor":"#95adb4",color:"white"});
				$(".atwo").css({"backgroundColor":"",color:""});
				$(".compe-old").css("display","block");
				$(".compe-current").css("display","none");
			})
			$(".atwo").click(function(){
				$(this).css({"backgroundColor":"#95adb4",color:"white"});
				$(".aone").css({"backgroundColor":"",color:""});
				$(".compe-current").css("display","block");
				$(".compe-old").css("display","none");
			})
			//验证修改密码的表单
			$(".xg-span")
					.click(
							function() {
								var oldpass = $(".pass-table [name='password']")
										.val();
								var newpass = $(
										".pass-table [name='newpassword']")
										.val();
								var againpass = $(
										".pass-table [name='againpass']").val();
								$(".pass-table input").each(function() {
									if ($(this).val() == '') {
										$(this).parent().next().text("不能为空");
									}
								})
								for (var i = 0; i < $(".pass-table input").length; i++) {
									if ($(".pass-table input")[i].value == '') {
										return;
									}
								}
								if (newpass != againpass) {
									$(".pass-table [name='againpass']")
											.parent().next()
											.text("确认新密码与新密码不同")
									return;
								}

								$.ajax({
									url : "StuOperate",
									type : "post",
									data : 'oldpassword=' + oldpass
											+ '&newpassword=' + newpass,
									success : function(msg) {
										var obj = eval("(" + msg + ")")
										if (obj.flag == 'error') {
											$("#td1").text("原密码输入错误")
											$("#span1").text("修改失败")
										}
										if (obj.flag == 'success') {
											alert("修改成功，回到首页");
											window.location.href = "shou.jsp";
											
										}
									}
								})
							})
			//移上去表单验证提示消失
			$(".pass-table input").mouseenter(function() {
				$(this).parent().next().text("");
			});
			//个人认证
			$(".rz-table td:odd").css("padding-left", "30px")
			//获奖查询查询按钮
			$(".div-four-center span").hover(function() {
				$(this).css({
					"backgroundColor" : "#17660b",
				});
			}, function() {
				$(this).css({
					"backgroundColor" : "",
				});
			})
			//将左侧菜单栏和右侧相对应
			$(".left-caidan li").click(
					function() {
						var index = $(this).index();
						$($(".compe>div")[index]).css("display", "block")
								.siblings().css("display", "none");
					})
			//输入编号查询赛事是否获奖
			$("#prizesel").click(function(){
				var pid = $("#inputId").val();
				
				$.ajax({
					url:"StuOperate",
					data:"pid="+pid,
					type:"get",
					success:function(data){
						$(".result").remove();
						$(".prizeresult").remove();
						var data = eval("("+data+")")
						var html = "";
						if(data.flag==='checksign5'){
							html='<table class="prizeresult" border="1" cellspacing="0">'
								+'<tr><th>比赛名称</th>'
									+'<th>比赛类别</th>'
									+'<th>赛事积分</th>'
									+'<th>银行卡号</th>'
									+'<th>获奖级别</th></tr>'
								+'<tr><td>'+data.comname+'</td>'
									+'<td>'+data.category+'</td>'
									+'<td>'+data.score+'</td>'
									+'<td>'+data.bankcard+'</td>'
									+'<td>'+data.grade+'</td></tr></table>'
						}else if(data.flag==='checksign4'){
							html='<div class="result">该比赛校方未审核通过</div>';
						}else if(data.flag==='checksign3'){
							html='<div class="result">该比赛校方正在审核,请稍后</div>';
						}else if(data.flag==='checksign2'){
							html='<div class="result">该比赛院系审核通过</div>';
						}else if(data.flag==='checksign1'){
							html='<div class="result">该比赛院系审核未通过</div>';
						}else if(data.flag==='uploadinfonull'){
							html='<div class="result">您未上传该比赛的获奖信息，请上传后再查询</div>';
						}else if(data.flag==='publishnull'){
							html='<div class="result">您输入的赛事编号不存在</div>';
						}else{
							html='<div class="result">暂无可查询的结果</div>';
						}
						$(".div-four-center").append(html);
					}
				})
			})
		})
	</script>
	<div class="nav">
		<a href="shou.jsp">&lt;首页</a>
	</div>
	<div class="left">
		<div class="headimg">
			<img alt="" src="images/b.jpg">
		</div>

		<div class="left-caidan">
			<div class="pm">
				<span>总积分:${requestScope.student.score}分</span> <span>排名:第${requestScope.student.sturank}名</span>
			</div>
			<ul>
				<li>个人认证</li>
				<li>我的大赛</li>
				<li>获奖查询</li>
				<li>账号设置</li>
			</ul>
			<span><a
				href="${pageContext.request.contextPath}/studentinfo/uploadprize.jsp"
				id="prizeinfo" target="_blank">上传获奖信息</a></span>
		</div>
	</div>


	<div class="compe">
		<!-- 个人信息认证 -->
		<div class="div-three">
			<div class="div-three1">
				<div class="rz-header">个人认证信息</div>
				<table class="rz-table">
					<tr>
						<td>姓&nbsp;&nbsp;名:</td>
						<td>${requestScope.student.name }</td>
					</tr>
					<tr>
						<td>性&nbsp;&nbsp;别:</td>
						<td>男</td>
					</tr>
					<tr>
						<td>生&nbsp;&nbsp;日:</td>
						<td>1996-04-19</td>
					</tr>
					<tr>
						<td>证件类型:</td>
						<td>学生证</td>
					</tr>
					<tr>
						<td>证件号码:</td>
						<td>56456145645464</td>
					</tr>
				</table>
				<img src="images/b.jpg" class="rz-img">
			</div>
			<div class="div-three2">
				<div class="rz-header">院系认证信息</div>
				<table class="rz-table">
					<tr>
						<td>学&nbsp;&nbsp;校:</td>
						<td>某省某大学</td>
					</tr>
					<tr>
						<td>学&nbsp;&nbsp;历:</td>
						<td>本科</td>
					</tr>
					<tr>
						<td>院&nbsp;&nbsp;系:</td>
						<td>${requestScope.student.department }</td>
					</tr>
					<tr>
						<td>学&nbsp;&nbsp;号:</td>
						<td>${requestScope.student.sno }</td>
					</tr>
					<tr>
						<td>入学日期:</td>
						<td>2016-09-18</td>
					</tr>
					<tr>
						<td>毕业日期:</td>
						<td>2020-06-30</td>
					</tr>
				</table>
				<img src="images/b.jpg" class="rzy-img">
			</div>
		</div>
		<!-- 我的大赛 -->
		<div class="div-one">
			<div class="com-head">
				<a href="#">浏览比赛信息</a><hr>
			</div>

			<div class="compe-center">
				<table class="compe-table">
					<tr>
						<td>赛事编号</td>
						<td>比赛名称</td>
						<td>比赛时间</td>
						<td>创新积分</td>
					</tr>
					<c:forEach items="${requestScope.allPublish }" var="p">
						<tr class="compe-content">
							<td>${p.pid }</td>
							<td>${p.pname }</td>
							<td>${p.publishtime }</td>
							<td>${p.score }</td>
						</tr>
					</c:forEach>
<!-- 					<tr class="compe-content">
						<td>2017互联网app设计大赛</td>
						<td>2018-05-14</td>
						<td>计算机工程与科学学院</td>
						<td>2</td>
					</tr>
					<tr class="compe-content">
						<td>2017互联网app设计大赛</td>
						<td>2018-05-14</td>
						<td>计算机工程与科学学院</td>
						<td>2</td>
					</tr>
					<tr class="compe-content">
						<td>2017互联网app设计大赛</td>
						<td>2018-05-14</td>
						<td>计算机工程与科学学院</td>
						<td>2</td>
					</tr>
					<tr class="compe-content">
						<td>2017互联网app设计大赛</td>
						<td>2018-05-14</td>
						<td>计算机工程与科学学院</td>
						<td>2</td>
					</tr>
					<tr class="compe-content">
						<td>2017互联网app设计大赛</td>
						<td>2018-05-14</td>
						<td>计算机工程与科学学院</td>
						<td>2</td>
					</tr>
					<tr class="compe-content">
						<td>2017互联网app设计大赛</td>
						<td>2018-05-14</td>
						<td>计算机工程与科学学院</td>
						<td>2</td>
					</tr>
 -->				</table>
			</div>
			<div class="compe-bottonhead">
				<div class="botton-a">
					<a href="javascript:" class="aone" style="background-color:#95adb4">我参加过的比赛</a>
					<a href="javascript:" class="atwo">当前正在参加的比赛(已分配老师)</a> <a href="javascript:"
						class="botton-two">更多</a>
					<hr>
				</div>

				<div class="compe-old">
					<div class="compe-botton">
						<ul>
							<li>安徽省电子商务”三创赛“</li>
							<li>2016-05-15</li>
							<li>省赛二等奖</li>
							<li>创新积分:4</li>
						</ul>
					</div>
					<div class="compe-botton">
						<ul>
							<li>安徽省电子商务”三创赛“</li>
							<li>2016-05-15</li>
							<li>省赛二等奖</li>
							<li>创新积分:4</li>
						</ul>
					</div>
				</div>

				<div class="compe-current">
					<div class="compe-currentcompe">
						<ul>
							<li>指导老师:王五</li>
							<li>安徽省电子商务”三创赛“</li>
							<li>2016-05-15</li>
							<li>创新积分:4</li>
							
							
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 赛事查询 -->
		<div class="div-four">
			<div class="div-four-header">获奖查询</div>
			<div class="div-four-center">
				<label>赛事编号</label><input type="text" id="inputId"> <label class="xz">赛事选择</label>
				<select>
					<option selected="selected">第十届</option>
					<option>第九届</option>
					<option>第八届</option>
				</select> <span id="prizesel">查询</span>
			</div>
			<!-- <div class="result">暂无可查询的结果</div> -->
			
		</div>

		<!-- 账号设置 -->
		<div class="div-two">
			<div class="pass-header">安全中心(密码修改)</div>
			<div class="pass-center">密码修改:</div>
			<div class="pass-content">

				<table class="pass-table">
					<tr>
						<td>原&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码</td>

						<td><input type="password" name="password"></td>
						<td style='color: red' id="td1"></td>
					</tr>
					<tr>
						<td>新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码</td>
						<td><input type="password" name="newpassword"></td>
						<td style='color: red'></td>
					</tr>
					<tr>
						<td>确认新密码</td>
						<td><input type="password" name="againpass"></td>
						<td style='color: red'></td>
					</tr>
					<tr>
						<td><span class="xg-span">修改</span></td>
						<td><span style='color: red' id=span1></span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>