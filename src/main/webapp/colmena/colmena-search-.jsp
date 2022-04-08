<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>xesmel</title>
</head>
<body>

	<!-- busqueda de colmenas -->
	<div id="colmena-search">
		<form action="/XesmelWeb/colmena" method="post">
			<input type="text" name="nombre" placeholder="codigo en apiario" /> <label>fecha
				desde:</label> <input type="date" name="fecha-desde" /> <select
				name="tipo-origen">
				<option value="1">produccion propia</option>
				<option value="2">compra</option>

			</select> <input type="submit" value="buscar" name="buscar" />

		</form>

	</div>



</body>
</html>