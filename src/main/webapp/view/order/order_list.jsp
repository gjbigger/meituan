<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
</head>
<body>

	<table id="dg" class="easyui-datagrid" pagination=true rownumbers=true striped=true checkOnSelect=true pageSize=10 pageNumber=1 toolbar="#tb"
		url="order/selectByParams" 
		fit=true>   
	    <thead>   
	        <tr>   
	        	<th field="cb" checkbox=true width="100"></th>
	            <th field="id" width="100">id</th>   
	            <th field="dishDetail" width="100">菜品详情</th>
	            <th field="totalMoney" width="100">总价</th>  
	            <th field="userName" width="100">用户</th> 
	            <th field="tel" width="100">联系电话</th> 
	            <th field="address" width="100">送餐地址</th> 
	            <th field="startSendTime" width="100">起送时间</th>
	            <th field="endSendTime" width="100">完成时间</th>
	            <th field="message">留言</th>
	            <th field="payOrNot" width="100" formatter=formatterPayOrNot>是否支付</th>
	            <th field="status" width="100" formatter=formatterStatus>状态</th>
	        </tr>   
	    </thead>   
	</table>  

	
	<!-- 工具栏  -->
	<div id="tb">
		<a class="easyui-linkbutton" iconCls="icon-add" plain=true href="javascript:receiveOrder();">接单</a> 
		<a class="easyui-linkbutton" iconCls="icon-remove" plain=true href="javascript:cancelOrder();">取消</a> 
		
		<span style="margin-left: 20px;margin-right: 20px;">|</span>
	
   		状态：<select id="queryStatus">
   			<option value="">请选择</option>
   			<option value="0">未接</option>
   			<option value="1">已接</option>
   			<option value="2">已送到</option>
   			<option value="-1">已取消</option>
   		</select>
   		<a class="easyui-linkbutton" iconCls="icon-search" plain=true href="javascript:searchOrder();"></a> 
   		
   		<span style="margin-left: 20px;margin-right: 20px;">|</span>
   		
   		新订单数：<span id="newOrderCount"></span>
	</div>



<script>
function formatterPayOrNot(value,row,index) {
	if(row.payOrNot == 1) {
		return "在线支付";
	} else {
		return "货到付款";
	}
}


function formatterStatus(value,row,index) {
	if(row.status == 0) {
		return "未接单";
	} else if(row.status == 1){
		return "已接单";
	} else if(row.status == 2) {
		return "已送到";
	} else {
		return "已取消";
	}
}


	$(function(){
		searchNewOrderCount();
		
		setInterval(function(){
			searchNewOrderCount();
			searchOrder();
		}, 10000)
	});

	
	//查询新订单数
	function searchNewOrderCount() {
		$.ajax({
			type:'post',
			url:'order/selectByParams',
			data:'queryStatus=0&page=1&rows=10',
			dataType:'json',
			success:function(map) {
				$("#newOrderCount").html(map.total);
			}
		});
	}
	
	
	
	
	

	//查询
	function searchOrder() {
		$('#dg').datagrid('reload',{
			queryStatus: $("#queryStatus").val()
		})
	}


	//接单
	function receiveOrder() {
		var selectionsArray = $("#dg").datagrid("getSelections");
		if(selectionsArray.length == 0) {
			$.messager.alert("提示", "至少选择一条");
			return;
		}
		if(selectionsArray.length > 1) {
			$.messager.alert("提示", "只能选择一条");
			return;
		}
		
		if(selectionsArray[0].status != 0) {
			$.messager.alert("提示","接单错误");
			return;
		}
		
		$.ajax({
			type:'post',
			url:'order/updateSetStatus',
			data:'id='+selectionsArray[0].id+"&status=1",
			dataType:'json',
			success:function(mm) {
				if(mm.code == 200) {
					$.messager.alert("提示","接单成功");
					searchOrder();
					searchNewOrderCount();
					return;
				}
				$.messager.alert("提示","接单失败");
			}
		})
		
	}
	
	
	//取消
	function cancelOrder() {
		var selectionsArray = $("#dg").datagrid("getSelections");
		if(selectionsArray.length == 0) {
			$.messager.alert("提示", "至少选择一条");
			return;
		}
		if(selectionsArray.length > 1) {
			$.messager.alert("提示", "只能选择一条");
			return;
		}
		
		if(selectionsArray[0].status != 1 || selectionsArray[0].status != 0) {
			$.messager.alert("提示","取消错误");
			return;
		}
		
		$.ajax({
			type:'post',
			url:'order/updateSetStatus',
			data:'id='+selectionsArray[0].id+"&status=-1",
			dataType:'json',
			success:function(mm) {
				if(mm.code == 200) {
					$.messager.alert("提示","取消成功");
					searchOrder();
					searchNewOrderCount();
					return;
				}
				$.messager.alert("提示","取消失败");
			}
		})
	}
	

</script>
</body>
</html>