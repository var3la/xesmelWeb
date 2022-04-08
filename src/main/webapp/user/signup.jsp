<%@page import="com.jorge.xesmel.model.*"%>
<%@page import="com.jorge.xesmel.web.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html lang="es">

<head>2
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Xesmel | Sign Up</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="/XesmelWeb/img/svg/logo.svg" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="/XesmelWeb/css/style.min.css">
</head>

<body>
  <div class="layer"></div>
<main class="page-center">
  <article class="sign-up">
    <h1 class="sign-up__title">Empecemos!</h1>
    <p class="sign-up__subtitle">Introduce tus datos a continuación para registrarte</p>
    <form class="sign-up-form form" action="/XesmelWeb/user" method="post">
<!-- aqui se muestran los errores en caso de complimentar mal un campo -->
	<%@include file="/common/errors.jsp"%>
	
	<input type="hidden" name="action" value="<%=ActionNames.CREATE %>"/>
      <label class="form-label-wrapper">
      
      <%
      	parameterError = errors.getParameterError(ParameterNames.USER_NAME);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
        <p class="form-label">Nombre</p>
        <input class="form-input" type="text" name="<%=ParameterNames.USER_NAME %>" placeholder="Nombre" required value="<%=ParameterUtils.print(request.getParameter(ParameterNames.USER_NAME))%>"/>
      </label>

      <label class="form-label-wrapper">
        <p class="form-label">Primer apellido</p>
        <input class="form-input" type="text" placeholder="Apellido" required>
      </label>
      
      <label class="form-label-wrapper">
        <p class="form-label">Segundo apellido</p>
        <input class="form-input" type="text" placeholder="Apellido">
      </label>

      <label class="form-label-wrapper">
        <p class="form-label">Nombre comercial</p>
        <input class="form-input" type="text" placeholder="Nombre comercial" required>
      </label>
      
      <label class="form-label-wrapper">
        <p class="form-label">DNI</p>
        <input class="form-input" type="text" placeholder="DNI" required>
      </label>
      
      <label class="form-label-wrapper">
        <p class="form-label">Teléfono</p>
        <input class="form-input" type="text" placeholder="Teléfono" required>
      </label>
      
      <label class="form-label-wrapper">
        <p class="form-label">Email</p>
        <input class="form-input" type="email" placeholder="Email" required>
      </label>

      <label class="form-label-wrapper">
        <p class="form-label">Password</p>
        <input class="form-input" type="password" placeholder="Password" required>
      </label>

      <label class="form-label-wrapper">
        <p class="form-label">REGA</p>
        <input class="form-input" type="text" placeholder="Introduce REGA" required>
      </label>
      <label class="form-checkbox-wrapper">
        <input class="form-checkbox" type="checkbox" checked>
        <span class="form-checkbox-label">Recuérdame</span>
      </label>
      
      <button class="form-btn primary-default-btn transparent-btn">Regístrate</button><br>
      <p class="registertext">¿Ya estás registrado?</p><a class="link-info forget-link" href="/XesmelWeb/user/login.jsp">Inicia sesión aquí!</a>
    </form>
  </article>
</main>
<!-- Chart library -->
<script src="./plugins/chart.min.js"></script>
<!-- Icons library -->
<script src="plugins/feather.min.js"></script>
<!-- Custom scripts -->
<script src="js/script.js"></script>
</body>

</html>