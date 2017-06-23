<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家登录</title>
</head>
<body>

商家登录
<form id="storeLoginForm">
	Login Name: <input type="text" id="loginName" class="easyui-validatebox" data-options="required:true"><br/>
	Pwd: <input type="password" id="pwd" class="easyui-validatebox" data-options="required:true"><br/>
	<button type="button" id="btn">Submit</button> 
	<button type="button" id="toRegBtn">Register</button>
</form>

<script>
$(function(){
	
	$("#toRegBtn").click(function(){
		window.location.href="view/store/store_register.jsp";
	});
	
	
	$("#btn").click(function(){
		if(!$("#storeLoginForm").form("validate")) {
			return;
		}
		
		$.ajax({
			type:'post',
			url:'store/login',
			data:'storeLoginName='+$("#loginName").val()+"&storePwd="+$("#pwd").val(),
			dataType:'json',
			success:function(mm) {
				if(mm.code == 200) {
					window.location.href="view/store/store_index.jsp";
					return;
				}
				$.messager.alert("提示", mm.msg);
			}
		});
	})
	
});


</script>
</body>
</html>