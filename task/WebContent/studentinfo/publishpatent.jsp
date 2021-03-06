<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传专利</title>
</head>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.left {
	border-radius:10px;
	width: 200px;
	height: 600px;
	background-color: #555c65;
	margin-top: 50px;
	margin-left: 50px;
	padding-top: 50px;
	line-height: 50px;
	color: #f2f4f4;
}

.left a {
	color: white;
	text-decoration: none;
}

.left li {
	list-style: none;
	padding-left: 50px;
	
}

.xg {
	width: 70px;
	height: 6px;
	background-color: #0fbd8e;
}

.right {
	position: absolute;
	left: 310px;
	top: 50px;
	width: 70%;
	height: 600px;
	
	margin-right: 140px;
	background: linear-gradient(to right,#ced9df,#f5f6f6);
	display: block;
}

.uploadhead {
	font: 30px "宋体";
	text-align: center;
}

.content-lw {
	line-height: 40px;
}
.current-sign {
	width: 100%;
	height: 100px;
	background-color: #f0f4f8;
	color: #525558;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
}
.current-gj {
	position: absolute;
	left: 310px;
	top: 50px;
	width: 78%;
	height: 600px;
	background-color: #bcd7da;
	display: none;
}
.tohistory {
	color: white;
	font-size: 17px;
	background-color: #62a4e4;
	border-radius: 5px;
}
.current-table {
	margin-top: 40px;
	line-height: 40px;
	text-align: center;
	width: 100%;
}
.current-ls {
	position: absolute;
	left: 310px;
	top: 50px;
	width: 78%;
	height: 600px;
	background-color: #bcd7da;
	display: none;
}
.overflow{
	overflow:auto;
	height:500px;
}
.a{
	border:2px solid #9dabbd;
}
.current-table-ls {
	width: 100%;
	margin-top: 40px;
	line-height: 50px;
	text-align: center;
}
.sub {
	width: 80px;
	display: block;
	font: 20px "宋体";
	margin: 0 auto;
}
</style>
<script src="${pageContext.request.contextPath }/jquery-1.11.3/jquery.js"></script>
<script>
	$(function() {
		//设置上传稿件div样式
		$(".content-lw input").attr("size", "100px").css("height", "30px");
		$(".content-lw textarea").css("width", "500px");
		$(".content-lw td:even").css("backgroundColor", "#39b6ee");

		//设置当前稿件div样式
		$(".current-gj tr:first").css({
			"backgroundColor" : "#1baff1",
			"fontSize" : "20px"
		});
		$(".left li").hover(function() {
			$(this).css({
				backgroundColor : "#8a8a8a",
				fontSize : "20px"
			})
		}, function() {
			$(this).css({
				backgroundColor : "",
				fontSize : "",
			})});
		//转为历史记录操作
		$(".tohistory").click(function() {
					var thisobj = this;
					var patentid = $(this).parent().siblings("td:eq(0)").text().trim();
					if(confirm("确定变为历史稿件吗")){
					
					$.ajax({
						url : "${pageContext.request.contextPath}/UploadPatent",
						type : "get",
						data : "patentid=" + patentid + "&sign=1",
						success : function(data) {
							var obj = eval("(" + data + ")");
							if (obj.flag === 'success') {
								//将当前的论文移除到历史论文中
								$(thisobj).parents("tr").remove();
								var alltd = $(thisobj).parent().siblings()
								var html = "<tr><td>" + alltd.eq(0).text() + "</td><td>"
										+ alltd.eq(1).text() + "</td><td>"
										+ alltd.eq(2).text() + "</td><td>"
										+ alltd.eq(3).text() + "</td><td>"
										+ alltd.eq(5).html()  + "</td><td>发放成功</td></tr>"
								$(html).appendTo(".current-table-ls");
								$(".a:eq(2)").show();
								$(".a:eq(1)").hide();
								$(".xg").remove();
								$("<div class='xg'></div>").appendTo($(".left li:eq(3)"));
							} else if (obj.flag === 'error') {
								alert("失败");
							}
						}
					})
					}
				})
		
		//历史稿件样式
		$(".current-table-ls tr:first").css("backgroundColor","#1baff1");
		//左侧菜单效果
		$("<div class='xg'></div>").appendTo($(".left li:eq(1)"));
		//点击回到首页
		$(".first").click(function(){
			window.location.href="${pageContext.request.contextPath }/shou.jsp";
		})
		$(".left .first").siblings().click(function() {

			$(".xg").remove();
			$("<div class='xg'></div>").appendTo($(this));
			var num = $(this).index() - 1;
			$(".a").eq(num).css("display", "block");
			$(".a").eq(num).siblings().css("display", "none");
		});
		$(".sub").click(function(){
			var flag=false;
			 $(".check").each(function(index,obj){
				if($(obj).val()==""){
					$(".sub").next().text("文本框中必填值未填写")
					flag=true;
					return;
				}
			}) 
			if(flag){
				return;
			}
			//var file1 = $("input[type=file]")[0].files[0].name;
			if($("input[type=file]").val()==''){
				$(".sub").next().text("请选择文件");
				return;
			}
			if($("input[type=file]")[0].files[0].name.substring($("input[type=file]")[0].files[0].name.lastIndexOf(".")+1) !='pdf'){
				$(".sub").next().text("文件类型不是pdf格式")
				return;
			}
			if($("input[type=file]")[0].files[0].size>1024 * 1024 * 10){
				$(".sub").next().text("文件不能大于10M")
				return;
			} 
			$("#form").submit();
	})
	})
</script>
<body>

	<div class="left">
		<ul>
			<li class="first">返回首页></li>
			<li>上传专利</li>
			<li>当前专利</li>
			<li>历史专利</li>
		</ul>
	</div>
	<div>
		<!-- 上传论文 -->
		<div class="right a">
		<div class="uploadhead">上传专利区</div><hr>
		<span>带*号的为必填项,上传文件必须是pdf格式</span>
			<div class="content-lw">
				<form action="${pageContext.request.contextPath }/UploadPatent" method="post"
					enctype="multipart/form-data" id="form">
					<table>
						<tr>
							<td>专利标题*</td>
							<td><input type="text" name="title"class="check"></td>
						</tr>
						<tr>
							<td>专利编号*</td>
							<td><input type="text" name="patentid"class="check"></td>
						</tr>
						<tr>
							<td>关键字</td>
							<td><input type="text" name="keyword"></td>
						</tr>
						<tr>
							<td>专利简述*</td>
							<td><textarea lang="100px" rows="6" name="summary"class="check"></textarea></td>
						<tr>
							<td>第一作者*</td>
							<td><input type="text" name="author"class="check"></td>
						</tr>
						<tr>
							<td>专利级别*</td>
							<td><input type="text" name="grade"class="check"></td>
						</tr>
						<tr>
							<td>银行卡号*</td>
							<td><input type="text" name="bankcard"class="check"></td>
						</tr>
						<tr>
							<td>联系电话*</td>
							<td><input type="text" name="telephone"class="check"></td>
						</tr>
						<tr>
							<td>上传专利*</td>
							<td><input type="file" name="patentimg"></td>
						</tr>
					</table>
					<input type="button"  value="提交" class="sub">
					<span>${sessionScope.flag1 }${requestScope.flag1 }</span>
					<%
						session.removeAttribute("flag1");
					%>
				</form>
			</div>
		</div>

		<!-- 当前稿件 -->

		<div class="current-gj a">
			<div class="uploadhead">当前稿件</div>
			<hr>
			<!-- flag为blank时  做出提醒-->
			<c:if test="${requestScope.flag == 'blank' }">
				<div class="current-sign">
					<span>你还没有任何的当前稿件</span>
				</div>
			</c:if>
			<div class="overflow">
				<table class="current-table" border="1" cellspacing="0">
					<tr>
						<td>文章编号</td>
						<td>文章标题</td>
						<td>第一作者</td>
						<td>所属学院</td>
						<td>银行卡号</td>
						<td>电子刊物下载</td>
						<td>审核状态</td>
						<td>操作</td>
					</tr>
					<!-- flag不为blank时 -->
					<c:if test="${requestScope.flag == 'noblank' }">
						<c:forEach items="${requestScope.allPatent }" var="p">
							<c:if test="${ p.historysign == '0'}">
								<tr>
									<td>${p.patentid }</td>
									<td>${p.title }</td>
									<td>${p.author }</td>
									<td>${p.department }</td>
									<td>${p.bankcard }</td>
									<td><a href="${pageContext.request.contextPath}/DownloadPatent?filename=${p.patentimg}">下载</a></td>
									<c:if
										test="${p.checksign =='2' || p.checksign =='3'|| p.checksign =='4'|| p.checksign =='5'}">
										<td style="color:#18849d">通过</td>
									</c:if>
									<c:if test="${p.checksign =='1'}">
										<td style="color:#d1552c">未通过院系审核</td>
									</c:if>
									<c:if test="${p.checksign =='0'}">
										<td style="color:#c95281">未审核</td>
									</c:if>

									<td><input type="button" class="tohistory"
										value="查看/转为历史记录"></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
		<!-- 历史稿件 -->

		<div class="current-ls a">
			<div class="uploadhead">历史稿件</div>
			<hr>
			<!--<c:if test="${requestScope.flag == 'noblank'}">
				<c:forEach items="${requestScope.allPatentr}" var="p">
					<c:if test="${p.historysign=='1' }">
						<div>
							<span>你还没有任何历史稿件</span>
						</div>
					</c:if>
				</c:forEach>
			</c:if>-->
			<div class="overflow">
				<c:if test="${requestScope.flag == 'noblank'}">
					<table class="current-table-ls" border="1">
						<tr>
							<td>文章编号</td>
							<td>文章标题</td>
							<td>第一作者</td>
							<td>所属学院</td>
							<td>论文下载</td>
							<td>奖励(已发放/未发放)</td>
						</tr>

						<c:forEach items="${ requestScope.allPatent}" var="p">
							<c:if test="${p.historysign == '1' }">
								<tr>
									<td>${p.patentid }</td>
									<td>${p.title }</td>
									<td>${p.author }</td>
									<td>${p.department }</td>
									<td><a href="${pageContext.request.contextPath}/DownloadPatent?filename=${p.patentimg}">下载</a></td>
									<td>已发放</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>