<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分配指导老师</title>
</head>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}
.category label{
	font-size: 30px;
}
.category {
	margin: 20px 0 20px;
}

a {
	text-decoration: none;
}

.top {
	Width: 100%;
	font-size: x-large;
	height: 40px;
	text-align: center;
	text-shadow: 2px 2px 5px white;
	color:#425a65;
	background-color: #47a5ce;
}

.top-right {
	float: left;
	color:white;
	text-shadow: 2px 2px 5px blue;
}
#loading{font-size: 20px;
	font-weight: 500;
	color:#ec5f20;
	margin-left: 30px}
.jz{position: relative;
	top:4px;
}
.div-table {
	border: 4px;
	border-color: #c3eae7;
	border-style: solid;
}

.table {
	width: 100%;
	line-height: 40px;
	text-align: center;
}

.compe {
	display: none
}

.cx {
	display: none;
	font-size: 20px;
	background-color: #456f84;
	padding: 0 5px;
	color: white;
	cursor: pointer;
	border-radius:10%;
}

.cx:hover {
	background-color: #5e9dbd;
}

input {
	width: 100%;
	height: 40px;
}
.result {
	margin: 50px 20px 0 20px;
	color: #3f9533;
	padding: 40px 0;
	text-align: center;
	background: #dbdbdb;
	
}
.sure{
	background-color: #37b8e2;
	border:2px solid #54656a;
	color: white;
	margin-left: 10px;
	cursor: pointer;
	border-radius:10%;
}
.sure:hover{
	background-color: #448b7e;
}
.hide{
	display: none;
}
</style>
<script src="jquery-1.11.3/jquery.min.js"></script>
<script type="text/javascript">

		$(function(){
			
			$("select").css("fontSize","20px");
			$("select").css("width","200px");
			$(".leibie").change(function(){
				if($(".leibie option:selected").text().trim()=='学科竞赛'){
				$(".compe>option:eq(0)").prop("selected",true);
				$(".compe").css("display","inline")
				$(".compe-ky").css("display","none")
				$(".compe-xk").css("display","inline")
				$(".cx").css("display","inline");
				}else if($(".leibie option:selected").text().trim()=='科研立项'){
					$(".compe>option:eq(0)").prop("selected",true);
					$(".compe-xk").css("display","none");
					$(".compe-ky").css("display","inline");
					$(".compe").css("display","inline");
					$(".cx").css("display","inline");
				}else{
					$(".compe").css("display","none");
					$(".cx").css("display","none");
				}
			});
			/*$(document).ajaxStart(function(){
				 $("#loading").fadeIn(1000);
				});
			$(document).ajaxComplete(function(){
				  $("#loading").fadeOut(1000);
				});*/
			$(".cx").click(function(){
				//讲别的查询结果移除
				$(".table tr").eq(0).siblings().remove();
				 $("#loading").slideDown(1000);
				$.ajax({
					url:"${pageContext.request.contextPath}/MaupLoadservlet",
					type:"post",
					dataType:"json",
					data:"pid="+$(".compe option:selected").val()+"&sign=2",
					success:function(data){
						  $("#loading").slideUp(1000);
							//获取指导老师
							var html='';
							for(var i in data.all) {
							 html=html+'<option value='+data.all[i].tname+'>'+data.all[i].tname+'</option>';
							};
							html="<select name='tea'>"+html+"<select><span class='sure'>确定<span>";
							//获取指导老师后将指导老师从json中删除,以便后面判断jQuery.isEmptyObject(data)是否为空即该比赛是否有学生不知道，
							//key的必须用[]形式，知道key的两种都可以
							//delete data["all"];
							delete data.all;
							//将没有查询结果提示移除
						$(".result").remove();
						if(jQuery.isEmptyObject(data)){
							$(".div-table").after('<div class="result">暂无可查询的结果</div>');
							return;
						};
						//alert(data.all[i].tid);
						//将查询的学生报名信息检索出来
						for(var key in data) {
						$(".table").append('<tr class="trone"><td>'+data[key].sno+'</td><td>'+data[key].name+'</td><td>'+data[key].stuclass+'</td>'
								+'<td>'+data[key].department+'</td><td class="hide">'+data[key].publishcompe.pid+'</td><td>'+data[key].publishcompe.pname+'</td>'
								+'<td>'+data[key].publishcompe.category+'</td><td>'+data[key].publishcompe.score+'</td><td>'
								+data[key].guider+'</td><td>'+html+'</td>');
						}
						$(".sure").click(function(){
							//alert($(this).prev().children().prop("selected"));
							var tname = $(this).prev().children(":selected").val();
							var sno = $(this).parent().siblings().eq(0).text();
							var pid = $(this).parent().siblings().eq(4).text();
							var $td = $(this).parent("td").prev();
							$.ajax({
								url:"MaupLoadservlet",
								type:"post",
								datatype:"json",
								data:"sign=4&tname="+tname+"&sno="+sno+"&pid="+pid,
								success:function(data){
									var jsonobj = eval("("+data+")");
									if(jsonobj.flag=="success"){
										$td.text(tname);
										alert("成功");
									}
								},
							error:function(){
								alert("出现异常");
							},
							})
						})
					},
				})
			})
			
		})
</script>
<body>
	<div class="top">
		<span>学生分配指导老师</span> <a href="manager/manager.jsp" class="top-right">返回主界面</a>
	</div>
	<div class="category">
		<label>请选择比赛</label>
		 <select name="compename" class="leibie">
			<option value=""selected="selected">请选择赛事类型
			<option value="学科竞赛">学科竞赛
			<option value="科研立项">科研立项
		</select> 
		<select  name="compename" class="compe">
					<option value="">请选择赛事
				<c:forEach items="${requestScope.listxk}" var="p">
					<option value="${p.pid}" class="compe-xk">${p.pname }
				</c:forEach>
				<c:forEach items="${requestScope.listky}" var="p">
					<option value="${p.pid}" class="compe-ky">${p.pname }
				</c:forEach>
		</select> <span class="cx">查询</span><span id="loading" style="display:none;"><span>正在查询</span>
		<span ><img alt="" src="${pageContext.request.contextPath }/images/loading.gif" class="jz"></span></span>
	</div>
	<div class="div-table">
		<table class="table" border="2px">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>学院</th>
				<th class="hide">比赛编号</th>
				<th>比赛名称</th>
				<th>比赛类别</th>
				<th>比赛积分</th>
				<th>分配老师</th>
				<th>选择老师</th>
			</tr>

		</table>
	</div>
	<script type="text/javascript">


	
	
	</script>

</body>
</html>