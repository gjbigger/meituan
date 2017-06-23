<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<head>
<base href="<%=basePath%>">

<link rel="stylesheet" type="text/css"
	href="static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="static/jquery-easyui-1.3.3/jquery.edatagrid.js"></script>
	
  
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础页面</title>
</head>
