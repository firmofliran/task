<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数学与大数据学院</title>
</head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style: none;
}
body{
	background-color: #dfe4ea}
.head {
	width: 100%;
	height: 30px;
	background-color: #4489e8;
	font-size: 22px;
}

.one-1 {
	color: white;
	float: left;
}

.two-2 {
	float: right;
	color: white;
}

.center-i {
	width: 100%;
	height: 150px;
	
}

.bumen {
	text-align: center;
	font-size: 35px;
	color:#4f4f45;
}
/*主要部分*/
.center-top{
	margin-left: 100px;
	margin-top: 20px;
	height: 400px;
	
}
.content {
	float: left;
}
.content-left {
	width: 300px;
	height:400px;
}
.enter span{
	font-size: 30px;
	letter-spacing:5px;
	position:absolute;
	left:120px;
	top:45px;
	color:white;
	font-weight: 800;
}
.enter a{
	display:inline-block;
	width:300px;
	height: 131px;
}
.content-left img{
	width:300px;
	height:131px;
	}
.content-center {
	width:600px;
	height:400px;
	background-color: white;
}
.content-center-head{
	margin: 0px 0 10px 0;
	text-align: center;
	font-size: 20px;
	cursor:pointer;
	color:#8e9092;
}
.content-center-head span{
	display: inline-block;
    padding: 8px 8px;
    
    background-size: 120% 100%;
    height: 40px;
}
.send-school{
	margin-left: 40px;
}
.addduihua{
	color: white;
    background: url(${pageContext.request.contextPath}/images/duihua.png) no-repeat center/cover;
}
.content-one{
	width:80%;
	border:2px solid #9fb6cc;
	height:22px;
	margin-bottom: 10px;
}
.content-two{
	width:80%;
	height:200px;
	border:2px solid #9fb6cc;
	font-size: 22px;
	margin-bottom: 10px;
}
.upload{
	display: inline-block;
	height:60px;
	border: 2px dashed #b3cede;
	border-radius:20%;
}
.subschool{
	margin-left: 50px;
	width:140px;
	color:white;
	font-size:22px;
	background-color: #418dd6;
}
.content-three{
	display: none;
}
.detail{
	font-size: 22px;
	color:#61768b;
}
.accept{
	display: none;
	width: 500px;
    height: 300px;
    margin-left: 40px;
    border: 2px solid #8ce8b3;
    padding-top: 10px;
    overflow:auto;
}
.accept-content{
	font-size: 16px;
	line-height:25px;
	margin-left: 20px;
	margin-bottom:20px;
	color:black;
}
.content-right{
	width: 400px;
	height:400px;
	background-color: #dcdee0; 
}
.right-divone{
	font-size: 22px;
	margin-left: 10px;
	margin-top: 10px;
	
}
.content-right li{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	height: 46px;
}
.content-right a{
	font-size:15px;
	display:inline-block;
	margin-top:10px;
	font-family: "Microsoft YaHei", "微软雅黑", "Arial, Geneva, sans-serif";
    color: #666;
    padding-right: 25px;
    padding-left: 25px;
}
.content-right a::AFTER {
	display: inline-block;
    background: url(${pageContext.request.contextPath}/images/new.jpg) no-repeat center/cover;
    width: 30px;
    height: 11px;
    content: '';
    vertical-align: middle;
}
.result {
	margin: 50px 20px 0 20px;
	color: #3f9533;
	padding: 40px 0;
	text-align: center;
	background: #dbdbdb;
}
</style>
<script src="${pageContext.request.contextPath}/jquery-1.11.3/jquery.js"></script>
<script type="text/javascript">
$(function(){
	if("${sessionScope.manager==null}"=="true" ){
		alert("连接超时，请重新登陆");
		window.top.location.href = "${pageContext.request.contextPath}/shou.jsp"
	}
	$(".content-right a").hover(function(){
		$(this).css("color","#276d8c")
	},function(){
		$(this).css("color","")
	})
	//文件选择
	$(".content-three").change(function(){
		var filename = $(this)[0].files[0].name;
		$(".detail").text(filename).css("color","#4f94d6");
	})
	$(".content-center-head span:eq(0)").addClass("addduihua");
	$(".content-center-head span").click(function(){
		var index = $(this).index();
		$($(".gt>div")[index]).css("display","block").siblings().css("display","none");
		$(this).addClass("addduihua").siblings().removeClass("addduihua");
	})
	//图片移上去出现黑色层
	$(".content-left img").mouseenter(function(){
		var left = $(this).offset().left;	
		var top = $(this).offset().top;
		var width = $(this).width();
		var height = $(this).height();
		$(".enter").remove();
		var href = $(this).parent().attr("href");
		$("<div class='enter'><a href="+href+"><span>进入</span></a></div>").css({"position":"absolute","left":left,"top":top,
			"width":width,"height":height,"opacity":"0.8","backgroundColor":"black","cursor":"pointer",}).appendTo("body")
	})
		$(document).on("mouseleave",".enter",function(){
			$(".enter").remove();
		})
		$(".content-right li").hover(function(){
				$(this).css({"backgroundColor":"white"})
				},function(){
					$(this).css({"backgroundColor":""})
				})
		//发送成功失败的消息
		var id = setInterval(function(){
			$(".time").remove()
		},2000)
		setTimeout(id,1000);
		//检索校方发送的信息和文件
		$("#accept").click(function(){
			$(".accept").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/DepartToSchool",
				dataType:"json",
				success:function(data){
					var html = "";
					if(jQuery.isEmptyObject(data)){
						$(".accept").append('<div class="result">暂无可接受的消息</div>');
						return;
					}
					for(var i in data){
						//处理文件名
						var filename = data[i].filename
						var newfilename =filename.substring(0,filename.lastIndexOf('-'))
						+filename.substring(filename.lastIndexOf('.'));
						
						html=html + '<ul class="accept-content"><li><span style="font-size:18px;">标题:&nbsp;&nbsp;</span><span>'
						+data[i].title+'</span></li>'
						+'<li><span style="font-size:18px;">内容:&nbsp;&nbsp;</span><span>'
						+data[i].content+'</span></li>'
						+'<li><span style="font-size:18px;">文件下载:&nbsp;&nbsp;</span><span></span>'
						+'<a href="${pageContext.request.contextPath}/DownloadExchangeFile?filename='+filename+'">'+newfilename+'</a></li></ul>'
					}
					$(".accept").append(html);
				}
			})
		})
		if("${requestScope.deletesign}" ==='filedelete'){
			alert("文件已经被删除");
		}
})

</script>
<body>
	<div class="head">
		<span class="one"><a href="#" class="one-1">设为首页加入收藏</a></span> 
		<a href="${pageContext.request.contextPath }/shou.jsp" class="two-2">退出</a>
		<span class="two"><a href="#" class="two-2">院系|</a></span>
	</div>

	<div >
		<img src="${pageContext.request.contextPath}/images/e.jpg" class="center-i" />
	</div>
	<div class="bumen">
		<span>${sessionScope.manager.department }学院</span>
	</div>
	<hr>
	<!-- 赛事组织 -->
	<div class="center-top">
		<div class="content content-left">
			<ul>
				<li><a href="${pageContext.request.contextPath}/MaupLoadservlet?sign=1"><img alt="" src="${pageContext.request.contextPath}/images/d2.jpg"></a></li>
				<li><a href="${pageContext.request.contextPath}/MaupLoadservlet?sign=3"><img alt="" src="${pageContext.request.contextPath}/images/d3.jpg"></a></li>
				<li><a href="${pageContext.request.contextPath}/AllPaperInfoservlet?sign=1"><img alt="" src="${pageContext.request.contextPath}/images/d1.jpg"></a></li>
			</ul>
		</div>
		
		<div class="content content-center">
			<div class="content-center-head">
				<span>給校方发送信息</span>
				<span id="accept">接受校方信息</span>
			</div>
			 <div class="gt">
				<div class="send-school">
				 <form action="${pageContext.request.contextPath}/DepartToSchool" method="post" enctype="multipart/form-data">
						<input type="hidden" name="sendpeople" value="${sessionScope.manager.department }">
						<input type="hidden" name="acceptpeople" value="校方">
						<input type="text" name="title" placeholder="标题(必须填写)" class="content-one"><br>
						<textarea placeholder="正文(必须填写)" class="content-two" name="content"></textarea><br>
						<label>
						<img src="${pageContext.request.contextPath}/images/uptosch.png" class="upload"> 
						<input type="file" name="filename" class="content-three"><span class="detail">请选择文件</span>
						</label>
						<input type="submit" value="发送给校方" class="subschool"><span style="color:blue;font-size:20px;"class="time">${requestScope.message }</span>
				</form>
				</div>
				
				<div class="accept">
					<!-- <ul class="accept-content">
						<li><span style="font-size:18px;">标题:&nbsp;&nbsp;</span><span>2017年8月17日拍摄于中国科学技术大学</span></li>
						<li><span style="font-size:18px;">内容:&nbsp;&nbsp;</span><span>2017年8月17日拍摄于中国科学技术大学2017年8月17日拍摄于中国科学技术大学
						2017年8月17日拍摄于中国科学技术大学2017年8月17日拍摄于中国科学技术大学2017年8月17日拍摄于中国科学技术大学
						</span></li>
						<li><span style="font-size:18px;">文件下载&nbsp;&nbsp;</span><span></span><a href="#">蓝桥杯.pdf</a></li>
					</ul>
					<ul class="accept-content">
						<li><span>2017年8月17日拍摄于中国科学技术大学</span></li>
						<li><span>文件下载&nbsp;&nbsp;</span><a href="#">蓝桥杯.pdf</a></li>
					</ul>
					<ul class="accept-content">
						<li><span>2017年8月17日拍摄于中国科学技术大学</span></li>
						<li><span>文件下载&nbsp;&nbsp;</span><a href="#">蓝桥杯.pdf</a></li>
					</ul>
					<ul class="accept-content">
						<li><span>2017年8月17日拍摄于中国科学技术大学</span></li>
						<li><span style="font-size:18px;">文件下载:&nbsp;&nbsp;</span><a href="#">蓝桥杯.pdf</a></li>
					</ul> -->
				</div>
			</div>
		</div>
		<div class="content content-right">
			<div class="right-divone">院系动态</div>
				<ul>
					<li><a href="#" >我校在2015安徽</a></li>
					<li><a href="#">我校在2015安徽省高校物联网应用创新大赛中取得优异成绩</a></li>
					<li><a href="#">我校在2015安徽省高校物联网应用创新大赛中取得优异成绩</a></li>
					<li><a href="#">高校物联网应用创新大赛中取得优异成绩</a></li>
					<li><a href="#">联网应用创新大赛中取得优异成绩</a></li>
					<li><a href="#">安徽省高校物联网应用创新大赛中取得优异成绩</a></li>
					<li><a href="#">机械工程学院召开学生座谈会安排布置学科竞赛工作</a></li>
				</ul>
			</div>
		</div>
	<!-- 院系动态 -->
</body>
</html>