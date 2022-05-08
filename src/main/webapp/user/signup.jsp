<%@page import="com.jorge.xesmel.model.*"%>
<%@page import="com.jorge.xesmel.web.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

   
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Xesmel | Sign Up</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/logo/bee2.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript"></script>
</head>

<body>
  <div class="layer"></div>
<main class="page-center">
  <article class="sign-up">
    <h1 class="sign-up__title">Empecemos!</h1>
    <p class="sign-up__subtitle">Introduce tus datos a continuación para registrarte</p>
    <form class="sign-up-form form" name="registerUser"id="registerUser"action="<%=request.getContextPath()+ControllerPaths.USER%>" method="post">
<!-- aqui se muestran los errores en caso de complimentar mal un campo -->
	<%@include file="/common/errors.jsp"%>
	
	<input type="hidden" name="<%=ParameterNames.ACTION %>" value="<%=ActionNames.SIGNUP%>"/>
		<span id="error_name" class="error"></span>
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
        <input class="form-input" type="text" name="<%=ParameterNames.USER_NAME %>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.USER_NAME))%>" placeholder="Nombre" required/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.USER_NAME);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
		<span id="error_apellido1" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">Primer apellido</p>
        <input class="form-input" type="text" name="<%=ParameterNames.LAST_NAME%>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.LAST_NAME))%>"placeholder="Apellido" required/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.LAST_NAME);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
      	<span id="error_apellido2" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">Segundo apellido</p>
        <input class="form-input" type="text" name="<%=ParameterNames.LAST_NAME_TWO%>"value=" <%=ParameterUtils.print(request.getParameter(ParameterNames.LAST_NAME_TWO)) %>"placeholder="Segundo Apellido"/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.LAST_NAME_TWO);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
		<span id="error_nombreComercial" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">Nombre comercial</p>
        <input class="form-input" type="text" name="<%=ParameterNames.TRADENAME%>"value=" <%=ParameterUtils.print(request.getParameter(ParameterNames.TRADENAME)) %>" placeholder="Nombre comercial"/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.TRADENAME);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
      	<span id="error_dni" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">DNI</p>
        <input class="form-input" type="text" name="<%=ParameterNames.DNI%>"value=" <%=ParameterUtils.print(request.getParameter(ParameterNames.DNI)) %>"placeholder="DNI" required/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.DNI);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
      	<span id="error_telefono" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">Teléfono</p>
        <input class="form-input" type="text" name="<%=ParameterNames.PHONE%>" value="<%=ParameterUtils.print(request.getParameter(ParameterNames.PHONE)) %>"placeholder="Teléfono" required/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.PHONE);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
      	<span id="error_email" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">Email</p>
        <input class="form-input" type="email" name="<%=ParameterNames.EMAIL%>" value="<%=ParameterUtils.print(request.getParameter(ParameterNames.EMAIL)) %>"placeholder="Email" required/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.EMAIL);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
		<span id="error_password" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">Password</p>
        <input class="form-input" type="password" name="<%=ParameterNames.PASSWORD%>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.PASSWORD)) %>"placeholder="Password" required/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.PASSWORD);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
		<span id="error_rega" class="error"></span>
      <label class="form-label-wrapper">
        <p class="form-label">REGA</p>
        <input class="form-input" type="text" name="<%=ParameterNames.REGA%>" value="<%=ParameterUtils.print(request.getParameter(ParameterNames.REGA)) %>"placeholder="REGA" required/>
      </label>
      <%
      	parameterError = errors.getParameterError(ParameterNames.REGA);
      	if (parameterError!=null){
      %>
      	<p><i><%=parameterError %></i></p>
      <%
      	}
      %>
      
      <button class="form-btn primary-default-btn transparent-btn">Regístrate</button><br>
      <p class="registertext">¿Ya estás registrado?</p><a class="link-info forget-link" href="<%=request.getContextPath()%>/user/login.jsp">Inicia sesión aquí!</a>
    </form>
  </article>
</main>
<script>
	
	
</script>
<!-- Chart library -->
<script src="<%=request.getContextPath()%>/plugins/chart.min.js"></script>
<!-- Icons library -->
<script src="<%=request.getContextPath()%>/plugins/feather.min.js"></script>
<!-- Custom scripts -->
<script src="<%=request.getContextPath()%>/js/script.js"></script>
</body>

</html>