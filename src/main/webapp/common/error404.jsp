<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/404.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/logo/bee.png" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Página no encontrada</title>
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
            <div class='_404'>404</div>
            <hr>
            <div class='_1'>THE PAGE</div>
            <div class='_2'>WAS NOT FOUND</div>
            <a class='btn' href='<%=request.getContextPath()%>/indexHome.jsp'>BACK TO XESMEL</a>
        </div>
</body>
</html>