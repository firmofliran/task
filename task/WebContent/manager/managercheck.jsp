<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核获奖信息</title>
</head>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

a {
	text-decoration: none;
}
#uploadschool{
	display: inline-block;
	height:40px;
	background-color: #0e5a80;
	float:right;
	cursor:pointer;
	color:white;
	border-radius:10px;
	margin-right: 10px;
}
#uploadschool:hover{
	background-color: #0a1d77;
}
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
.check{
	color:#3d6666;
	font-style: italic;
	
}
.trone:nth-of-type(odd){
	background: #dbdbdb;
}
.div-table {
	border: 4px solid #c3eae7;
	text-align: center;
}

.table {
	width: 100%;
	line-height: 40px;
}

.yes,.no{
width:90%;
height:35px;
background-color: #64cece;
color:white;
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
/*给获取到的比赛编号隐藏*/
.hide{
	display: none;
}
/*全选 全不选样式*/
.allcheck{
	width: 20px;
    height: 20px;;
}
.result {
	color: #3f9533;
	padding: 40px 0;
	text-align: center;
	background: #dbdbdb;
	
}

</style>
<script src="jquery-1.11.3/jquery.js"></script>
<script type="text/javascript">

		//通过学号sno，比赛编号pid，找到相对应的并修改标志位
			$(function(){
				//院系审核通过
			$(".yes").click(function(){
				var sno = $(this).parent().siblings(":eq(0)").text().trim();
				var pid = $(this).parent().siblings(":eq(5)").text().trim();
				thisyes=this;
				success('2', sno , pid )
			});
			//院系审核不通过
			$(".no").click(function(){
				var sno = $(this).parent().siblings(":eq(0)").text().trim();
				var pid = $(this).parent().siblings(":eq(5)").text().trim();
				thisno=this;
				success('1', sno , pid )
			});
			/*$(".yesup").click(function(){
				var sno = $(this).parent().siblings(":eq(0)").text().trim();
				var pid = $(this).parent().siblings(":eq(5)").text().trim();
				alert(sno+pid)
				success('3', sno , pid )
			});*/
	})
			function success(sign, sno , pid ){
			//var buttonno=document.querySelectorAll(".buttonno");
			//var departcheck=document.querySelectorAll(".departcheck");
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
						//alert("成功审核");
						var $no=$(thisyes).parent().prev().prev().text("审核已通过").css("color","gray");;
					}else if(obj.flag=='false'){
						//alert("审核失败");
						var $no=$(thisno).parent().prev().text("审核未通过").css("color","orange");
					}else{
						alert("上传校方成功");
					}
				}
			}
			xhr.open("get","LookImageservlet?sign="+sign+"&sno="+sno+"&pid="+pid,true);
			xhr.send(null);
			}
		}
		$(function(){
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
			
			//选择所有上传给校方
			$("#chooseall").click(function(){
				if($(this).prop("checked")){
					$(".stucheck").prop("checked",true)
				}else{
					$(".stucheck").prop("checked",false)
				}
			})
			$("#uploadschool").click(function(){
				var str = "";
				
				 $(".stucheck:checked").each(function(index,obj){
					var value = $(obj).val().trim();
					 str=str+value+",";
				})
				str=str.substring(0, str.lastIndexOf(","));
				if(str==""){
					alert("请选择你想上传的学生");
					return;
				}
				if(confirm("确定上传给校方吗")){
				 $.ajax({
					 url:"${pageContext.request.contextPath}/LookImageservlet",
					 type:"get",
					 data:"sign=3&snopid="+str,
					 success:function(data){
						 var json = eval("("+data+")")
						if(json.flag=='success1'){
							alert("全部上传成功");
							/* var arrCheckbox=$(".stucheck");
							for(var i in arrCheckbox){
								if($(arrCheckbox[i]).is(':checked')){
									 $(arrCheckbox[i]).next().text("已上传校方(未批)");
				 }
								
							};return
							var single = str.split(",");
							var trone = $(".trone");
							alert(trone.length)
							
							for (var i = 0; i < single.length; i++) {
								var split = single[i].split("-");
								var sno = split[0];
								var pid = split[1];
								var sp =sno+pid
								for(var i ;trone.length;i++){
									var alltd = $(trone[i]).children();
									var snid = alltd.eq(0).text()+alltd.eq(5).text()
									if(snid==sp){
										$(alltd[15]).text("已上传校方(未批)")
									}
								}
							} */
						}else {
							alert("请选择你想上传的学生")
							
						}
					 }
				 })
				 }
			})
			/*$("#nochooseall").click(function(){
				$(".stucheck").prop("checked",false)
			})*/
		})
</script>
<body>
	<div class="top">
		<span>学生获奖信息审核</span> <a href="manager/manager.jsp" class="top-right">返回主界面</a><span id="uploadschool">上传校方</span>
	</div>
	<div class="div-table">
		<table class="table" border="10px" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>学院</th>
				<th>银行卡号</th>
				<th >比赛编号</th>
				<th>比赛名称</th>
				<th>比赛类别</th>
				<th>比赛积分</th>
				<th>获奖等级</th>
				<!--  <th>标志位</th>-->
				<th>上传的图片</th>
				<th>审核情况</th>
				<th colspan="2">操作</th>
				<th><input type="checkbox" class="allcheck" id="chooseall">所有</th>
				<th>是否上传校方</th>
			</tr>
			<c:if test="${requestScope.yesornoblank =='blank' }">
				<div class="result">暂无学生上传获奖信息</div>
			</c:if>
			<c:if test="${requestScope.yesornoblank !='blank' }">
			<c:forEach items="${requestScope.listallupload }" var="single">
				<tr class="trone">
					<td>${single.sno}</td>
					<td>${single.name}</td>
					<td>${single.sclass}</td>
					<td>${single.depart}</td>
					<td>${single.bankcard}</td>
					<!--  class="hide" -->
					<td>${single.pid}</td>
					<td>${single.comname}</td>
					<td>${single.category}</td>
					<td>${single.score}</td>
					<td>${single.grade}</td>
					
					
					<!-- <td>${single.sign}</td> -->
					<!-- <a href="${pageContext.request.contextPath}/LookImageservlet?imagename=${single.imagename}&sign=image" > -->
					<td><a href="javascript:" class="check"><input type="hidden"
							value="${single.imagename}">查看获奖图片</a></td>

					<!-- 当上传校方标志位变为3，校方审核不通过是4，通过是5，但此时院方审核是一直通过的 -->
					<c:choose>
						<c:when test="${single.sign eq '0'}">
							<td style="color: red">未审核</td>
						</c:when>
						<c:when test="${single.sign eq '1'}">
							<td style="color: orange">审核未通过</td>
						</c:when>
						<c:when test="${single.sign eq '2'}">
							<td style="color: gray">审核已通过</td>
						</c:when>
						<c:when test="${single.sign eq '3'}">
							<td style="color: gray">审核已通过</td>
						</c:when>
						<c:when test="${single.sign eq '4'}">
							<td style="color: gray">审核已通过</td>
						</c:when>
						<c:when test="${single.sign eq '5'}">
							<td style="color: gray">审核已通过</td>
						</c:when>
					</c:choose>

					<td class="buttonno"><input type="button" value="审核不通过" class="no" ></td>

					<td><input type="button" value="审核通过" class="yes"></td>

					<!--  <td><input type="button" value="上传给校方" class="yesup"></td>-->
					<td><input type="checkbox" class="allcheck stucheck" value="${single.sno}-${single.pid}"> </td>


					<!-- 标志位为3,4,5都为上传校方成功 -->
					
						
					<c:choose>
							<c:when test="${single.sign eq '0'||single.sign eq '1'||single.sign eq '2'}">
								<td style="color: gray">未上传校方</td>
							</c:when>
							<c:when test="${single.sign eq '3'}">
								<td style="color: #3fa9e7;font-weight:600">已上传校方(未批)</td>
							</c:when>
							<c:when test="${single.sign eq '4'}">
								<td style="color: red;font-weight:600">校方审核未通过</td>
							</c:when>
							<c:when test="${single.sign eq '5'}">
								<td style="color: #0e4d93;font-weight:600">校方审核已通过</td>
							</c:when>
						</c:choose>
				</tr>
			</c:forEach>
			</c:if>
		</table>
		
	</div>

</body>
</html>