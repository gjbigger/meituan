<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论管理</title>
</head>
<body>

	<table id="dg" class="easyui-datagrid" pagination=true rownumbers=true striped=true checkOnSelect=true pageSize=10 pageNumber=1 toolbar="#tb"
		url="comment/selectByStoreId" 
		fit=true>   
	    <thead>   
	        <tr>   
	        	<th field="cb" checkbox=true width="100"></th>
	            <th field="id" width="100">id</th>   
	            <th field="orderId" width="100">订单id</th>
	            <th field="content" width="100">内容</th>  
	            <th field="star" width="100">评分</th> 
	        </tr>   
	    </thead>   
	</table>  

	
	<!-- 工具栏  -->
	<div id="tb">
   		评分：<select id="queryStar">
   			<option value="">请选择</option>
   			<option value="1">一星</option>
   			<option value="2">二星</option>
   			<option value="3">三星</option>
   			<option value="4">四星</option>
   			<option value="5">五星</option>
   		</select>
   		<a class="easyui-linkbutton" iconCls="icon-search" plain=true href="javascript:searchComment();"></a> 
	</div>



<script>
	

	//查询
	function searchComment() {
		$('#dg').datagrid('reload',{
			queryStar: $("#queryStar").val(),
		});
	}


</script>
</body>
</html>