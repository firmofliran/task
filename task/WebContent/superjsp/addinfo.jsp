<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布竞赛</title>
</head>
<style type="text/css">
li{
	list-style: none;
}
.header{
	margin:10px 100px 0 100px;
	text-align: center;
	font-size: 30px;
	font-weight: 400;
	background-color: #274062;
	color:white;
	text-shadow: 0 0 5px white;
}
.all{
	margin:10px 100px 50px;
	background: #dbdbdb;
	line-height: 40px;
	padding: 30px 0 30px 50px;
	min-height: 550px;
}
.content-head{
	color:#535e6e;
	font-weight: 700;
	font-size: 25px;
}
.content-head img{
	margin-bottom: -5px;
}
.grade-one{
	display:none;
}
.grade-two{
	display:none;
}
.sub{
	margin-left: 100px;
	width: 100px;
	padding:5px;
	font-size:20px;
	background-color: #317799;
	border-radius:8px;
	color:white;
}
.content span{
	color:#273240;
	font-weight: 700;
	margin-right: 20px;
}
.content input{
	background-color: #a7bad5;
	border: 2px solid #57687f;
}
#leibie{
	background-color: #a7bad5;
	color:#5a6575;
	font-size: 18px;
}
.detial{
	position: absolute;
	top:120px;
	left:600px;
}
.detial-span{
	color:#273240;
	font-weight: 700;
}
.flag{
	color:#a14d6f;
	font-weight: 500;
	font-size: 16px;
}
</style>
<script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath }/kindeditor/lang/zh-CN.js"></script>
<script>  
        KindEditor.ready(function(K) {  
              K.create('#editor_id', {  
                uploadJson : '${pageContext.request.contextPath }/kindeditor/jsp/upload_json.jsp',  
                fileManagerJson : '${pageContext.request.contextPath }/kindeditor/jsp/file_manager_json.jsp',  
                allowFileManager : true ,
                fileManagerJson : 'tools/kindeditor-4.1.10/jsp/file_manager_json.jsp',
                allowFileManager : true,
                allowImageUpload : true, 
				autoHeightMode : true,
				items : [
				 		'source', '|',   'preview', 'template', 'code', 'cut', 'copy', 'paste',
				 		'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
				 		'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 
				 		'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
				 		'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
				 		'italic', 'underline', 'strikethrough', 'lineheight',  '|', 'image', 
				 		 'insertfile', 'table', 'hr', 'emoticons'
				 		
				 	],
				afterCreate : function() {this.loadPlugin('autoheight');},
				afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
				
              });  
        });  
</script> 
<script src="${pageContext.request.contextPath }/jquery-1.11.3/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$("#leibie").change(function(){
	if($("#leibie option:selected").val()=='学科竞赛'){
		//$(".compe>option:eq(1)").prop("selected",true);
		$(".grade-one").show();
		$(".grade-one input:eq(0)").prop("checked",true);
		$(".grade-two").hide();
		}else if($("#leibie option:selected").text().trim()=='科研立项'){
			//$(".compe>option:eq(0)").prop("selected",true);
			$(".grade-two").show();
			$(".grade-two input:eq(0)").prop("checked",true);
			$(".grade-one").hide();
		}
	})
})
</script>
<body>
	  	    <div class="header">发布信息</div>
<div class="all">
<div class="content-head"><img alt="" src="${pageContext.request.contextPath }/images/publish.png">请填写你想发布的信息  
<span class="flag">${requestScope.message}${sessionScope.message}<%session.removeAttribute("message"); %></span></div><hr>
	<form action="${pageContext.request.contextPath}/publish" name="example" method="post" enctype="multipart/form-data">
	<ul class="content">
	  		<li><span>赛事编号</span><input type="text" name="pid" maxlength="10" ></li>
	  		<li><span>赛事名称</span><input type="text" name="pname"></li>
	  		
	  		<li><span>比赛类型</span>
	  		<select name="category" id="leibie">
	  			<option value=""> 比赛类型</option>
	  			<option value="学科竞赛" > 学科竞赛</option>
	  			<option value="科研立项"> 科研立项</option>
	  		
	  		</select>
	  	    </li>
	      	<li>
	      	<span class="grade-one">
	      	<label>等级</label>
	      	<input type="radio" name="grade" value="A类">A类
	      	<input type="radio" name="grade" value="B类">B类
	      	<input type="radio" name="grade" value="C类">C类
	      	<input type="radio" name="grade" value="D类">D类
	      	</span>
	      	<span class="grade-two">
	      	<label>等级</label>
	      	<input type="radio" name="grade" value="国家级">国家级
	      	<input type="radio" name="grade" value="校级">校级
	      	<input type="radio" name="grade" value="院级">院级
	      	</span>
	      	</li>
	      	
	  		<li><span>承办学院</span><input type="text" name="xdepartment"></li>
	  		<li><span>发布时间</span><input type="text" name="publishtime"></li>
	  		<li><span>比赛地点</span><input type="text" name="competitionplace"></li>
	  		<li><span>创新积分</span><input type="text" name="score" maxlength="2" id="bh"></li>
	  		<li><span>选择图片</span><input type="file" name="filename"></li>
	  		</ul>
	  		<ul class="detial">
	  		<li><span class="detial-span">赛事详情</span></li>
	        <li> <textarea id="editor_id" name="content" style="width:100px;height:350px;"></textarea>  </li>
	      
	      	
	      	<li><input type="submit" value="发布" class="sub"></li>
	    </ul>  
	  </form>
	 	 
	  </div>
</body>

<script type="text/javascript">
	 //判断输入的是数字
	 var bh = document.getElementById("bh");
	 bh.onkeydown=function(){
		 var re =/^[0-9]+.?[0-9]*$/;
		 if(!re.test(bh.value)){
			 alert("请输入数字");
		 }
	 };
	 
	</script>
</html>