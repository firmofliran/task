<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!--表的样式-->
	<style type="text/css">
	.even{background-color: #9d9d9d;}	
	.odd{background-color: #dddddd;}	
	.a{
		line-height: 3em;
	}
	th{width: 150px;
		font-size: 30px;
		font-family: "宋体";
	}
	.table{text-align: center;
			margin-left: 10%;
			line-height: 50px;
	}
	</style>
	<!--表的上方样式-->
	 <style type="text/css">
    *{margin:0;
    text-decoration: none;}
    
 	.top{background-color: blue;
 		 width:100%;
 		 height:24px; 		 
 	}
 	.one{color: white;}
 	.one:HOVER{
 			   color: orange;
 	}
 	
 	.ss{font-size: 18px;
 		color: white;
 		float:right;
 	}
	.two{font-size: xx-large; 
		 text-align: center;
		 font-style: oblique;
		 }
 	.three{
 		   text-align: center;
 		   
 	    }
 	    a{font-size: 22px;
 	      font-family: serif;
 	      color: gray;
 	    }
 	   .search{background-color: #11b04f;padding: 0 8px;color:white;cursor: pointer;}
	   
 		.ziti{color:gray; ;
 			font-weight: bolder;
 		}
 		.search1{text-align: center;}
 		.tableone{display:none;}
 </style>
 
<body >
	<div class="top">
		<span><a href="#" class="one" >设为首页</a></span>&nbsp;&nbsp;&nbsp;
		<span><a href="#" class="one" >加入收藏</a></span>
		<span class="ss">高校</span>
	
	</div>
	<div class="two">高校创新积分管理系统</div>
	<hr>
	<div class="three">
		 <span><a href="${pageContext.request.contextPath}/shou.jsp" >网站首页</a></span>&nbsp;&nbsp;&nbsp;
		 <span><a href="${pageContext.request.contextPath}/objcompetion.do?lb=1" >学科竞赛</a></span>&nbsp;&nbsp;&nbsp;
		 <span><a href="${pageContext.request.contextPath}/objcompetion.do?lb=2" >科研立项</a></span>&nbsp;&nbsp;&nbsp;
		 <span><a href="${pageContext.request.contextPath}/studentinfo/publishpaper.html" >论文发表</a></span>&nbsp;&nbsp;&nbsp;
		 <span><a href="${pageContext.request.contextPath}/studentinfo/patent.html" >专利申请</a></span>&nbsp;&nbsp;&nbsp;
	<hr>
</div >
	<div >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="ziti">当前排名 </a> &nbsp;&nbsp;&nbsp;
		<a href="#" class="ziti" >最新发布 </a>&nbsp;&nbsp;&nbsp;
		<a href="#" class="ziti">2017 </a>&nbsp;&nbsp;&nbsp;
		<a href="#" class="ziti">2016 </a>&nbsp;&nbsp;&nbsp;
		<a href="#" class="ziti">2015 </a>	
	</div>
	<hr>
	<div class="search1">
		请输入你想查询的学号<input type="text" name="sno" id="cx">
		<span  onclick="search()" class="search">查询</span>
	</div>
<div class="table" id="stu">
	<table border="0" cellspacing="2" >
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>所在院系</th>
			<th>团队成员</th>
			<th>最近参赛</th>
			<th>总积分</th>
			<th>排名</th>
		</tr>
		
	<c:forEach items="${listrank}" var="rank" varStatus="pm">
		<tr class="${pm.count%2==0?'odd':'even'} a">
			<td>${rank.stuno }</td>
			<td>${rank.name }</td>
			<td>${rank.department}</td>
			<td>${rank.member }</td>
			<td>${rank.competition }</td>
			<td>${rank.score }</td>		
			<td>${pm.count}</td>							
		</tr>
	  </c:forEach>
    </table>
</div>

<div class="table tableone" id="tablethree">
	<table border="0" cellspacing="2" >
		<tr>
			<th>学号</th>
			<th>姓名</th>
			<th>所在院系</th>
			<th>团队成员</th>
			<th>最近参赛</th>
			<th>总积分</th>
			<th>排名</th>
		</tr>
		<tr id="tabletwo"></tr>
		</table>
</div>

</body>

<script type="text/javascript">
 		
 		var arr=document.getElementsByTagName("a");
 		
 		for(var i=0; i<arr.length;i++){
 			arr[i].index=i;     //為每個数组里的超链接设置标记
 			arr[i].onclick=function(){
 			index=this.index;  //获取当前超链接元素
 			seta();
 		}
 	}
 	function seta(){
			for(var i=0;i<arr.length;i++){
				arr[i].style.backgroundColor=""; //将每个超链接变为原来颜色
			}
			arr[index].style.backgroundColor="#dddddd" //点击的当前超链接赋上新颜色
		}
 	//查询学生
 	function search(){
 	var search=document.getElementById("cx").value;
 	var xhr=null;
 	xhr=new XMLHttpRequest();
 	xhr.onreadystatechange=function(){
 		if(xhr.readyState==4){
 			if(xhr.status==200){
 				var json = xhr.responseText;
 				var jsonobj=eval("("+json+")");
 				
 				if(jsonobj.flag==false){
 					alert("您输入的有误，请检查后再输入")
 				}else{
 				var stu=document.getElementById("stu");
 				stu.style.display="none";
 				var tabletwo=document.getElementById("tabletwo");
 				var tablethree=document.getElementById("tablethree");
 				tablethree.style.display="block";
 				//var html="<td>"+jsonobj.stuno+"</td><td>"+jsonobj.name+"</td><td>"+jsonobj.department+"</td><td>"+jsonobj.member+"</td><td>"+jsonobj.competition+"</td><td>"+jsonobj.score+"</td>"
 				tabletwo.innerHTML="<td>"+jsonobj.stuno+"</td><td>"+jsonobj.name+"</td><td>"+jsonobj.department+"</td><td>"+jsonobj.member+"</td><td>"+jsonobj.competition+"</td><td>"+jsonobj.score+"</td>";
 			}
 			}	
 		}//{"stuno":"+rank.getStuno+","name":"+rank.getName+","department":"+rank.getDepartment+","member":"+rank.getMember+","competition":"+rank.getCompetition+","score":"+rank.getScore+"}
 		
 	}
 	xhr.open("get","search.do?search="+search,true);
 	xhr.send();
 	}
 </script>
</html>
