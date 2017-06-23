<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@include file="../base.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品类别管理</title>
</head>
<body style="padding:50px;">

	<div style="float: left;">
		<select id="dishTypeSelect" multiple="multiple" style="width:100px;;height:300px;">
		</select>
		<br>
		<button type="button" id="deleteDishTypeBtn">删除类别</button>
	</div>
	
	<div style="float: left;width:300px;height:300px;margin-left:100px;">
		<form id="addDishTypeForm">
			类别名：<input id="dishTypeName" class="easyui-validatebox" data-options="required:true">
			<br>
			<button type="button" id="saveBtn">保存</button>
		</form>
	</div>

<script>
$(function(){
	search();
	saveBtnClick();
	deleteDishTypeBtnClick();
});



//删除按钮单击事件
function deleteDishTypeBtnClick() {
	$("#deleteDishTypeBtn").click(function(){
		var value = $("#dishTypeSelect").val();
		if(value == null || value=='') {
			$.messager.alert("提示","至少选中一条");
			return;
		}
		if(value.length >= 2) {
			$.messager.alert("提示","只能选中一条");
			return;
		}
		$.ajax({
			type:'post',
			url:'dishType/delete',
			data:'id='+value,
			dataType:'json',
			success:function(mm) {
				$.messager.alert("提示", mm.msg);
				if(mm.code == 200) {
					search();
				}
			}
		})
	});
}


//保存按钮单击事件
function saveBtnClick() {
	$("#saveBtn").click(function(){
		if($("#addDishTypeForm").form("validate")) {
			$.ajax({
				type:'post',
				url:'dishType/insert',
				data:'name='+$('#dishTypeName').val(),
				dataType:'json',
				success:function(mm) {
					$.messager.alert("提示", mm.msg);
					if(mm.code == 200) {
						search();
					}
				}
			})
		}
	});
}

//查询
function search() {
	$.ajax({
		type:'post',
		url:'dishType/selectByStoreId',
		dataType:'json',
		success:function(list) {
			var opStr = "";
			for(var i=0; i<list.length; i++) {
				opStr += "<option value='"+list[i].id+"'>"+list[i].name+"</option>";
			}
			$("#dishTypeSelect").html(opStr);
		}
	});
}
</script>
</body>
</html>