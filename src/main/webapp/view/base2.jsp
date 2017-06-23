<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>

<link rel="stylesheet" type="text/css"
	href="../static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="../static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="../static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="../static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="../static/jquery-easyui-1.3.3/jquery.edatagrid.js"></script>
	
<link rel="stylesheet" href="../static/zTree_v3-3.5.28/css/demo.css" type="text/css">
<link rel="stylesheet" href="../static/zTree_v3-3.5.28/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="../static/zTree_v3-3.5.28/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="../static/zTree_v3-3.5.28/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="../static/zTree_v3-3.5.28/js/jquery.ztree.exedit.js"></script>  
<link href="../static/css/note.css" rel="stylesheet">
<link href="../static/sweetAlert/css/sweetalert2.min.css" rel="stylesheet">
<link href="../static/bootstrap3/css/bootstrap.css" rel="stylesheet">
<script src="../static/js/jquery-1.11.3.js"></script>
<script src="../static/sweetAlert/js/sweetalert2.min.js"></script>
<script src="../static/bootstrap3/js/bootstrap.js"></script>  
  
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础页面</title>
</head>
