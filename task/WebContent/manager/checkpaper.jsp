<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看论文</title>
</head>
<style type="text/css">
.head {
	margin: 0 200px 0 200px;
	background-color: #6a8e9a;
	letter-spacing: 5px;
	height: 30px;
	padding-left: 20px;
	font-weight: 1000;
	font-size: 22px;
}
.checkpaper,.checkpatent{
	width:100px;
	height:30px;
	margin-left:30px;
	font-size:20px;
	background-color: #307383;
	color: white;
	
}
.uploadschool {
	float: right;
	background-color: #89aae6;
	border-radius: 10px;
	margin-right: 20px;
}

.uploadschool:hover {
	background-color: #2d2f31;
	cursor: pointer;
}

.size {
	width: 100%;
	height: 300px;
}

.imgdiv {
	margin: 0 200px 10px 200px;
}

.content {
	margin: 0 200px 10px 200px;
	padding-left: 10px;
	line-height: 20px;
}

.title {
	font-weight: bold;
}

.pass {
	color: #1ccebe;
	font-size: 16px;
}

.nopass {
	color: #b37999;
	font-size: 16px;
}

.no, .yes {
	margin-left: 20px;
	color: #0367AD;
	font-weight: 700;
}

.no:hover, .yes:hover {
	color: #124258;
	cursor: pointer;
}

.content p {
	font-size: 12px;
}

.author {
	color: #0367AD;
	font-weight: 800;
}

.content-load {
	margin-left: 30px;
	color: #0367AD;
	text-decoration: underline;
	font-weight: 800;
}

.content-load:hover {
	color: #a74462;
}
</style>
<!-- 导出excel层的样式 -->
<style type="text/css">
.twodiv {
	position: absolute;
	margin: 0 auto;
	width: 800px;
	height: 320px;
	z-index: 10;
	background-color: #d3dfdb;
	border: 5px solid #286daf;
	border-radius: 10px;
	display: none;
}

.excel {
	position: absolute;
	width: 100%;
	background-color: white;
	display: inline-block;
	height: 280px;
}

.excelhead {
	width: 100%;
	height: 30px;
	position: absolute;
	font-size: 20px;
	color: white;
	background-color: #18356b;
}

.im {
	height: 25px;
	float: right;
	margin-top: 3px;
	margin-right: 5px;
}

.excel-one {
	width: 100%;
	height: 250px;
	font-size: 16px;
	color: #585b5e;
	position: relative;
	left: 0px;
	top: 30px;
	list-style: none;
	line-height: 30px;
	margin: 0;
	padding: 0;
	overflow: auto;
}

.excel-one  li:hover {
	background-color: #9cc9ef;
	color: white;
}

.gt {
	background-color: #0eb3a9;
	border: 4px solid #b0bfbe;
	color: white;
	margin: 5px 5px;
	padding: 0 4px;
}

.gt:hover {
	color: #5aabda;
	background: #dfe3e6;
	cursor: pointer;
}

.checkbox {
	float: right;
	margin-right: 10px;
	display: inline-block;
	width: 20px;
	height: 20px;
}

.down {
	text-align: center;
	position: absolute;
	left: 250px;
	top: 290px;
}

.dark {
	width: 100%;
	z-index: 2;
	position: absolute;
	background-color: gray;
	opacity: 0.7;
}

.result {
	margin: 50px 20px 0 20px;
	color: #3f9533;
	padding: 40px 0;
	text-align: center;
	background: #dbdbdb;
}
</style>

<script
	src="${pageContext.request.contextPath }/jquery-1.11.3/jquery.js"></script>
<script>
	$(function() {
		$(".checkpaper").click(function(){
			/* $(".paper").show();
			$(".patent").hide();
			$(".result").remove(); */
			location.href="${pageContext.request.contextPath}/AllPaperInfoservlet?sign=1";
			
		})
		//院系审核通过
		$(document).on("click",".yes",function(){ 
			//根据display来判断传到哪个处理类
			var paper = $(".paper").css("display");
			var patent = $(".patent").css("display");
			var checkurl = "";
			var method = "";
			var paperid = $(this).prev().prev().text();
			/* alert(paperid)
			return; */
			var thisobj = this;
			if(paper==='block'){
				checkurl = "${pageContext.request.contextPath}/CheckAllPaper";
				method = "get";
			}else if(patent ==='block'){
				checkurl = "${pageContext.request.contextPath}/CheckPatent";
				method = "post";
			}
			$.ajax({
						url : checkurl,
						type : method,
						data : "paperid=" + paperid + "&sign=2",
						success : function(data) {
							var jsonobj = eval("(" + data + ")")
							if (jsonobj.flag === 'success') {
								$(thisobj).next().remove();
								$(thisobj).after($("<span class='pass'>(审核通过)</span>"));
							}
						}
					})
		})
		//院系审核不通过
		$(document).on("click",".no",function(){ 
			var paper = $(".paper").css("display");
			var patent = $(".patent").css("display");
			var checkurl = "";
			var method = "";
			if(paper==='block'){
				checkurl = "${pageContext.request.contextPath}/CheckAllPaper";
				method = "get";
			}else if(patent ==='block'){
				checkurl = "${pageContext.request.contextPath}/CheckPatent";
				method = "post";
			}
			var paperid = $(this).prev().text();
			var thisobj = this;
			$.ajax({
					url : checkurl,
					type : method,
					data : "paperid=" + paperid + "&sign=1",
					success : function(data) {
						var jsonobj = eval("(" + data + ")")
						if (jsonobj.flag === 'success') {
							$(thisobj).next().next().remove();
							$(thisobj).next().after($("<span class='nopass'>(审核未通过)</span>"));
						}
					}
				})
		})
	//查看专利
	$(".checkpatent").click(function(){
		$(".patent").remove();
		$(".result").remove();
		$.ajax({
			url:"${pageContext.request.contextPath}/CheckPatent",
			type:"get",
			dataType:"json",
			success:function(data){
				var html = "";
				if($.isEmptyObject(data)){
					html='<div class="result">暂无上传的信息</div>';
				}else{
				for(var i in data){
						var checkfont = "";
						if(data[i].checksign=='0'){
							checkfont='<span style="color: #eb4376; font-size: 15px;">(未审核)</span>';
						}else if(data[i].checksign=='1'){
							checkfont='<span class="nopass">(审核未通过)</span>';
						}else if(data[i].checksign=='2'){
							checkfont='<span class="pass">(审核通过)</span>';
						}else if(data[i].checksign=='3' ||  data[i].checksign=='4' ||data[i].checksign=='5'){
							checkfont='<span class="pass">(审核通过)</span>';
						}
					html=html+'<div class="content patent"><img src="${pageContext.request.contextPath}/images/article.png">'
					+'<span class="title">'+data[i].title+'</span><hr><span>作者:</span><span class="author">'+data[i].author
					+'</span> <a href="${pageContext.request.contextPath}/DownloadPatent?filename='+data[i].patentimg+'"'
					+'class="content-load">[pdf下载]</a> <span style="display: none;">'+data[i].patentid
					+'</span><span class="no">未通过审核</span><span class="yes">通过审核</span>'+checkfont   
					+'<p>摘要：'+data[i].summary+'</p></div>';
				}
				 var patenthhead='<div class="excelhead">请选中上传的专利<img  src="${pageContext.request.contextPath}/images/cha.png" class="im"></div><ul class="excel-one">'
				 var patentcon = "";
				for(var i in data){
					patentcon=patentcon+'<li><img style="margin-bottom: -7px;" src="${pageContext.request.contextPath}/images/title.png">'
						+'<span>专利标题:'+data[i].title+'</span><br>'
						+'<img src="${pageContext.request.contextPath}/images/author.png">'
						+'<span>作者:'+data[i].author+'</span><input type="checkbox" value="'+data[i].patentid+'" class="checkbox"><hr></li>';
				}	
				}
				patenthhead=patenthhead+patentcon+'</ul>'
					$(".paper").hide();
					$(".excel").html(patenthhead);
					$("body").append(html);
			}
		})
	})
	//给查询论文，专利设置标志,以便于上传給校方时知道上传的url是论文的还是专利的
		$(".checkpaper").attr("flag", "1");
		$(".checkpatent").attr("flag", "0");
		$(".checkpatent").click(function() {
			$(this).attr("flag","1");
			$(".checkpaper").attr("flag","0");
		})
		//院系批量审核上传校方
		$("#uploadschool").click(function() {
			var allpaperid = "";
			$("input[type=checkbox]:checked").each(function(index, obj) {
				var val = $(obj).val() + ",";
				allpaperid = allpaperid + val;
			});
			if (allpaperid === '') {
				alert("请选择你要上传的论文");
				return;
			}
			var uploadschool = "";
			var method = "";
			if($(".checkpaper").attr("flag")==='1'){
				method = "get";
				uploadschool = '${pageContext.request.contextPath}/CheckAllPaper';
			}else if($(".checkpatent").attr("flag")==='1'){
				uploadschool = '${pageContext.request.contextPath}/CheckPatent';
				method = "post";
			}
			$.ajax({
				url : uploadschool,
				type : method,
				data : "paperid=" + allpaperid + "&sign=3",
				success : function(data) {
					var obj = eval("(" + data + ")");
					if (obj.flag === 'allsuccess') {
						alert("全部上传成功");
					} else if (obj.flag === 'parterror') {
						alert("部分失败");
					}
				}
			})

		})
		//设置全选
		$("#allcheck").attr("flag", "0");
		$("#allcheck").click(function() {
			if ($("#allcheck").attr("flag") == '0') {
				$("input[type=checkbox]").prop("checked", true);
				$("#allcheck").attr("flag", '1')
			} else if ($("#allcheck").attr("flag") == '1') {
				$("input[type=checkbox]").prop("checked", false);
				$("#allcheck").attr("flag", '0')
			}
		})
		//给每个li设置点击选上移除事件
		var li = $(".excel-one>li");
		$(document).on("click","li",function() {
			if ($(this).children("input").prop("checked")) {
				$(this).find("input").prop("checked", false);
			} else if (!$(this).find("input").attr("checked")) {
				$(this).find("input").prop("checked", true);
			}
		})
		/*设置弹出的效果位置居中
		
		 */
		$(".uploadschool").click(
				function() {
					$("<div class='dark'></div>").css("height",
							$(document).outerHeight()).insertBefore("body");
					//让报名弹出层在当前滚动页面的中心显示
					$(".twodiv").show();
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
					$("body").css("overflow", "hidden");

				})
		$(document).on("click",".im",function() {
			$(".twodiv").hide();
			$(".dark").remove();
			//遮罩层隐藏后浏览器恢复可滚动
			$('body').css('overflow', "auto");
		})

	})
</script>
<body>
	<div class="head">
		<input type="button" value="查看论文" class="checkpaper"><input type="button" value="查看专利" class="checkpatent"> <span class="uploadschool">上传校方</span>
	</div>
	<div class="imgdiv">
		<img alt="" src="images/computer1.jpg" class="size">
	</div>
	<c:if test="${empty requestScope.list}">
		<div class="result">暂无上传的信息</div>
	</c:if>
	<c:if test="${!empty requestScope.list}">
		<c:forEach items="${requestScope.list}" var="p">
			<div class="content paper">
				<img src="${pageContext.request.contextPath}/images/article.png">
				<span class="title">${p.title}</span>
				<hr>
				<span>作者:</span><span class="author">${p.author}</span> <a
					href="./AllPaperInfoservlet?sign=2&filename=${p.paperimg}"
					class="content-load">[pdf下载]</a> <span style="display: none;">${p.paperid }</span><span
					class="no">未通过审核</span><span class="yes">通过审核</span>
				<c:if test="${p.checksign=='0'}">
					<span style="color: #eb4376; font-size: 15px;">(未审核)</span>
				</c:if>
				<c:if test="${p.checksign=='1'}">
					<span class="nopass">(审核未通过)</span>
				</c:if>
				<c:if test="${p.checksign=='2'}">
					<span class="pass">(审核通过)</span>
				</c:if>
				<c:if test="${p.checksign=='3'||p.checksign=='4'||p.checksign=='5'}">
					<span class="pass">(审核通过)</span>
				</c:if>
				<p>摘要：${p.summary}</p>
			</div>
		</c:forEach>
	</c:if>
	<!-- -----弹出上传校方层---------- -->
	<div class="twodiv">
		<div class="excel">
			<div class="excelhead">
				请选中上传的论文<img alt="" src="${pageContext.request.contextPath}/images/cha.png" class="im">
			</div>
			<ul class="excel-one">
				<c:forEach items="${requestScope.list }" var="p">
					<li><img style="margin-bottom: -7px;;" alt="" src="${pageContext.request.contextPath}/images/title.png"><span>论文标题:${p.title }</span><br>
					<img alt="" src="${pageContext.request.contextPath}/images/author.png"><span>作者:${p.author }</span>
						<input type="checkbox" value="${p.paperid }" class="checkbox">
					<hr></li>
				</c:forEach>
			</ul>
		</div>
		<div class="down">
			<span class="gt" id="uploadschool">上&nbsp;&nbsp;传</span> <span
				id="allcheck" class="gt">全&nbsp;&nbsp;&nbsp;选</span>
		</div>
	</div>
</body>
</html>