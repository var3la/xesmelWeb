<%@ page import="java.util.List,com.jorge.xesmel.model.*,com.jorge.xesmel.web.controller.utils.*, com.jorge.xesmel.web.controller.*" %>
 <%
 	Errors errors = (Errors) request.getAttribute(AttributeNames.ERRORS);
 	if (errors == null) {
 		errors = new Errors(); // Primera renderizacion
 	}
 
 	// Variable comun para los errors por parametro
 	String parameterError = null;
              	
 	List<String> commonErrors = errors.getCommonErrors();
 	if (commonErrors.size()>0) {
 %>
 	<div class="errors" style="color: red;font-family: monospace;">
 		<%
 			for (String error: commonErrors) {
 		%><li><%=error %></li>
 			<%
        	}
        %>
    </div>
              
	<%
    }
	%>