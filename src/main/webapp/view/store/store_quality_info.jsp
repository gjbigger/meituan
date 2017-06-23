<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家质量信息</title>
</head>
<body>

	<form id="storeInfoForm">
		平均送餐时间:<input name="avgSendTime" readonly="readonly"><br>
		月销量:<input name="monthSell" readonly="readonly"><br>
		商店星级:<input name="star" readonly="readonly"><br>
	</form>
	
<script>
$(function(){
	search();
});

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
</script>
</body>
</html>