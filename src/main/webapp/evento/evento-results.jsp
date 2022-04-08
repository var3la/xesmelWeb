<%@page import="com.jorge.xesmel.web.controller.utils.AttributeNames"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List, com.jorge.xesmel.model.EventoDTO"%>

<%	
			List<EventoDTO> eventos = (List<EventoDTO>) request.getAttribute(AttributeNames.EVENTOS);
			for (EventoDTO e : eventos){
%>
			<a href="XesmelWeb/evento?action=detail&evento-id="<%e.getId(); %>>
			
			
			</a>

<%
			}
%>