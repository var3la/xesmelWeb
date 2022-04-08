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

import com.jorge.xesmel.model.Apiario;
import com.jorge.xesmel.model.ApiarioCriteria;
import com.jorge.xesmel.service.ApiarioService;
import com.jorge.xesmel.service.impl.ApiarioServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;
import com.jorge.xesmel.web.controller.utils.ViewPaths;


public class ApiarioServlet extends HttpServlet{

	private static Logger logger = LogManager.getLogger(ApiarioServlet.class);
	private ApiarioService apiarioService = null;
	
	public ApiarioServlet() {
		super();
		apiarioService = new ApiarioServiceImpl();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String targetView = null;
		
		String action = request.getParameter(ParameterNames.ACTION);
		
		//busqueda de apiarios
		
		if(ActionNames.SEARCH.equalsIgnoreCase(action)) {
			
			String nombreStr = request.getParameter(ParameterNames.APIARIO_NAME);
			String ubicacionStr = request.getParameter(ParameterNames.UBICACION_APIARIO);
			
			ApiarioCriteria ac = new ApiarioCriteria();
			
			ac.setNombre(nombreStr);
			ac.setUbicacion(ubicacionStr);
			
			try {
				
				List<Apiario> apiarios = apiarioService.findBy(ac);
				request.setAttribute(AttributeNames.APIARIO, apiarios);
				request.getRequestDispatcher(ViewPaths.APIARIO_RESULTS).forward(request, response);
				
			}catch (Exception e) {
				logger.error(ubicacionStr, e);
			}
			
		//detalle apiarios
			 
			
		}else if(ActionNames.DETAIL.equalsIgnoreCase(action)) {
			
			String apiarioIdStr = request.getParameter(ParameterNames.COD_APIARIO);
			
			try {
				Apiario a = apiarioService.findById(Long.valueOf(apiarioIdStr));
				logger.trace("apiario id= "+apiarioIdStr+": "+a);
				
				targetView = ActionNames.DETAIL;
			}catch (Exception e) {
				logger.error(apiarioIdStr, e);
			}
			
		//creacion apiarios	
			
		}else if (ActionNames.CREATE.equalsIgnoreCase(action)) {
			
			String nombreStr = request.getParameter(ParameterNames.APIARIO_NAME);
			String ubicacionStr = request.getParameter(ParameterNames.UBICACION_APIARIO);
			String latitudStr = request.getParameter(ParameterNames.LATITUD_APIARIO);
			String longitudStr = request.getParameter(ParameterNames.LONGITUD_APIARIO);
			String usuarioIdStr = request.getParameter(ParameterNames.USER_ID);
			
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
