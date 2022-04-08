<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jorge.xesmel.model.Colmena" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Colmena c = (Colmena) request.getAttribute("evento");
%>
<h3><%=c.getFechaAlta() %></h3>
<p><%=c.getTipoOrigenId() %></p>
</body>
</html>