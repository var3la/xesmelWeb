<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.jorge.xesmel.model.*,com.jorge.xesmel.web.controller.utils.*,com.jorge.xesmel.web.controller.*,java.util.*,java.text.*" %>
<%
		String context = request.getContextPath();
%>



<!DOCTYPE html>
<html>
<head>
<title>Panel de Gestión Xesmel</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link rel="shortcut icon" href="<%=context%>/img/logo/bee.png" type="image/x-icon">
<!-- Custom styles -->
<link rel="stylesheet" href="<%=context%>/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100;300;400;700;900&display=swap" rel="stylesheet">
<link href="<%=context%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=context%>/css/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="<%=context%>/css/magnific-popup.css">
<link href="<%=context%>/css/aos.css" rel="stylesheet">
<link href="<%=context%>/css/templatemo-nomad-force.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=context%>/img/logo/bee.png" type="image/x-icon">
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=context%>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	
	<%@include file="/common/navigation-menu.jsp"%>
	