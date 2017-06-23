<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家基础信息</title>
</head>
<body>

	<form id="storeInfoForm">
		商店名称:<input name="name" class="easyui-validatebox" data-options="required:true"><br>
		商店地址:<input name="address" class="easyui-validatebox" data-options="required:true"><br>
		商店联系电话:<input name="tel" class="easyui-validatebox" data-options="required:true"><br>
		营业时间:<input name="hours" class="easyui-validatebox" data-options="required:true"><br>
		起送价:<input name="leastMoney" class="easyui-numberbox" data-options="required:true"><br>
		配送费:<input name="fee" class="easyui-numberbox" data-options="required:true"><br>
		商店公告:<textarea name="notice" class="easyui-validatebox" data-options="required:true"></textarea><br>
		<button type="button" id="saveBtn">保存修改</button>
		<button type="button" id="rollBackBtn">还原</button>
	</form>
	
	
<script>
$(function(){
	saveBtnClick();
	rollBackBtnClick();
	search();
});

//还原按钮单击事件
function rollBackBtnClick() {
	$("#rollBackBtn").click(function(){
		search();
	});
}

//查询
function search() {
	$.ajax({
		type:'post',
		url:'store/selectById',
		dataType:'json',
		success:function(store) {
			$('#storeInfoForm').form("load", store);
		}
	});
}

//保存按钮单击事件
function saveBtnClick() {
	$("#saveBtn").click(function(){
		if($("#storeInfoForm").form("validate")) {
			$.ajax({
				type:'post',
				url:'store/update',
				data:$("#storeInfoForm").serialize(),
				dataType:'json',
				success:function(mm) {
					$.messager.alert("提示", mm.msg)
					if(mm.code == 200) {
						search();
					}
				}
			});
		}
	});
}
</script>
</body>
</html>