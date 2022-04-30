<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="<%=request.getContextPath()%>/css/404.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/logo/bee.png" type="image/x-icon">
<title>Problemas de conexión</title>
</head>
<body>
	<div id="clouds">
            <div class="cloud x1"></div>
            <div class="cloud x1_5"></div>
            <div class="cloud x2"></div>
            <div class="cloud x3"></div>
            <div class="cloud x4"></div>
            <div class="cloud x5"></div>
        </div>
        <div class='c'>
            <div class='_404'>500</div>
            <hr>
            <div class='_1'>INTERNAL</div>
            <div class='_2'>SERVER ERROR</div>
            <a class='btn' href='<%=request.getContextPath()%>/user/login.jsp'>BACK TO XESMEL</a>
        </div>
</body>
</html>