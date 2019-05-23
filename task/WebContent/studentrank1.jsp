<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看学生排名</title>
</head>
<!--表的样式-->
<style type="text/css">
.even {
	background-color: #9d9d9d;
}

.odd {
	background-color: #dddddd;
}

th {
	font-size: 30px;
	font-family: "宋体";
}

.table {
	text-align: center;
	line-height: 50px;
	margin-bottom: 30px;
}
</style>
<!--表的上方样式-->
<style type="text/css">
* {
	margin: 0;
	text-decoration: none;
}

.top {
	padding: 2px 0;
	background-color: blue;
	width: 100%;
	height: 24px;
	font-size: 20px;
}

.one {
	color: white;
}

.one:HOVER {
	color: orange;
}

.ss {
	height: 21px;
	color: white;
	float: right;
}

.ss:HOVER {
	color: orange;
}

.two {
	font-size: xx-large;
	text-align: center;
	font-style: oblique;
}

.three {
	text-align: center;
}

.three a {
	font-size: 22px;
	color: gray;
}

a:HOVER {
	color: orange;
}

.ziti {
	color: gray;;
	font-weight: bolder;
}

.table-pm {
	margin: 0 auto;
	width: 80%;
}

.table-pm tr:FIRST-CHILD {
	background-color: #8aaac0;
	color: white;
}

.table-content {
	font-size: 20px
}

.search1 {
	text-align: center;
	background-color: #1797d9;
	color: white;
}
.outdata{
	padding: 0 4px;
	background-color:#8dadb0;
	border: 2px solid #dfe3e6;
}
.outdata:hover{
	background-color: blue;
	cursor: pointer;
}
.search1-last {
	background: #88a798;
	display: inline-block;
	width: 50px;
}
.search1-last:hover {
	background-color: #4c5552;
}

.tableone {
	display: none;
}

.table-button {
	font-size: 20px;
	background-color: #8aaac0
}

.table-button span {
	margin: 0 15px;
}

.table-button a {
	color: #0d18ef;
}

.table-button a:hover {
	color: #2d6b10;
}

#pagesize {
	display: inline;
}

.table-option {
	height: 25px;
	font-size: 20px;
}
</style>
<!-- 导出excel层的样式 -->
<style type="text/css">


.excel {
	position: relative;
	width: 300px;
	background-color: gray;
	display: inline-block;
	height: 280px;
}

.excel option:hover {
	background-color: #6ab1ee;
	color: white;
}

.head {
	width: 300px;
	height: 30px; position : absolute;
	font-size: 22px;
	position: absolute; font-size : 22px;
	color: white;
	background-color: #89c4f5;
}
.im{
	height:25px;
	float: right;
    margin-top: 3px;
}
.twodiv {
	position:absolute;
	margin: 0 auto;
	padding: 5px 5px;
	width: 610px;
	z-index:10;
	background-color: #d3dfdb;
	display: none;
}

.excel option {
	padding-left: 4px;
}

.excel-posi1 {
	position: absolute;
	left: 0px;
	top: 30px;
}

.excel-posi2 {
	position: absolute;
	left: 0px;
	top: 30px;
}

.excel-one {
	width: 300px;
	height: 250px;
	font-size: 20px;
	color: #137208;
}

.gt {
	background-color: #0eb3a9;
	border:4px solid #b0bfbe;
	color: white;
	margin: 5px 5px;
	padding: 0 4px;
}

.gt:hover {
	color: #5aabda;
	background: #dfe3e6;
	cursor: pointer;
}

.down{text-align: center;}
.dark {
	width: 100%;
	z-index: 2;
	position: absolute;
	background-color: gray;
	opacity: 0.7;
}
</style>
<body>
	<div class="top">
		<span><a href="#" class="one">设为首页加入收藏</a></span> <span><a
			href="#" class="ss">学生</a></span> <span><a href="#" class="ss">院系|</a></span>
		<span><a href="#" class="ss">高校|</a></span>

	</div>
	<div class="two">高校创新积分管理系统</div>
	<hr>
	<div class="three">
		<span><a href="${pageContext.request.contextPath}/shou.jsp">网站首页</a></span>&nbsp;&nbsp;&nbsp;
		<span><a
			href="${pageContext.request.contextPath}/objcompetion.do?lb=1">学科竞赛</a></span>&nbsp;&nbsp;&nbsp;
		<span><a
			href="${pageContext.request.contextPath}/objcompetion.do?lb=2">科研立项</a></span>&nbsp;&nbsp;&nbsp;
		<span><a
			href="${pageContext.request.contextPath}/studentinfo/publishpaper.html">论文发表</a></span>&nbsp;&nbsp;&nbsp;
		<span><a
			href="${pageContext.request.contextPath}/studentinfo/patent.html">专利申请</a></span>&nbsp;&nbsp;&nbsp;
		<hr>
	</div>
	<div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="ziti">当前排名
		</a> &nbsp;&nbsp;&nbsp; <a href="#" class="ziti">最新发布 </a>&nbsp;&nbsp;&nbsp;
		<a href="#" class="ziti">2017 </a>&nbsp;&nbsp;&nbsp; <a href="#"
			class="ziti">2016 </a>&nbsp;&nbsp;&nbsp; <a href="#" class="ziti">2015
		</a>
	</div>
	<hr>
	<div class="search1">
		<span>请输入你想查询的学号</span><input type="text" name="sno" id="cx">
		<span onclick="search()" class="search1-last">查询</span> <span
			class="outdata">导出数据</span>
	</div>
	<div class="table" id="stu">
		<table border="1" cellspacing="2" class="table-pm">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>所在院系</th>
				<!-- <th>团队成员</th>
				<th>最近参赛</th> -->
				<th>总积分</th>
				<th>排名</th>
			</tr>

			<c:forEach items="${splitentity.listsplitpage}" var="rank" varStatus="pm">
				<tr class="${pm.count%2==0?'odd':'even'} table-content">
					<td>${rank.sno }</td>
					<td>${rank.name }</td>
					<td>${rank.department}</td>
					<td>${rank.score }</td>
					<%-- <td>${rank.member }</td>
					<td>${rank.competition }</td>--%>
					<td>${rank.sturank}</td> 
				</tr>
			</c:forEach>
			<tr class="table-button">
				<td colspan="7"><span>总数据数/${splitentity.totalnum}条</span> <c:if
						test="${splitentity.currentpage!='1'}">
						<span><a
							href="SplitPage?currentpage=1&pagesize=${splitentity.pagesize}">首页</a></span>
					</c:if> <c:if test="${splitentity.currentpage=='1'}">
						<span>首页</span>
					</c:if> <c:if test="${splitentity.currentpage !='1'}">
						<span><a
							href="SplitPage?currentpage=${splitentity.currentpage-1 }&pagesize=${splitentity.pagesize}">上一页</a></span>
					</c:if> <c:if test="${splitentity.currentpage =='1'}">
						<span>上一页</span>
					</c:if> <c:if test="${splitentity.currentpage!=splitentity.totalpage}">
						<span><a
							href="SplitPage?currentpage=${splitentity.currentpage+1 }&pagesize=${splitentity.pagesize}">下一页</a></span>
					</c:if> <c:if test="${splitentity.currentpage==splitentity.totalpage}">
						<span>下一页</span>
					</c:if>
					<form action="SplitPage" id="pagesize" method="post">
						一页显示<select name="pagesize" class="table-option">
							<c:forEach begin="5" end="10" step="1" var="p">
								<c:if test="${p==splitentity.pagesize }">
									<option value="${p }" selected="selected">${p }</option>
								</c:if>
								<c:if test="${p!=splitentity.pagesize }">
									<option value="${p }">${p }</option>
								</c:if>
							</c:forEach>
						</select>条数据 <input type="hidden" name="currentpage" value="" class="hide">

					</form> <span>${splitentity.currentpage}/${splitentity.totalpage}页</span>
				</td>
			</tr>
		</table>
	</div>

	<div class="table tableone" id="tablethree">
		<table border="0" cellspacing="2" class="table-pm">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>所在院系</th>
				<th>总积分</th>
				<th>排名</th>
			</tr>
			<tr id="tabletwo" style="background-color: #9d9d9d;"></tr>
		</table>
	</div>
	<!-- 弹出excel层 -->
	<div class="totalexcel" id="outexcel">
		<div class="twodiv">
			<div class="excel">
				<div class="head">未导出字段</div>
				<select size="15" multiple="multiple" class="excel-one excel-posi1"
					id="sel1">
					<option value="学号">学号</option>
					<option value="姓名">姓名</option>
					<option value="所在院系">所在院系</option>
					<option value="总分数">总分数</option>
					<option value="排名">排名</option>
				</select>
			</div>
			<div class="excel">
				<div class="head">已导出字段 <img alt="" src="/task/images/cha.png" class="im"></div>
				<select name="selet" size="15" multiple id="sel2"
					class="excel-one excel-posi2">
					<option value="学号">学号</option>
					<option value="姓名">姓名</option>
					<option value="所在院系">所在院系</option>
					<option value="总分数">总分数</option>
					<option value="排名">排名</option>
				</select>
			</div>
			<div class="down">
				<span class="dayin gt">打印excel</span> <span id="allenter" class="gt">全部移入</span>
				<span id="allout" class="gt">全部移除</span>
				<form action="Excelservlet" class="sub" method="post">
		<input  name="selval" id="inputval">
	</form>
			</div>
		</div>
	</div>
</body>
<script src="jquery-1.11.3/jquery.js"></script>
<script>
	//导出excel层和操作
	$(function() {
		var str = "";
		//左边的双击移入
		$("#sel1 option").click(function() {
			$(this).css("display", "none");
			var valsel1 = $(this).val();
			str = str + valsel1 + ",";
			$("#inputval").val(str);
			$("#sel2 option").each(function(index, obj) {
				if ($(this).val() == valsel1) {
					$(this).css("display", "block");
				}
			})
		});
		//右边的双击移除
		$("#sel2 option").click(function() {
			$(this).css("display", "none");
			$(this).attr("selected", false);
			var valsel2 = $(this).val();
			$("#sel1 option").each(function() {
				if ($(this).val() == valsel2) {
					$(this).css("display", "block")
				}
			})
		})
		//提交到后台
		$("#sel2 option").css("display", "none");
		$(".dayin").click(function() {
			$(".sub").submit();
		})
		//右边所有项全部移入
		var all = "";
		$("#allenter").click(function() {
			$("#sel2 option").css("display", "block");
			$("#sel1 option").css("display", "none");
			all = "";
			$("#sel2 option").each(function() {
				all = all + $(this).val() + ",";
			})
			$("#inputval").val("");
			$("#inputval").val(all);
		})
		//右边所有项全部移出
		$("#allout").click(function() {
			$("#sel2 option").css("display", "none");
			$("#sel1 option").css("display", "block");

			all = "";
			$("#inputval").val(all);
		})
		$(".outdata").click(function(){
			$(".twodiv").css("display","block");
			$("<div class='dark'></div>").css("height",
					$(document).outerHeight())
					.insertBefore("body");
			//让报名弹出层在当前滚动页面的中心显示
			var _scrollHeight = $("html").scrollTop();//获取当前窗口距离页面顶部高度 
			_windowHeight = $(window).height();//获取当前窗口高度 
			var bm = $(".twodiv");

			_windowWidth = $(window).width();//获取当前窗口宽度 
			_popupHeight = bm.height();//获取弹出层高度 
			_popupWeight = bm.width();//获取弹出层宽度 
			_posiTop = (_windowHeight - _popupHeight) / 2
					+ _scrollHeight;
			_posiLeft = (_windowWidth - _popupWeight) / 2;
			$(".twodiv").css({
				"left" : _posiLeft,
				"top" : _posiTop,
			});
			$("body").css("overflow","hidden");
			
		})
		$(".im").click(function(){
			$(".twodiv").css("display","none");
			$(".dark").remove();
			//遮罩层隐藏后浏览器恢复可滚动
			$('body').css('overflow', "auto");
		})
		
		
	})
</script>
<script type="text/javascript">
	$(".hide").val("${splitentity.currentpage}");
	var arr = document.getElementsByTagName("a");
	$("#pagesize select").change(function() {
		$("#pagesize").submit();
	})

	for (var i = 0; i < arr.length; i++) {
		arr[i].index = i; //為每個数组里的超链接设置标记
		arr[i].onclick = function() {
			index = this.index; //获取当前超链接元素
			seta();
		}
	}
	function seta() {
		for (var i = 0; i < arr.length; i++) {
			arr[i].style.backgroundColor = ""; //将每个超链接变为原来颜色
		}
		arr[index].style.backgroundColor = "#dddddd" //点击的当前超链接赋上新颜色
	}
	//查询学生
	function search() {
		var search = document.getElementById("cx").value;
		var xhr = null;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var json = xhr.responseText;
					var jsonobj = eval("(" + json + ")");

					if (jsonobj.flag == false) {
						alert("您输入的有误，请检查后再输入")
					} else {
						var stu = document.getElementById("stu");
						stu.style.display = "none";
						var tabletwo = document.getElementById("tabletwo");
						var tablethree = document.getElementById("tablethree");
						tablethree.style.display = "block";
						//var html="<td>"+jsonobj.stuno+"</td><td>"+jsonobj.name+"</td><td>"+jsonobj.department+"</td><td>"+jsonobj.member+"</td><td>"+jsonobj.competition+"</td><td>"+jsonobj.score+"</td>"
						tabletwo.innerHTML = "<td>" + jsonobj.sno
								+ "</td><td>" + jsonobj.name + "</td><td>"
								+ jsonobj.department + "</td><td>"
								+ jsonobj.score + "</td>";
					}
				}
			}//{"stuno":"+rank.getStuno+","name":"+rank.getName+","department":"+rank.getDepartment+","member":"+rank.getMember+","competition":"+rank.getCompetition+","score":"+rank.getScore+"}

		}
		xhr.open("get", "search.do?search=" + search, true);
		xhr.send();
	}
</script>
</html>
