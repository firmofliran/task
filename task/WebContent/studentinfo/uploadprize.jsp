<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传获奖信息</title>
<style type="text/css">
li {
	list-style: none
}

.header {
	text-align: center;
	color: white;
	text-shadow: 1px 1px 2px;
	font-size: 30px;
	font-weight: 400;
	background-color: #2c4c57;
	margin: 10px 100px 0px;
	padding-bottom: 10px;
}

.all {
	height: 600px;
	border: 2px solid #2a6376;
	margin: 10px 100px 10px;
	background: #dbdbdb;
	font-size: 22px;
	color: #626465;
	text-shadow: 0px 0px 5xp;
	line-height: 40px;
	position: relative;
}

.first {
	position: absolute;
	left: 200px;
	top: 40px;
}

.second {
	position: absolute;
	left: 600px;
	top: 40px;
}

.content-buttom {
	position: absolute;
	left: 500px;
	top: 350px;
}
.content-buttom span{
	color:#409fb9;
}
.sub {
	width: 100px;
	height: 30px;
	color:white;
	font-size:20px;
	cursor:pointer;
	background-color: #657c84;
	margin-left: 80px;
}

.upload {
	border: 2px solid #cdcdcd;
	cursor: pointer;
	width: 70px;
	height:70px;
}
/*表单验证颜色*/
.checkform{
	color:red;
	font-size: 18px;
}
</style>

<script src="${pageContext.request.contextPath }/jquery-1.11.3/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("input[type=text]").css({
			"margin-left" : "20px",
			"backgroundColor" : "#16ac96"
		})
		$("input[type=file]").css("display", "none");
		$(".sub").click(function(){
		})
		//显示文件上传的文件名
		$("input[type=file]").change(function(){
			var name = $(this)[0].files[0].name;
			var size = $(this)[0].files[0].size;
			$("#detial").text(name);
		})
		//对表单进行验证
		$(".sub").click(function(){
			$(".checkform").remove();
			//表单为空验证
			 var arr = $("form input[type=text]")
			/* for(var i in arr){
				if($(i).val()==""){
					$("<span class='checkform'>不能为空</span>").insertAfter($(i));
					return;
				}
			} */
			/* $("form input[type=text]").each(function(index,obj){
				if($(obj).val()==""){
					$("<span class='checkform'>不能为空</span>").insertAfter($(obj));
					flag=false;
					return;
				}
				
			}); */
			/* if(flag ===false){
				return;
			} */
			//学号验证
			var sno = $("input[name=sno");
			if(sno.val()!=""){
				if(sno.val()!="${sessionScope.student.sno}"){
					sno.next().remove();
					$("<span class='checkform'>学号错误</span>").insertAfter(sno);
					return;
				}else {
					sno.next().remove();
				}
			}else{
				$("<span class='checkform'>请填写学号</span>").insertAfter(sno);
			}
			//比赛id验证 查找数据库中是否存在此比赛id
			checkPid();//执行编号是否存在验证
			if(!flag){
				return;
			}
			/* var arrInput = $(".checkBlank");
		  for(var i in arrInput){
			if(i.value==""){
				alert($(i).val())
				alert("有内容未填写")
				//$("<span class='checkform'>不能为空</span>").insertAfter($(i));
				
			}
		}   */
			//文件是否为空
			if($(".form input[type=file]").val()==""){
				$("<span class='checkform'>(文件不能为空)</span>").insertAfter($("#detial"));
				return;
			}
				$(".form").submit();
		});
		$("input[type=file]").change(function(){
			$("#detial").next().remove();
		})
	})
		function checkPid(){
		var pid = $("input[name=pid");
		flag =true;
		if(pid.val()!=""){
			$.ajax({
				type:"get",
				async: false,
				url:"${pageContext.request.contextPath}/UploadServlet",
				data:"pid="+pid.val(),
				success:function(data){
					var json = eval("("+data+")");
					if(json.flag=="error"){
						pid.next().remove();
						flag= false;
						$("<span class='checkform'>比赛编号错误</span>").insertAfter(pid);
						//alert(flag)
					}else{
						pid.next().remove();
					}
				},
			});
		}else{
			flag= false;
			pid.next().remove();
			$("<span class='checkform'>请填写比赛编号</span>").insertAfter(pid);
		}
		}
</script>
<body>
	<div class="header">上传获奖信息</div>
	<div class="all">
	<span>请在下面填写你的获奖信息</span>
	<hr>
		<form action="${pageContext.request.contextPath}/UploadServlet" method="post" class="form"
			enctype="multipart/form-data">
			<ul class="first">
				<li>学&nbsp;&nbsp;&nbsp;&nbsp;号 <input type="text" name="sno"></li>
				<li>姓&nbsp;&nbsp;&nbsp;&nbsp;名 <input type="text" name="name" required class="checkBlank"></li>
				<li>银行卡号 <input type="text" name="bankcard" required class="checkBlank"></li>
				<li>上传文件</li>
					<li><label> <img
							src="${pageContext.request.contextPath}/images/uploadimg.png"
							class="upload"> <input type="file" name="file">
					</label><span id="detial">请选择文件</span></li>
			</ul>
			<ul class="second">
				<li>比赛编号<input type="text" name="pid"></li>
				<!-- <li>比赛名称<input type="text" name="comname"></li>
				<li>比赛类别<input type="text" name="category"></li> -->
				<li>获奖级别<input type="text" name="grade" required class="checkBlank"></li>
				</ul>
				
			<div class="content-buttom">
					<input type="button" value="提交" class="sub" ><span>${requestScope.flag}${sessionScope.uploadflag}</span>
					<%session.removeAttribute("uploadflag");%>
			</div>

		</form>
	</div>
</body>

<script type="text/javascript">
	//判断输入的是数字
	/*var bh = document.getElementById("bh");
	bh.onkeydown = function() {
		var re = /^[0-9]+.?[0-9]*$/;
		if (!re.test(bh.value)) {
			alert("请输入数字");
		}
	};*/
</script>
</html>