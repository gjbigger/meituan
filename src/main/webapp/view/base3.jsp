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
<link href="static/css/note.css" rel="stylesheet">
<link href="static/sweetAlert/css/sweetalert2.min.css" rel="stylesheet">
<link href="static/bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet">
<script src="static/js/jquery-1.11.3.js"></script>
<script src="static/sweetAlert/js/sweetalert2.min.js"></script>

<script src="static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script src="static/bootstrap-3.3.7/js/dropdown.js"></script>
<script src="static/bootstrap-3.3.7/js/button.js"></script>
<script src="static/bootstrap-3.3.7/js/modal.js"></script>

<title>基础页面</title>
</head>
