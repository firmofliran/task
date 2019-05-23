<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高校审核</title>
</head>
<style type="text/css">
*{margin: 0px;
padding: 0px;
}
a{text-decoration: none;}
.top {
	Width: 100%;
	font-size: x-large;
	height: 40px;
	background-color: #97b3a8;
	text-align: center;
	text-shadow: 2px 2px 5px white;
	color: #425a65;
}

.top-right {
	float: left;
	padding-left: 10px;
	color: white;
	text-shadow: 2px 2px 5px blue;
	color: white;
}
.yes,.no{
width:90%;
height:35px;
background-color: #64cece;
color:white;
}
.check{
	color:#3d6666;
	font-style: italic;
	
}
.trone:nth-of-type(odd){
	background: #bfbfbf;
	color:white;
}
.after{
background: white;
}
.hide{
	display: none;
}
.table {
	width: 100%;
	line-height: 40px;
	text-align: center;
}
/*设置弹出图片*/
.checkimg>img {
	width:800px;
	height: 400px;
	position: relative;
	z-index:5;
}
/*叉图片的位置*/
.checkimg .first {
	float: right;
	width:35px;
	height:35px;
}
.load{position: relative;
	z-index:3;
	left:50px;
	top:100px;
	font-size: 25px;
	color: #0a6a95;
}
/*遮罩层的样式*/
.dark {
	width: 100%;
	position: absolute;
	z-index: 1;
	opacity: 0.7;
	background-color: bLack;
}
/*学生获奖信息的学号和姓名*/
.infohead{
	letter-spacing: 1px;
	color:white;
	margin-right: 10px;
	text-shadow: 0px 0px 2px white;
}
</style>
<script src="jquery-1.11.3/jquery.js"></script>
<script type="text/javascript">
		$(function(){
//院系审核通过
		$(".yes").click(function(){
			var sno = $(this).parent().siblings(":eq(0)").text().trim();
			var pid = $(this).parent().siblings(":eq(5)").text().trim();
			thisyes=this;
			success('5', sno , pid )
		});
		//院系审核不通过
		$(".no").click(function(){
			var sno = $(this).parent().siblings(":eq(0)").text().trim();
			var pid = $(this).parent().siblings(":eq(5)").text().trim();
			thisno=this;
			success('4', sno , pid )
		});
		//通过学号sno，比赛编号pid，找到相对应的并修改标志位
		function success(sign, sno , pid ){
			if(confirm("确定您的决定吗")){
			var xhr=null;
			 if(window.ActiveXObject) {
		         xhr= new ActiveXObject("Microsoft.XMLHTTP");
			}else if (window.XMLHttpRequest) {
		         xhr= new XMLHttpRequest();
		}
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var json=xhr.responseText
					var obj=eval("("+json+")");
					if(obj.flag=='success'){
						alert("成功审核");
						$(thisyes).parent().prev().prev().text("审核已通过").css("color","gray");
					}else if(obj.flag=='false'){
						alert("审核未通过");
						$(thisno).parent().prev().text("审核没通过").css("color","orange");
					}else if(obj.flag=='blank'){
						alert("数据库表中不存在此学生");
					}else{
						alert("上传校方成功");
					}
				}
			}
			xhr.open("get","LookImageservlet?sign="+sign+"&sno="+sno+"&pid="+pid,true);
			xhr.send(null);
		}
		}
		//查看图片时的效果：弹出图片和遮罩层
		$(".check").click(function(){
			var value = $(this).find("input").val();
			var sno = $(this).parent().siblings(":eq(0)").text();
			var name = $(this).parent().siblings(":eq(1)").text();
			$('<div class="checkimg"><div><span class="load">正在加载...</span><span class="infohead">学号:'+sno+'</span><span class="infohead">姓名:'+name+'的获奖信息</span>'
			+'<img src="images/cha.png" class="first"></div><img src="/uploadimages/'+value+'"></div>').prependTo("body");
			$(".checkimg").css({
			"z-index" : "2",
			"position" : "absolute",
			"height":"435px",
			"width":"800px",
			"backgroundColor": "#7d8284"
		});
		
		$("<div class='dark'></div>").css("height",
				$(document).outerHeight())
				.insertBefore("body")
		//让报名弹出层在当前滚动页面的中心显示
		var _scrollHeight = $("html").scrollTop();//获取当前窗口距离页面顶部高度 
		_windowHeight = $(window).height();//获取当前窗口高度 
		var bm = $(".checkimg");

		_windowWidth = $(window).width();//获取当前窗口宽度 
		_popupHeight = bm.height();//获取弹出层高度 
		_popupWeight = bm.width();//获取弹出层宽度 
		_posiTop = (_windowHeight - _popupHeight) / 2
				+ _scrollHeight;
		_posiLeft = (_windowWidth - _popupWeight) / 2;
		$(".checkimg").css({
			"left" : _posiLeft,
			"top" : _posiTop,
		});
		$(".first").click(function(){
		$(".checkimg").remove();
		$(".dark").remove();
		})
		})
		})
</script>
<body>
	<div class="top">
		<a href="${pageContext.request.contextPath}/supermanager.jsp" class="top-right">返回主界面</a>
		<span>校方审核学生获奖信息</span> 
	</div>
	<table class="table"  border="10px" cellspacing="0">
		<tr><th>学号</th>
		<th>姓名</th>
		<th>班级</th>
		<th>学院</th>
		<th>银行卡号</th>
		<th >比赛编号</th>
		<th>比赛名称</th>
		<th>比赛类别</th>
		<th>比赛积分</th>
		<th>获奖等级</th>
		<!-- <th>标志位</th> -->
		<th>上传的图片</th>
		<th>审核情况</th>
		<th colspan="2">操作</th>
		</tr>
		<c:forEach items="${requestScope.list }" var="single">
		<tr class="trone">
		<td>${single.sno}</td>
		<td>${single.name}</td>
		<td>${single.sclass}</td>
		<td>${single.depart}</td>
		<td>${single.bankcard}</td>
		<td>${single.pid}</td>
		<td>${single.comname}</td>
		<td>${single.category}</td>
		<td>${single.score}</td>
		<td>${single.grade}</td>
		<%-- <td>${single.sign}</td> --%>
		<td class="after"><a href="javascript:" class="check"><input type="hidden"
							value="${single.imagename}">查看获奖图片</a></td>
		<c:if test="${single.sign eq '3'}"><td class="after" style="color:red" >未审核</td></c:if>
		<c:if test="${single.sign eq '4'}"><td class="after" style="color:orange">审核未通过</td></c:if>
		<c:if test="${single.sign eq '5'}"><td class="after" style="color:gray">审核通过</td></c:if>
		<td class="after"><input type="button" value="审核不通过" class="no"></td>
		<td class="after"><input type="button" value="审核通过" class="yes" ></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>