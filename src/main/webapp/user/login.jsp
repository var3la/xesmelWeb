<%@page import="com.jorge.xesmel.model.*,com.jorge.xesmel.web.controller.utils.*,com.jorge.xesmel.web.controller.*"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Xesmel | login</title>
<!-- Favicon -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/logo/bee.png" type="image/x-icon">
<!-- Custom styles -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
	<div class="layer"></div>
	<main class="page-center">
		<article class="sign-up">
			<h1 class="sign-up__title">Bienvenido de nuevo!</h1>
			<p class="sign-up__subtitle">Introduce tus datos para continuar</p>
			<form class="sign-up-form form" id="formulario" action="<%=request.getContextPath()+ControllerPaths.USER%>" method="post">
				
				<%@include file="/common/errors.jsp"%>
				
				<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ActionNames.LOGIN%>"/>
				
					<%
 					parameterError = errors.getParameterError(ErrorNames.MAIL_ERROR);
 					if (parameterError != null) {
 					%>
 					<p><%=parameterError%></p> 
					<%
 					}
 					%>
 					<span class="error" id="errorEmail"></span>
 				<label class="form-label-wrapper">
					<p class="form-label">Email</p>
					<input name="<%=ParameterNames.EMAIL%>" class="form-input" type="email" id="email" placeholder="Introduce tu email"
					value="<%=ParameterUtils.print(request.getParameter(ParameterNames.EMAIL))%>"required>
				</label> 
				
					<%
 					parameterError = errors.getParameterError(ErrorNames.PASSWORD_ERROR);
 					if (parameterError != null) {
 					%>
					<p><%=parameterError%></p> 
					<%
 					}
 					%>
 					<span class="error" id="errorPassword"></span>		
				<label class="form-label-wrapper">
					<p class="form-label">Contraseña</p>
					
					<input name="<%=ParameterNames.PASSWORD%>" class="form-input" type="password" id="password" placeholder="Introduce tu contraseña"
					required>
					
				</label> 
				<a class="link-info forget-link" href="##">¿Has olvidado tu	contraseña?</a>
				<button type="submit" id="botonEnviar" class="form-btn primary-default-btn transparent-btn">Entrar</button>
				
				<br>
				<p class="registertext">¿No tienes cuenta?</p>
				<a class="link-info forget-link" href="<%=request.getContextPath()+ViewPaths.USER_SIGNUP%>">Regístrate!</a>
			</form>

		</article>
	</main>
	
	<!-- Chart library -->
	<script src="<%=request.getContextPath()%>/plugins/chart.min.js"></script>
	<!-- Icons library -->
	<script src="<%=request.getContextPath()%>/plugins/feather.min.js"></script>
	<!-- Custom scripts -->
	<script src="<%=request.getContextPath()%>/js/script.js"></script>
	
</body>

