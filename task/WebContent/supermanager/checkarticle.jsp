<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高校论文审核</title>
</head>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	list-style: none;
}
.head{
	width:100%;
	height:30px;
	background-color: #81a58f;
	text-align: center;
	color:white;
	font-size: 22px;
	text-shadow: 0 0 2px;
	letter-spacing: 3px;
}
.div-one{
	height:35px;
	background-color: #bde4c7;
	color:#e1e8e3;
	font-size: 22px;
	font-weight: 500;
}
.div-one input{
	background-color:#e6ecf3;
	font-weight:600;
	height:30px;
	border-radius:5px;
	padding:0 10px 0;
}
.div-one span{
	display:inline-block;
	margin-left: 50px;
	padding:0 10px 0;
	background-color: #b1b6b2;
	border-radius:5px;
}
.choose{
	margin: 10px 0 0 30px;
	background-color: #a0caea;
	padding-left:20px;
	height:40px;
	font-size: 20px;
	color:#999d9f;
}
.choose select{
	margin:5px 20px 0 20px;;
	border-radius:10px;
	border:2px solid blue;
	display:inline-block;
	height:30px;
}
.sel{
	display: inline-block;
	width:100px;
	height: 30px;
	background-color: #4598d7;
	color:white;
	border-radius:10px;
}
.alldepart{
	background-color: #c9c9c3;
	font-size: 25px;
	border: 2px solid #519496;
	padding-left: 10px;
	color:#465b71;
}
.deparstyle{
	background-color: #d1d1c3;
	font-size: 28px;
	text-align: center;
	color:#227ee3;
}
.div-two{
	margin-top: 40px;
	padding-left: 30px;
}
.div-two ul{
	margin-bottom: 20px;
}
.div-two p{
	line-height: 30px;
	font-size: 14px;
	background: linear-gradient(to right,#ced9df,#f5f6f6); 
	margin-right: 50px;
	padding: 0 20px 0;
	border-radius:10px;
}
.content{
	border: 2px solid #5085bf;
	border-radius:10px;
	margin-top: 10px;
	margin-bottom: 20px;
	padding-left: 10px;
}
.title{
	font-size: 20px;
	font-weight: 500;
}
.second{
	background: linear-gradient(to right,#f5f6f6,#ced9df); 
	margin-bottom: 10px;
	height:50px;
}
.author,.down{
	color:#4a90c5;
	margin-right: 50px;
}
.result {
	margin: 50px 20px 0 20px;
	color: #3f9533;
	padding: 40px 0;
	text-align: center;
	background: #dbdbdb;
}
.nopasspaper,.yespasspaper{
	display:inline-block;
	color:white;
	background-color: #1abf6e;
	border-radius:10px;
	cursor: pointer;
	padding:0 10px 0;
	margin-right: 20px;
}
.nopassimg,.passimg{
	margin-bottom: -8px;
    margin-top: 10px;
}
.nopasspatent,.yespasspatent{
	display:inline-block;
	color:white;
	background-color: #26c3df;
	border-radius:10px;
	cursor: pointer;
	padding:0 10px 0;
	margin-right: 20px;
}
.nopassimg,.passimg{
	margin-bottom: -8px;
    margin-top: 10px;
}
</style>
<script src="${pageContext.request.contextPath }/jquery-1.11.3/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#paper").attr("flag","1").css({"backgroundColor":"#66a5ea","color":"white"})
		$("#papent").attr("flag","0")
		$(".div-one input[type=button]").click(function(){
			$(this).css({"backgroundColor":"#66a5ea","color":"white"}).siblings().css({"backgroundColor":"","color":""})
			$(this).attr("flag","1").siblings().attr("flag","0")
		})
		//根据学院搜索对应的论文或专利
		$(".sel").click(function(){
			var value= $(".choose option:selected").val();
			var sign = "";
			if(value ==='请选择学院'){
				alert("请选择学院");
				return;
			}
			$(".div-one input[type=button]").each(function(index,obj){
				if($(obj).attr("flag")==='1'){
					sign = $(obj).attr("name");
				}
			})
			$.ajax({
				url:"${pageContext.request.contextPath}/SchoolAllArticle",
				type:"get",
				dataType:"json",
				data:"sign="+sign+"&department="+value,
				success:function(data){
						$(".result").remove()
					if(jQuery.isEmptyObject(data)){
							$(".div-two").after('<div class="result">暂无可查询的结果</div>');
							$(".div-two").empty();
							return;
					}
					var html = "";
					for(var i = 0;i<data.length;i++){
						if(sign === 'paper'){
							var span = ""; 
							if(data[i].checksign==='3'){
						    	span ='<span style="color:#e76cb7">(未审核)</span>';
						    }else if(data[i].checksign==='4'){
						    	span ='<span style="color:#9c999b">(审核未通过)</span>';
						    }else{
						    	span ='<span style="color:#22da6a">(审核通过)</span>';
						    }
							html = html + '<ul><li class="title"><img src="${pageContext.request.contextPath }/images/article.png"> '+data[i].title+'<hr></li>'
							+'<li class="second"> <span >作者:</span> <span class="author">'+data[i].author
							+'</span> <a href="${pageContext.request.contextPath }/AllPaperInfoservlet?sign=2&filename='+data[i].paperimg+'" class="down">[pdf下载]</a>'
							+'<input type="hidden" value="'+data[i].paperid+'"class="hiddenpaperid">'
						    +'<img class="nopassimg" src="${pageContext.request.contextPath}/images/nopass.png"><span class="nopasspaper">审核不通过</span>'
						    +'<img class="passimg" src="${pageContext.request.contextPath}/images/pass.png"><span class="yespasspaper">审核通过</span>'
						    +span+'</li>'
							+'<li><p>'+data[i].summary+'</p></li></ul>'
						}else if(sign ==='patent'){
							var span = ""; 
							if(data[i].checksign==='3'){
						    	span ='<span style="color:#e76cb7">(未审核)</span>';
						    }else if(data[i].checksign==='4'){
						    	span ='<span style="color:#9c999b">(审核未通过)</span>';
						    }else{
						    	span ='<span style="color:#22da6a">(审核通过)</span>';
						    }
							 html = html + '<ul><li class="title"><img src="${pageContext.request.contextPath }/images/article.png"> '+data[i].title+'<hr></li>'
									+'<li class="second"> <span >作者:</span> <span class="author">'+data[i].author
									+'</span> <a href="${pageContext.request.contextPath }/DownloadPatent?sign=2&filename='+data[i].patentimg+'" class="down">[pdf下载]</a>'
									+'<input type="hidden" value="'+data[i].patentid+'"class="hiddenpatentid">'
								    +'<img class="nopassimg" src="${pageContext.request.contextPath}/images/nopass.png"><span class="nopasspatent">审核不通过</span>'
								    +'<img class="passimg" src="${pageContext.request.contextPath}/images/pass.png"><span class="yespasspatent">审核通过</span>'
								    +span+'</li>'
									+'<li><p>'+data[i].summary+'</p></li></ul>'
						}
					}
					$(".div-two").empty();
					$(".div-two").prepend('<div class="deparstyle">'+value+'学院</div>');
					$(".div-two").append(html);
					
				}
			})
		})
		//点击查看学生获奖信息审核
		$("#prize").click(function(){
			location.href="${pageContext.request.contextPath}/SuperCheckimage";
		})
		//点击查看专利，显示所有学院论文
		$("#paper").click(function(){
			location.href="${pageContext.request.contextPath}/SchoolAllArticle?sign=allpaper";
		})
		//点击查看专利，显示所有学院专利
		$("#patent").click(function(){
			$(".result").remove();
			$.ajax({
				url:"${pageContext.request.contextPath}/SchoolAllArticle",
				type:"get",
				dataType:"json",
				data:"sign=allpatent",
				success:function(data){
					var html = '<div class="alldepart">所有学院的专利</div>';
					for(var i in data){
						var span = ""; 
						if(data[i].checksign==='3'){
					    	span ='<span style="color:#e76cb7">(未审核)</span>';
					    }else if(data[i].checksign==='4'){
					    	span ='<span style="color:#9c999b">(审核未通过)</span>';
					    }else{
					    	span ='<span style="color:#3a97d5">(审核通过)</span>';
					    }
						html= html+'<div class="content"><ul>'
							  +'<li class="title"><img src="${pageContext.request.contextPath }/images/article.png">'+ data[i].title+'<hr></li>'
							  +'<li class="second"> <span >作者:</span> <span class="author">'+data[i].author+'('+data[i].department+')</span>' 
							  +'<a href="${pageContext.request.contextPath }/DownloadPatent?filename='+data[i].patentimg+'"class="down">[pdf下载]</a>'
							  +'<input type="hidden" value="'+data[i].patentid+'"class="hiddenpatentid">'
							  +'<img class="nopassimg" src="${pageContext.request.contextPath}/images/nopass.png"><span class="nopasspatent">审核不通过</span>'
							  +'<img class="passimg" src="${pageContext.request.contextPath}/images/pass.png"><span class="yespasspatent">审核通过</span>'
							  +span+'</li>'
							  +'<li><p>$'+data[i].summary+'</p></li></ul></div>';	
					}
					$(".div-two").html(html);
				}
			})
		})
		//专利审核通过
		$(document).on("click",".yespasspatent",function(){
			var thisobj=this;
			$.ajax({
					url:"${pageContext.request.contextPath}/SchoolCheckPatent",
					data:"patentid="+$(this).siblings(".hiddenpatentid").val()+"&sign=5",
					dataType:"json",
					success:function(data){
						if(data.flag === 'success'){
							$(thisobj).next("span").text("(审核通过)").css("color","#3a97d5");
							alert("审核通过");
						}
			}})
		})
		//专利审核不通过
		$(document).on("click",".nopasspatent",function(){
			var thisobj=this;
			$.ajax({
					url:"${pageContext.request.contextPath}/SchoolCheckPatent",
					data:"patentid="+$(this).siblings(".hiddenpatentid").val()+"&sign=4",
					dataType:"json",
					success:function(data){
						if(data.flag === 'success'){
							$(thisobj).next().next().next("span").text("(审核未通过)").css("color","#9c999b")
							alert("审核不通过");
						}
			}})
		})
		//论文审核通过
		$(document).on("click",".yespasspaper",function(){
			var thisobj=this;
			$.ajax({
					url:"${pageContext.request.contextPath}/SchoolCheckPaper",
					data:"paperid="+$(this).siblings(".hiddenpaperid").val()+"&sign=5",
					dataType:"json",
					success:function(data){
						if(data.flag === 'success'){
							$(thisobj).next("span").text("(审核通过)").css("color","#22da6a");
						}
			}})
		})
		//论文审核不通过
		$(document).on("click",".nopasspaper",function(){
			var thisobj=this;
			$.ajax({
					url:"${pageContext.request.contextPath}/SchoolCheckPaper",
					data:"paperid="+$(this).siblings(".hiddenpaperid").val()+"&sign=4",
					dataType:"json",
					success:function(data){
						if(data.flag === 'success'){
							$(thisobj).next().next().next("span").text("(审核未通过)").css("color","#9c999b")
						}
			}})
		})
		
	})
	
</script>
<body>
	<div class="head">审核区</div>
	<div class="div-one">
			<input type="button" name="paper" value="论文审核" id="paper">
			<input type="button"name="patent" value="专利审核" id="patent">
			<input type="button"name="patent" value="学生获奖信息审核" id="prize">/task/SuperCheckimage" 
	</div>
	<div class="choose">
		<label>选择要查询的学院</label>
		<select>
			<option>请选择学院</option>
			<c:forEach items="${requestScope.allDepartment}" var = "p">
				<option value="${p.department}">${p.department }</option>
			</c:forEach>
		</select>
		<input type="button" value="查询" class="sel">
	</div>
	<div class="div-two">
		<div class="alldepart">所有学院的论文</div>
			<c:forEach items="${requestScope.passPaper }" var ="p">
				<div class="content">
					<ul>
						<li class="title"><img src="${pageContext.request.contextPath }/images/article.png"> ${p.title }<hr></li>
						<li class="second"> <span >作者:</span> <span class="author">${p.author }(${p.department})</span> 
							<a href="${pageContext.request.contextPath }/AllPaperInfoservlet?sign=2&filename=${p.paperimg }" class="down">[pdf下载]</a>
							<input type="hidden" value="${p.paperid}" class="hiddenpaperid">
							<img class="nopassimg" src="${pageContext.request.contextPath}/images/nopass.png"><span class="nopasspaper">审核不通过</span>
							<img class="passimg" src="${pageContext.request.contextPath}/images/pass.png"><span class="yespasspaper">审核通过</span>
				<c:if test="${p.checksign=='3'}">
					<span style="color:#e76cb7">(未审核)</span>
				</c:if>
				<c:if test="${p.checksign=='4'}">
					<span style="color:#9c999b">(审核未通过)</span>
				</c:if>
				<c:if test="${p.checksign=='5'}">
					<span style="color:#22da6a">(审核通过)</span>
				</c:if>
						</li>
						<li><p>${p.summary }</p></li>
					</ul>
				</div>	
			</c:forEach>
	</div>
	
</body>
</html>