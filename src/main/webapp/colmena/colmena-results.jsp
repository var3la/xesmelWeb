<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, com.jorge.xesmel.model.Colmena"%>


	<%
	List<Colmena> colmenas = (List<Colmena>) request.getAttribute("resultados");
	for (Colmena c : colmenas) {
	%>
	
	<p>
		<a
			href="/XesmelWeb/colmena?action=detail&colmena-id=<%=c.getId()%>"><%=c.getCodEnApiario()%>
			a <%=c.getFechaAlta()%></a>
	</p>



	<%
	}
	%>
</body>
</html>