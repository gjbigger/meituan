<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../base3.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户管理</title>


</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">

		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" style="font-size: 25px" href="">美团</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="store?op=searchStoreParams&openOrClose=1"><i
						class="glyphicon glyphicon-cloud"></i>&nbsp;主&nbsp;&nbsp;页</a></li>
						
				<li><a href="user/logout"><i
						class="glyphicon glyphicon-exit"></i>&nbsp;退&nbsp;&nbsp;出</a></li>
			</ul>
			
		</div>

	</div>
	</nav>
	<div class="container">
		<div class="row-fluid">
			<div class="col-md-3">
			
				<div class="data_list" style="margin-top: 85px;">
					<div class="data_list_title">
						<span class="glyphicon glyphicon-calendar"> </span>&nbsp;信息管理
					</div>

					<div>
						<ul class="nav nav-pills nav-stacked" id="groupByPublishTime">
							<li>用户名：${user.userName }</li>
						</ul>
					</div>
				</div>
			
				
				<div class="data_list">
					<div class="data_list_title">
						<span class="glyphicon glyphicon-calendar"> </span>&nbsp;订单管理
					</div>

					<div>
						<ul class="nav nav-pills nav-stacked" id="groupByPublishTime">
							<li><a href="order/selectByUserId">我的订单</a></li>
						</ul>
					</div>
				</div>
				
				
				<div class="data_list">
					<div class="data_list_title">
						<span class="glyphicon glyphicon-list-alt"> </span>&nbsp;评论管理
					</div>
					<div>
						<ul class="nav nav-pills nav-stacked" id="groupByType">
						<li><a href='comment/selectByUserId'>我的评论</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		
		<!-- 模板填充区域 -->
		<div class="col-md-9" style="margin-top: 70px;">
			<c:choose>
				<c:when test="${empty user_change }">
				</c:when>
				<c:otherwise>
					<jsp:include page="${user_change}"></jsp:include>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	

</body>
</html>