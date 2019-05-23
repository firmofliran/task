<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	font-size: 20px;
}

.box {
	background-color: #29b9d3;
	height: 27px;
}

.box a {
	color: white;
}

a:hover {
	color: red;
}

.box1 {
	width: 100%;
	height: 40px;
	color: #1e86a3;
}

.box1 h1 {
	font-family: "隶书";
	text-align: center;
}

.box3 {
	margin: 5px 0;
}

.nav {
	text-align: center;
}

.nav li {
	display: inline;
	width: auto;
	height: 25px;
	padding-right: 40px;
}

.nav li a {
	width: auto;
	height: 20px;
	color: #000000;
}

.nav li a:hover {
	color: red;
}

#im {
	width: 100%;
	height: 400px;
}

.bottom {
	position: relative;
}

.bottom-a {
	width: 250px;
	height: 180px;
	margin: 5px 0px 0px 5px;
}

.bottom-left-word {
	position: absolute;
	left: 320px;
	top: 70px;
	line-height: 30px;
}

.bottom01 a {
	font-size:22px;
	margin-left: 5px;
	letter-spacing: 5px;
}

.bottom01 a:hover {
	background-color: #3dbcdf;
}

.bottom02 a {
	font-size:22px;
	letter-spacing: 5px;
}

.bottom02 a:HOVER {
	background-color: #3dbcdf;
}

.bottom-right {
	border: 10px #dbdbdb solid;
	width: 450px;
	padding: 10px 10px 0 10px;
	position: absolute;
	left: 850px;
	top: 20px;
	position: absolute;
}

.bottom-gd1 {
	position: absolute;
	left: 550px;
}

.botton-js {
	background-color: #0f88ef;
	color: white;
	font-size: large;
	padding: 0px 10px;
	letter-spacing: 10px;
}

#images {
	display: none;
}

.botton-two-one {
	width: 250px;
	height: 180px;
	margin: 5px 0px 0px 5px;
}

.botton-left1 {
	margin: 20px 0 0 40px;
	padding-top: 10px;
	border: 10px #dbdbdb solid;
	display: inline-block;
	width: 600px;
}

.tz  li {
	list-style: square;
}

.tz a {
	font-size: 13px;
	color: black;
	line-height: 30px;
}

.tzo {
	overflow: auto;
	width: 400px;
	height: 150px;
}

<!--
弹出登录框-->.dark {
	
}

#div2 {
	display: none;
	position: absolute;
	z-index: 1001;
	margin-left: 40%;
	margin-top: 200px;
	opacity: 1;
	border-width: 4px;
	border-color: yellow;
	border-style: solid;
}

.div3 {
	background-color: #97b3a8;
	width: 400px;
	height: 30px;
}

.div4 {
	background-color: #c3eae7;
	width: 400px;
	height: 150px;
}

.qx {
	float: right;
	height: 30px
}

#button {
	display: inline-block;
	background-color: #4696e3;
	color: #e3eaf1;
	margin-top: 8px;
	margin-left: 20px;
	padding: 0 20px;
	letter-spacing: 5px;
	border-radius: 10%;
	cursor: pointer;
	font-size: x-large;
}
</style>
<body>
	<!-- 弹出框密码登录部分 -->
	<div id="div2">
		<div class="div3">
			<span><img alt="" src="images/hi.png"
				style="width: 25px; heigt: 25px;"></span><span>欢迎登陆：</span>
			<button onClick="closeme()" class="qx">
				<img src="images/cha.png" style="width: 25px; heigt: 20px;">
			</button>
		</div>
		<div class="div4">
			<form id="form">
				<div style="position: relative; left: 10px; top: 10px;">
					<span
						style="display: inline-block; width: 20px; height: 23px; position: relative; top: 2px; text-align: center;"><img
						src="images/user.png"
						style="width: 15px; margin-bottom: -4px; height: 15px;"></span><input
						id="inputone" type="text" name="name" value="123"  placeholder="学号"
						style="height: 21px; position: relative; top: 2px; color: blue; background-color: #00ffff;"><span
						style="color: red;" class="sp1"></span>
				</div>

				<div style="position: relative; left: 10px; top: 14px">
					<span
						style="display: inline-block; width: 20px; height: 23px; position: relative; top: 2px; text-align: center;"><img
						src="images/lock.png"
						style="width: 15px; margin-bottom: -4px; height: 15px;"></span><input
						id="inputtwo" type="password" name="passward" value="123" placeholder="密码"
						style="height: 21px; position: relative; top: 2px; color: blue; background-color: #00ffff;"><span
						style="color: red;" class="sp2"></span>
				</div>

				<br> <input type="radio" name="identify" value="xs"
					onselect="true" class="lb" checked="checked">学生 <input
					type="radio" name="identify" class="lb" value="gly">院系 <input
					type="radio" name="identify" value="cjgly" class="lb">高校<br>
				<span id="button">登录 </span>
			</form>
		</div>
	</div>

	<div class="top">

		<div class="box">
			<div>
				<span><a href="new_file.html">设为首页</a></span> <span
					style="color: #ffffff">|</span> <span><a href="##">加入收藏</a></span>
				<span style="float: right;"><a href="javascript:" id="dl"
					onClick="openme()" class="sel">高校</a></span> <span
					style="float: right; color: #ffffff">|</span> <span
					style="float: right;"><a href="javascript:"
					onClick="openme()"  class="sel">院系</a></span> <span
					style="float: right; color: #ffffff">|</span> <span
					style="float: right;"><a href="javascript:"
					onClick="openme()"  class="sel">学生</a></span>
			</div>
		</div>
		<div class="box1">
			<h1>高校积分管理系统</h1>
		</div>

		<hr>
		<div class="box3">
			<ul class="nav">
				<li><a href="##">网站首页</a></li>
				<li><a href="objcompetion.do?lb=1">学科竞赛</a></li>
				<li><a href="objcompetion.do?lb=2">科研立项</a></li>
				<li><a href="javascript:" class="paperpublish">论文发表</a></li>
				<li><a href="javascript:" class="patentpublish">专利申请</a></li>
			</ul>
		</div>
	</div>
	<div class=tupian>
		<img id="im" alt="" src="images/shousy.png" width="500px"
			height="500px">
	</div>

	<div class="bottom">
		<div class="botton-left1">
			<div id="one">
				<span class="bottom01" id="bottonimgone">
					<a href="javascript:void(0)">参赛队员风采</a>
				</span> 
				<span class="bottom02" id="bottonimgtwo">
					<a href="javascript:void(0)">获奖作品展示</a>
				</span> 
				<span class="bottom-gd1">
					<a href="shoudetailshtml/showcolor.html" style="color: #91918d" target="_blank">更多>></a>
				</span>
			</div>

			<div id="botton-one">
				<span class="bottom-a"> <img class="bottom-a"
					src="images/show2.png" />
				</span>
				<div class="bottom-left-word">
					<ul>
						<li>刘 鹏，洛阳，李俊杰</li>
						<li>第六届“中国软件杯”我校参赛选手</li>
						<li>荣获安徽省赛区一等奖</li>
						<li>2017年8月17日拍摄于中国科学技术大学</li>
					</ul>
				</div>
			</div>

			<div class="botton-two">
				<img alt="tupian" class="botton-two-one" id="images"
					src="images/show1.png">
			</div>
		</div>

		<div class="bottom-right">
			<div>
				<span class="botton-js">竞赛通知</span>
			</div>
			<div class="tzo">
				<ul class="tz">
					<li><a href="shoudetailshtml/xq1.html" target="_blank">我校在2015安徽省高校物联网应用创新大赛中取得优异成绩</a>
					<hr></li>
					<li><a href="shoudetailshtml/xq2.html" target="_blank">我校获得第九届全国大学生结构设计竞赛一等奖和最佳创新奖</a>
					<hr></li>
					<li><a href="shoudetailshtml/xq3.html" target="_blank">我校在第六届“蓝桥杯”全国软件设计大赛（安徽赛区）取得佳绩</a>
					<hr></li>
					<li><a href="shoudetailshtml/xq4.html" target="_blank">机械工程学院召开学生座谈会安排布置学科竞赛工作</a>
					<hr></li>

				</ul>
			</div>
		</div>
	</div>
</body>

<script src="jquery-1.11.3/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var iden = $(".sel");
		var iden1 = $(".lb");
			$(iden[0]).click(function(){
				if($(iden[0]).text()=='高校')
					$(iden1[2]).prop("checked",true);
			})
			$(iden[0]).click(function(){
				if($(iden[1]).text()=='院系'){
					$(iden1[1]).prop("checked",true);
				}
			})
			$(iden[0]).click(function(){
				if($(iden[2]).text()=='学生'){
					$(iden1[0]).prop("checked",true);
				}
			})
			
		$(".tz a").hover(function(){
			$(this).css({"backgroundColor":"#198995","color":"white"});
		},function(){
			$(this).css({"backgroundColor":"","color":""})
			})
		$("#button").mouseover(function() {
			$(this).css("backgroundColor", "blue")
		});
		$("#button").mouseout(function() {
			$(this).css("backgroundColor", "")
		});

	
	})
	$(function() {
		
		$(".paperpublish").click(function(){
			if("${sessionScope.student == null}"=='true'){
				alert("请先登录");
			}else{
				window.location.href="StuGetPaper";
			}
		})
		$(".patentpublish").click(function(){
			if("${sessionScope.student == null}"=='true'){
				alert("请先登录");
			}else{
				window.location.href="StuGetPatent";
			}
		})
		//登录操作
		$("#button").click(
				function() {
					var sno = $("#inputone").val();
					var pass = $("#inputtwo").val();
					var identify = $("input[name='identify']:checked").val();

					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/login.do",
						data : "name=" + sno + "&passward=" + pass
								+ "&identify=" + identify,
						success : function(msg) {
							var obj = eval("(" + msg + ")");
							if (obj.flag == "success1") {
								window.location.href = "StuAllInfo";
							} else if (obj.flag == "success2") {
								window.location.href = "manager/manager.jsp";
							} else if (obj.flag == "success3") {
								window.location.href = "supermanager.jsp";
							} else if (obj.flag == "error") {
								$(".sp1").text("该身份的账号不存在");
							}else if(obj.flag=="mmerror"){
								$(".sp1").text("密码错误");
							}else if(obj.flag=="blank"){
								$(".sp1").text("学号或密码不能为空");
							}
						},
						error : function() {
							alert("请联系管理员");
						},
					})
				});
	})

	//弹出登录框
	function openme() {
		$("<div class='dark'></div>").prependTo("body").css({
			"height" : $(document).outerHeight(true),
			"width": "100%",
			"z-index" : "1000",
			"position" : "absolute",
			"background-color" : "gray",
			"opacity" : "0.8"
		})
		document.getElementById('div2').style.display = 'block';
	}
	function closeme() {
		$(".dark").hide();
		document.getElementById('div2').style.display = 'none';
	}
	//参赛队员风采和	获奖作品展示 模块显示与隐藏
	var bo = document.getElementById("botton-one");
	var bottonimgone = document.getElementById("bottonimgone");
	var bottonimgtwo = document.getElementById("bottonimgtwo");
	var images = document.getElementById("images");
	bottonimgone.onclick = function() {
		bo.style.display = "block";
		images.style.display = "none";
	}
	
	bottonimgtwo.onclick = function() {
		images.style.display = "block";
		bo.style.display = "none";

		//window.setInterval(setChange, 1000);

	}
	var n = 0; //获奖作品展示 图片自动切换
	function setChange() {
		n++;
		if (n >= imag.length) {
			n = 0;
		}
		images.src = imag[n];
	}
	//中间图片切换
	var arr = [ "images/shousy.png", "images/shoub.jpg", "images/shouc.jpg" ];
	var im = document.getElementById("im");

	var i = 0;
	function change() {
		i++;
		if (i >= arr.length) {
			i = 0;
		}
		im.src = arr[i];
	}
	window.setInterval("change()", 3000);
	
	
	//为下面点击的按钮变色
	$(".bottom-gd1").hover(function(){$(this).css("backgroundColor","#3dbcdf")},function(){$(this).css("backgroundColor","")})
	/*var one = document.getElementById("one");
	var arr1 = one.getElementsByTagName("a");
	for (var i = 0; i < arr1.length; i++) {
		arr1[i].index = i; //為每個数组里的超链接设置标记
		arr1[i].onclick = function() {
			index = this.index; //获取当前超链接元素
			seta();
		}
	}
	function seta() {
		for (var i = 0; i < arr.length; i++) {
			arr1[i].style.backgroundColor = ""; //将每个超链接变为原来颜色
			arr1[0].style.backgroundColor = "#b0c4de";

		}
		arr1[index].style.backgroundColor = "#3dbcdf" //点击的当前超链接赋上新颜色
		if (index == 2) {
			arr1[2].style.color = "white";
		} else {
			arr1[2].style.color = "";
		}
	}*/
</script>
</html>