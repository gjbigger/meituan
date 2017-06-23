<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../base.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<style>
ul {
	list-style: none;
	padding: 0px;
}

.easyui-accordion div ul li {
	margin-top: 10px;
}

.easyui-accordion div ul li a {
	text-decoration: none;
}

.easyui-accordion div ul li a:hover {
	text-decoration: underline;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商店主页</title>
</head>

<body class="easyui-layout">  
	<!-- 顶部 --> 
    <div data-options="region:'north',split:true" style="height: 120px; padding: 10px;">
    	欢迎登录，${store.storeLoginName} <a href="store/logout">退出</a>
    </div>   
    
    <!-- 左侧菜单 -->
    <div data-options="region:'west',split:true" style="width: 150px;">
    	<div  class="easyui-accordion" style="width:300px;" fit=true>   
    	
   			<div title="商家信息" style="padding:10px;">   
   				<ul>
    				<li>
						<a href="javascript:centerShow('商家基础信息','view/store/store_base_info.jsp');">商家基础信息</a>
					</li>
					<li>
						<a href="javascript:centerShow('商家质量信息','view/store/store_quality_info.jsp');">商家质量信息</a>
					</li>
				</ul>     
    		</div>  
    		
    		<div title="菜品类别" style="padding-left:10px;padding-top:10px;">   
    			<ul>
    				<li>
						<a href="javascript:centerShow('菜品类别列表','view/dish_type/dish_type_list.jsp');">菜品类别列表</a>
					</li>
				</ul>
    		</div>    
    		
	    	<div title="菜品" style="padding:10px;">
	    		<ul>
    				<li>
						<a href="javascript:centerShow('菜品列表','view/dish/dish_list.jsp');">菜品列表</a>
					</li>
				</ul>     
	    	</div>   
	    	
	    	<div title="订单" style="padding:10px;">  
	    		<ul>
	    			<li>	
						<a href="javascript:centerShow('订单管理','view/order/order_list.jsp');">订单管理</a>
					</li>
					
				</ul> 
	    	</div>   
	    	
	    	<div title="评论" style="padding:10px;">  
	    		<ul>
	    			<li>	
						<a href="javascript:centerShow('评论管理','view/comment/comment_list.jsp');">评论管理</a>
					</li>
					
				</ul> 
	    	</div>   
	    	
	    	<div title="开张与打烊" style="padding:10px;">
	    		<ul>	
	    			<li>	
	    				<input id="openOrCloseRange" type="range"  min="1" max="2" style="width:120px;"/><br>
	    				<p id="openStatus" style="display: inline-block;">营业</p><p id="closeStatus" style="color:red;display: inline-block;margin-left: 73px;">打烊</p>
	    			</li>
	    		</ul>
	    	</div>
	    	
	    	
	    	
		</div>  
    </div>   
    
    <!-- 中央显示 -->
    <div data-options="region:'center'"
		style="padding: 5px; background: #eee;">
		<div id="tabs" class="easyui-tabs" fit=true>
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 100px">
					<font color="blue" size="10">美团后台</font>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	$(function(){
		$('#openOrCloseRange').change(function(){
			var value = $(this).val();
			var openOrClose = 0;
			if(value == 1) {
				openOrClose = 1;
			}
			
			$.ajax({
				type:'post',
				url:'store/updateSetOpenOrClose',
				data:'openOrClose='+openOrClose,
				dataType:'json',
				success:function(mm) {
					if(mm.code == 200) {
						if(value == 1) {
							$("#openStatus").css("color","red");
							$("#closeStatus").css("color","black");
						} else {
							$("#openStatus").css("color","black");
							$("#closeStatus").css("color","red");
						}
					} else {
						$.messager.alert("提示",mm.msg);
					}
				}
			})
		});
		
		
		//家在商店状态
		$.ajax({
			type:'post',
			url:'store/selectById',
			dataType:'json',
			success:function(store){
				if(store.openOrClose == 1) {
					$("#openStatus").css("color","red");
					$("#closeStatus").css("color","black");
					$('#openOrCloseRange').val(1);
				} else {
					$("#openStatus").css("color","black");
					$("#closeStatus").css("color","red");
					$('#openOrCloseRange').val(2);
				}
			}
		});
	});
	
	
	
	
	//中间区域显示
	function centerShow(text, url, iconCls) {
		var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='"
				+ url + "'></iframe>";
		$("#tabs").tabs("add", {
			title : text,
			iconCls : iconCls,
			content : content,
			closable: true
		});
	}
	
	
	function adminLogOut() {
		$.ajax({
			type:'post',
			url:'admin/logout',
			dataType:'json',
			success:function(mm) {
				if(mm.code == 200) {
					window.location.href="view/admin/admin_login.jsp";
				}
			}
		})
	}
	</script>
</body> 
</html>