<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高校管理部门</title>
</head>
  <style type="text/css">
  *{margin: 0;
  	padding: 0;
  	text-decoration: none;	
  	list-style: none;
  	}
  .top{
  	width: 100%;
  	height: 25px;
  	background-color: blue; 		
  }
  body{
  background: #f3f5f7;
  }
 
  .one-1{color:white;
  		text-decoration: none;
  		float: left;
  		margin-left: 5px;
  }
  
  .two-2{
  		float: right;
  		text-decoration: none;
  		color: white;
  }
  .logout{
  		float: right;
  		text-decoration: none;
  		color: white;
  }
  .center{
  	width:100% ;
  	height: 100;
  
  }
  .center-i{
  	width: 100%;
  	height: 150px
  
  }
  .bumen{text-align: center;
  		font-size: 44px;
  		color:#6b6e6f;
  		text-shadow: 0 0 1px blue;
  }
 /*主要部分*/
 .center-top{
	margin-left: 100px;
	margin-top: 20px;
	height: 170px;
}
.content {
	float: left;
	margin-bottom: 20px;
}
.content-left {
	width: 300px;
	height:500px;
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
	height:164px;
	}
.content-center {
	width:600px;
	height:500px;
	background-color: #edeaea;
}
.content-center-head{
	margin: 0px 0 10px 0;
	text-align: center;
	font-size: 20px;
	cursor:pointer;
	color:#8e9092;
}
.shenhe{color:#8e9092;font-size: 20px;}
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
    background: url(${pageContext.request.contextPath }/images/duihua.png) no-repeat center/cover;
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
.choose{
	margin: 5px 0 10px 0;
	background-color: #a0caea;
	width: 452px;
	height:40px;
	font-size: 20px;
	color:#999d9f;
}
.choose select{
	margin:5px 20px 0 0;;
	border-radius:10px;
	border:2px solid blue;
	display:inline-block;
	height:30px;
}
.departinfo{
	margin: -10px 0 10px 0;
    background-color: #a0caea;
    width: 500px;
    height: 40px;
    font-size: 20px;
    color: #999d9f;
}
.departinfo select{
	margin:5px 20px 0 0;;
	border-radius:10px;
	border:2px solid blue;
	display:inline-block;
	height:30px;
}
.upload{
	display: inline-block;
	height:60px;
	border: 2px dashed #63b9ec;
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
    height: 380px;
    margin-left: 40px;
    padding-top: 10px;
    
}
.allcontent{
	border: 2px solid #8ce8b3;
	overflow:auto;
	width: 500px;
    height: 350px;
}
#cx{
	width:80px;
	background-color: blue;
	font-size: 18px;
	color:white;
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
	height:500px;
	background: linear-gradient(to right,#f5f6f6,#ced9df); 
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
    background: url(${pageContext.request.contextPath }/images/new.jpg) no-repeat center/cover;
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
  <script src="jquery-1.11.3/jquery.js"></script>
  <script >
  $(function(){
	  if("${sessionScope.supermanager==null}"=="true" ){
			alert("连接超时，请重新登陆");
			window.top.location.href = "${pageContext.request.contextPath}/shou.jsp"
		}
	  //打开页面就自动搜索所有院系信息
	  $.ajax({
		  url:"${pageContext.request.contextPath}/SchoolToDepart",
		  type:"get",
		  dataType:"json",
		  success:function(data){
				  var alloption = "";
			  for(var i in data){
				  alloption =alloption +'<option value='+data[i].department+'>'+data[i].department+'</option>'
			  }
			 $("select[name=acceptpeople]").append(alloption) 
			 $("select[name=selectdepart]").append(alloption) 
		  }
	  })
	  
	  $(".content-right a").hover(function(){
			$(this).css("color","#276d8c")
		},function(){
			$(this).css("color","")
		})
		$(".content-three").change(function(){
			var filename = $(this)[0].files[0].name;
			$(".detail").text(filename).css("color","#4f94d6");
		})
		$(".content-center-head span:eq(0)").addClass("addduihua");
	  //切换内容
	  $("#span1").click(function(){
		  $(".send-school").show();
		  $(".accept").hide();
		  $(this).addClass("addduihua");
		  $("#span2").removeClass("addduihua");
	  })
	  $("#span2").click(function(){
		  $(".accept").show();
		  $(".send-school").hide();
		  $(this).addClass("addduihua");
		  $("#span1").removeClass("addduihua");
	  })
		/* $(".content-center-head span").click(function(){
			var index = $(this).index();
			$($(".gt>div")[index]).css("display","block").siblings().css("display","none");
			$(this).addClass("addduihua").siblings().removeClass("addduihua");
		}) */
		//鼠标移上去出现遮罩层
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
			$(".subschool").click(function(){
				var value = $("select[name=acceptpeople] option:selected").val();
				if(value ==='请选择学院'){
					alert("请选择学院");
					return;
				}
				$("#form").submit();
			})
			//发送成功标志设置定时器
			var id = setInterval(function(){
				$("#time").remove()
			},2000)
			setTimeout(id,1000);
	  //查询某个学院的发送的文件
	  $("#cx").click(function(){
		  var value = $("select[name=selectdepart] option:selected").val();
		  if(value === '请选择学院'){
			  alert("请选择学院");
			  return;
		  }
		  $.ajax({
			  url:"${pageContext.request.contextPath}/SchoolSelectDepartFile",
			  data:"department="+value,
			  dataType:"json",
			  success:function(data){
				  $(".result").empty();
				  $(".allcontent").empty()
				  var html = "";
					if(jQuery.isEmptyObject(data)){
						$(".allcontent").append('<div class="result">暂无可接受的消息</div>');
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
					$(".allcontent").append(html);
			  }
		  })
		  
	  })
  })
  </script>
<body>
	<div class="top">
	<a href="#" class="one-1">设为首页</a><a href="#" class="one-1">加入收藏</a>
	<a href="${pageContext.request.contextPath }/shou.jsp" class="logout">退出</a>
	<span class="two-2">高校|</span>
	</div>
	
	<div class="center"><img src="${pageContext.request.contextPath }/images/school.png" class="center-i"/></div>
	<div class="bumen">高校管理部门</div>
	
	<!-- 赛事组织 -->
	<div class="center-top">
		<div class="content content-left">
			<ul>
				<li><a href="SplitPage" ><img alt="" src="${pageContext.request.contextPath }/images/school1.jpg"></a></li>
				<li><a href="${pageContext.request.contextPath }/echars.jsp"><img alt="" src="${pageContext.request.contextPath }/images/school2.jpg"></a></li>
				<li><a href="superjsp/addinfo.jsp"><img alt="" src="${pageContext.request.contextPath }/images/school3.jpg"></a></li>
			</ul>
		</div>
		
		<div class="content content-center">
			<div class="content-center-head">
				<span id="span1">給院方发送信息</span>
				<span id="span2">接受院方信息</span>
				<a href="${pageContext.request.contextPath }/SchoolAllArticle?sign=allpaper" class="shenhe">审核</a>
			</div>
			 <div class="gt">
			 <form action="${pageContext.request.contextPath}/SchoolToDepart" method="post" enctype="multipart/form-data" id="form">
				<div class="send-school">
						<input type="hidden" name="sendpeople" value="校方">
						<input type="text" name="title" placeholder="标题" class="content-one"><br>
						<textarea placeholder="正文" class="content-two" name="content"></textarea><br>
						<div class="choose">
							<label>选择要发送的学院</label>
								<select name="acceptpeople">
									<option>请选择学院</option>
								</select>
						</div>
						<label>
						<img src="${pageContext.request.contextPath}/images/uptosch.png" class="upload"> 
						<input type="file" name="filename" class="content-three"><span class="detail">请选择文件</span>
						</label>
						<input type="button" value="发送给院方" class="subschool">
						<span style="color:blue;font-size:20px;" id="time">${requestScope.message}${sessionScope.message}</span>
						<%session.removeAttribute("message");%>
				</div>
			</form>
				<div class="accept">
						<div class="departinfo">
							<label>选择查询的学院</label>
								<select name="selectdepart">
									<option>请选择学院</option>
								</select>
								<input type="button" value="查询" id="cx">
						</div>
					<div class="allcontent">
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
		</div>
		<div class="content content-right">
			<div class="right-divone">高校动态</div>
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