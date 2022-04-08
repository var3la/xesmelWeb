package com.jorge.xesmel.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.jorge.xesmel.model.EventoCriteria;
import com.jorge.xesmel.model.EventoDTO;
import com.jorge.xesmel.service.EventoService;
import com.jorge.xesmel.service.impl.EventoServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;
import com.jorge.xesmel.web.controller.utils.ViewPaths;

//@WebServlet("/evento")
public class EventoServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(EventoServlet.class);
	private EventoService eventoService = null;
	
	public EventoServlet() {
		super();
		eventoService = new EventoServiceImpl();		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String targetView = null;
		boolean forward = true;
		
		String action = request.getParameter(ParameterNames.ACTION);
		
		//busqueda 

		
		if (ActionNames.SEARCH.equalsIgnoreCase(action)) {
			
			EventoDTO evento = (EventoDTO)request.getSession().getAttribute(AttributeNames.EVENTO);
			
			String comentarioStr = request.getParameter(ParameterNames.COMENTARIO);
			String fechaInicioStr = request.getParameter(ParameterNames.FECHA_DESDE);
			String fechaFinStr = request.getParameter(ParameterNames.FECHA_HASTA);
			String tipoEventoStr = request.getParameter(ParameterNames.TIPO_EVENTO);
			
			EventoCriteria ec = new EventoCriteria();
			ec.setComentario(comentarioStr);
			ec.setFechaInicio(null);
			ec.setFechaFin(null);
			ec.setTipoEventoId(null);
			
			try {
				
				List<EventoDTO> eventos = eventoService.findBy(ec);
				request.setAttribute(AttributeNames.EVENTOS, eventos);
				request.getRequestDispatcher(ViewPaths.COLMENA_RESULTS).forward(request, response);
				
			}catch (Exception e) {
				logger.error(ec, e);
			}
			
		//Detalle Busqueda	
			
		}else if(ActionNames.DETAIL.equalsIgnoreCase(action)) {
			
			String eventoIdStr = request.getParameter(ParameterNames.EVENTO_ID);
			
			try {
				
				EventoDTO evento = eventoService.findById(Long.valueOf(eventoIdStr));
				request.setAttribute(ParameterNames.EVENTO_ID, evento);
				request.getRequestDispatcher(ViewPaths.EVENTO_DETAIL).forward(request, response);
			}catch (Exception e) {
				logger.error(eventoIdStr, e);
				
			}
			
		//Crear Aventos
			
		}else if (ActionNames.CREATE.equalsIgnoreCase(action)) {
			
			String comentarioStr = request.getParameter(ParameterNames.COMENTARIO);
			String fechaInicioStr = request.getParameter(ParameterNames.FECHA_DESDE);
			String fechaFinStr = request.getParameter(ParameterNames.FECHA_HASTA);
			String colmenaIdStr = request.getParameter(ParameterNames.COLMENA_ID);
			String medicamentoIdStr = request.getParameter(ParameterNames.MEDICAMENTO_ID);
			String tipoEventoStr = request.getParameter(ParameterNames.TIPO_EVENTO);
			
			
			try {
				
				EventoDTO evento = new EventoDTO();
				evento.setComentario(comentarioStr);
				evento.setFechaInicio(null);
				evento.setFechaFin(null);
				evento.setColmenaId(null);
				evento.setMedicamentoId(null);
				evento.setTipoEventoId(null);
				
				eventoService.create(evento);
				request.setAttribute(AttributeNames.EVENTO, evento);
				request.getRequestDispatcher(ViewPaths.EVENTO_DETAIL).forward(request, response);
				
			}catch (Exception e) {
				logger.error(comentarioStr ,e);
			}
		}
		
				
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
