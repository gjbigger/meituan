<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家注册</title>
</head>
<body>

商家注册
<form id="storeRegForm">
	Login Name: <input type="text" id="loginName"  class="easyui-validatebox" data-options="required:true"><br/>
	Pwd: <input type="password" id="pwd"  class="easyui-validatebox" data-options="required:true"><br/>
	Confirm Pwd: <input type="password" id="comPwd"  class="easyui-validatebox" data-options="required:true"><br>
	<button type="button" id="btn">Submit</button> 
</form>

<script>
$(function(){
	//注册
	$("#btn").click(function(){
		if(!$("#storeRegForm").form("validate")) {
			return;
		}
		
		var pwd = $("#pwd").val();
		var comPwd = $("#comPwd").val();
		if(pwd != comPwd) {
			$.messager.alert('提示', "两次输入密码不一致");
			return;
		}
		
		$.ajax({
			type:'post',
			url:'store/register',
			data:'storeLoginName='+$("#loginName").val()+"&storePwd="+$("#pwd").val(),
			dataType:'json',
			success:function(mm) {
				if(mm.code == 200) {
					window.location.href="view/store/store_login.jsp";
				}
			}
		});
	});
	
});


</script>
</body>
</html>