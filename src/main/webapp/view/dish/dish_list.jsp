<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品管理</title>
</head>
<body>

	<table id="dg" class="easyui-datagrid" pagination=true rownumbers=true striped=true checkOnSelect=true pageSize=10 pageNumber=1 toolbar="#tb"
		url="dish/selectByParam" 
		fit=true>   
	    <thead>   
	        <tr>   
	        	<th field="cb" checkbox=true width="100"></th>
	            <th field="id" width="100">id</th>   
	            <th field="name" width="100">菜品名</th>
	            <th field="price" width="100">价格</th>  
	            <th field="monthSales" width="100">月销量</th> 
	            <th field="typeName" width="100">类别</th> 
	            <th field="detail">详情</th> 
	            <th field="typeId" hidden="true">类别id</th>
	        </tr>   
	    </thead>   
	</table>  

	
	<!-- 工具栏  -->
	<div id="tb">
		<a class="easyui-linkbutton" iconCls="icon-add" plain=true href="javascript:addDish();">新增</a> 
		<a class="easyui-linkbutton" iconCls="icon-remove" plain=true href="javascript:deleteDish();">删除</a> 
		<a class="easyui-linkbutton" iconCls="icon-edit" plain=true href="javascript:editDish();">编辑</a> 
		
		<span style="margin-left: 20px;margin-right: 20px;">|</span>
		
   		菜品名：<input id="queryName" type="text">
   		类别：<input id="queryTypeId" class="easyui-combobox" data-options="valueField:'value',textField:'text',url:'dishType/selectForCombobox'">
   		<a class="easyui-linkbutton" iconCls="icon-search" plain=true href="javascript:searchDish();"></a> 
	</div>




<!-- 添加编辑信息用的对话框 对话框 -->
<div id="addAndUpdateDialog" class="easyui-dialog" title="My Dialog" style="width:400px;height:200px;"  buttons="#addAndUpdateDialogButtons" 
        data-options="iconCls:'icon-save',resizable:true,modal:true" closable=false closed=true>   
    <form id="dishForm">
    	<input name="id"  type="hidden" id="dishId">
    	菜品名：<input name="name" type="text" class="easyui-validatebox" data-options="required:true"/><br>
    	菜品价格：<input name="price" class="easyui-numberbox" data-options="required:true"/><br>
    	类别：<input name="typeId"  class="easyui-combobox" data-options="required:true,valueField:'value',textField:'text',url:'dishType/selectForCombobox'"/><br>
    	详情：<textarea name="detail" class="easyui-validatebox" data-options="required:true"></textarea>
    </form>   
</div> 
<!-- 对话框的按钮栏 -->
<div id="addAndUpdateDialogButtons">
	<a class="easyui-linkbutton" iconCls="icon-save" plain=true href="javascript:addAndUpdateSave();">保存</a>
	<a class="easyui-linkbutton" iconCls="icon-cancel" plain=true href="javascript:cancel();">取消</a>
</div>




<script>
	
	//添加或编辑的保存
	function addAndUpdateSave() {
		var idValue = $("#dishId").val();
		var urlStr = "";
		if(idValue == '' || idValue == null) {
			urlStr = "dish/insert";
		} else {
			urlStr = "dish/update";
		}
		$.ajax({
			type:'post',
			url:urlStr,
			data:$("#dishForm").serialize(),
			dataType:'json',
			success:function(mm) {
				$.messager.alert("提示", mm.msg);
				if(mm.code == 200) {
					cancel();
					searchDish();
				}
			}
		});
	}


	//查询
	function searchDish() {
		$('#dg').datagrid('reload',{
			queryName: $("#queryName").val(),
			queryTypeId:$("#queryTypeId").datetimebox("getValue"),
		});
	}


	//取消
	function cancel() {
		//清空选择
		$("#dg").datagrid("clearSelections");
		//两个表单清空
		$("#dishForm").form("clear");
		//两个对话框关闭
		$("#addAndUpdateDialog").dialog("close");
	}

	
	//添加商品
	function addDish() {
		$("#addAndUpdateDialog").dialog("open").dialog("setTitle", "增加菜品");
	}
	
	//删除
	function deleteDish() {
		var selectionsArray = $("#dg").datagrid("getSelections");
		if(selectionsArray.length == 0) {
			$.messager.alert("提示", "至少选择一条");
			return;
		}
		if(selectionsArray.length > 1) {
			$.messager.alert("提示", "只能选择一条");
			return;
		}
		$.ajax({
			type:'post',
			url:'dish/delete',
			data:"id="+selectionsArray[0].id,
			dataType:'json',
			success:function(mm) {
				$.messager.alert("提示", mm.msg);
				if(mm.code == 200) {
					searchDish();
				}
			}
		})
	}

	
	//编辑商品信息
	function editDish() {
		var selectionsArray = $("#dg").datagrid("getSelections");
		if(selectionsArray.length == 0) {
			$.messager.alert("提示", "至少选择一条");
			return;
		}
		if(selectionsArray.length > 1) {
			$.messager.alert("提示", "只能选择一条");
			return;
		}
		
		$("#dishForm").form("load", selectionsArray[0]);
		$("#addAndUpdateDialog").dialog("open").dialog("setTitle", "编辑菜品");
	}
	

</script>
</body>
</html>