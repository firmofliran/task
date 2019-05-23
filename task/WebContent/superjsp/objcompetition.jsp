<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学科竞赛</title>
</head>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}
.top-li li{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.top-one {
	height: 30px;
	background-color: #98a6e4;
	letter-spacing: 20px;
}

#button-one {
	background-color: #223fc9;
}

.top-two {
	color: #6f6569;
	font-size: xx-large;
	padding-left: 40%;
	background-color: #e8f0f3;
}

.leibie {
	font-size: 20px;
	cursor: pointer;
	letter-spacing: 5px;
	color: white;
}

.top {
	width: 100%;
	background-color: white;
	overflow: auto;
}

.top-li {
	position: relative;
	background-color: #efefe6;
	width: 23%;
	height:380px;
	color:#454f55;
	font-weight:600;
	border: 2px gray solid;
	float: left;
	line-height: 30px;
	margin: 5% 5% 2% 5%;
}

.top-li img {
	margin-right:0px;
	width: 100%;
	height: 200px;
	border-radius:10px;
}

.detail {
	text-decoration: none;
	color: #4291a7;
}

#b, #c, #d {
	display: none;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		var bo = document.getElementById("button")
		//得到四个按钮节点
		var arr = bo.getElementsByTagName("span");
		//得到四个类别div节点
		var a = document.getElementById("a");
		var b = document.getElementById("b");
		var c = document.getElementById("c");
		var d = document.getElementById("d");
		var arrdiv = [ a, b, c, d ];
		for (var i = 0; i < arr.length; i++) {
			arr[i].onclick = function() {
				//为ABCD每个上色
				for (var j = 0; j < arr.length; j++) {
					arr[j].style.backgroundColor = "";
					arr[0].style.backgroundColor = "#98a6e4";
					//arr[j].style.color = "";
				}
				this.style.backgroundColor = "#223fc9";
				//按不同的按钮显示不同的内容
				for (var n = 0; n < arrdiv.length; n++) {
					arrdiv[n].style.display = "none";
				}
				if (arr[0] == this) {
					arrdiv[0].style.display = "block"
				}
				if (arr[1] == this) {
					arrdiv[1].style.display = "block"
				}
				if (arr[2] == this) {
					arrdiv[2].style.display = "block"
				}
				if (arr[3] == this) {
					arrdiv[3].style.display = "block"
				}
			}
		}
		var arra = document.getElementsByTagName("a");
		for (var i = 0; i < arra.length; i++) {
			arra[i].onmouseover = function() {
				this.style.color = "blue";
			}
			arra[i].onmouseout = function() {
				this.style.color = "";
			}
		}
	}
</script>
<script src="jquery-1.11.3/jquery.js"></script>
<script>
	$(function() {
		$(".top").css("height",$(window).height()-80);
		$(".leibie").mouseenter(function() {
			$(this).css({border: "1px",
			borderColor: "gray",
			borderStyle: "solid"});})
			$(".leibie").mouseleave(function() {
				$(this).css({border: "",
					borderColor: "",
					borderStyle: ""});
		});
	})
</script>
<body>
	<div class="top-two">学科竞赛区</div>
	<div class="top-one" id="button">
		<a href="shou.jsp" class="leibie">-网站首页-</a> <span id="button-one"
			class="leibie">A类赛事</span> <span class="leibie">B类赛事</span> <span
			class="leibie">C类赛事</span> <span class="leibie">D类赛事</span>
	</div>


	<div class="top">

		<div id="a">
			<c:forEach items="${requestScope.listpc}" var="pc">
				<c:if test="${pc.grade=='A类'}">
					<div class="top-li">
					<!-- <img src="images/d1.jpg"> -->
					<img src="/publishimg/${pc.filename }">
						<ul>
							<li>赛事名称:${pc.pname}</li>
							<li>赛事积分:${pc.score}分</li>
							<li>赛事时间:${pc.publishtime}</li>
							<li><a class="detail" target="_blank"
								href="${pageContext.request.contextPath}/DetailInfoServlet?pid=${pc.pid}&sign=1">查看详情</a></li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
 		</div>

		<div id="b">
			<c:forEach items="${requestScope.listpc}" var="pc">
				<c:if test="${pc.grade=='B类' }">
					<div class="top-li">
					<img src="/publishimg/${pc.filename }">
						<ul>
							<li>赛事名称:${pc.pname}</li>
							<li>赛事积分:${pc.score}分</li>
							<li><a class="detail" target="_blank"
								href="${pageContext.request.contextPath}/DetailInfoServlet?pid=${pc.pid}&sign=1">查看详情</a></li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div id="c">
			<c:forEach items="${requestScope.listpc}" var="pc">
				<c:if test="${pc.grade=='C类'}">
					<div class="top-li">
					<img src="/publishimg/${pc.filename }">
						<ul>
							<li>赛事名称:${pc.pname}</li>
							<li>赛事积分:${pc.score}分</li>
							<li><a class="detail" target="_blank"
								href="${pageContext.request.contextPath}/DetailInfoServlet?pid=${pc.pid}&sign=1">查看详情</a>
							</li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div id="d">
			<c:forEach items="${requestScope.listpc}" var="pc">
				<c:if test="${pc.grade=='D类'}">
				<div class="top-li">
					<img src="images/shoub.jpg">
					<ul class="top-li">
						<li>赛事名称:${pc.pname}</li>
						<li>赛事积分:${pc.score}分</li>
						<li><a class="detail" target="_blank"
							href="${pageContext.request.contextPath}/DetailInfoServlet?pid=${pc.pid}&sign=1">查看详情</a>
						</li>
					</ul>
				</div>
				</c:if>
			</c:forEach>
		</div>

	</div>
</body>
</html>
