package com.jorge.xesmel.web.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.jorge.xesmel.exception.DataException;
import com.jorge.xesmel.exception.ServiceException;
import com.jorge.xesmel.model.Apiario;
import com.jorge.xesmel.model.ApiarioCriteria;
import com.jorge.xesmel.service.ApiarioService;
import com.jorge.xesmel.service.UsuarioService;
import com.jorge.xesmel.service.impl.ApiarioServiceImpl;
import com.jorge.xesmel.service.impl.UsuarioServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.ErrorNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;

@WebServlet("/apiarioWebService")
public class ApiarioWebServiceServlet extends HttpServlet { 
	
	private static Logger logger = LogManager.getLogger(ApiarioWebServiceServlet.class);
	
	private ApiarioService apiarioService = null;
	private UsuarioService usuarioService = null;
	
	
	private Gson gson = null;
	
	public ApiarioWebServiceServlet() {
		super();
		apiarioService = new ApiarioServiceImpl();
		usuarioService = new UsuarioServiceImpl();
		gson = new Gson();
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String actionStr = request.getParameter(ParameterNames.ACTION);
		
		WebServiceResponse wsResponse = new WebServiceResponse();
		
		if(ActionNames.SEARCH.equals(actionStr)) {
			
			String usuarioStr = request.getParameter(ParameterNames.USER_ID);
			
			Long usuario = Long.valueOf(usuarioStr);
			
			ApiarioCriteria apiario = new ApiarioCriteria();
			
			apiario.setUsuarioId(usuario);
			
			try {
				List<Apiario> apiarios = (List<Apiario>) apiarioService.findByUsuarioId(usuario);
				
				String json = gson.toJson(apiarios);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("ISO-8859-1");
				ServletOutputStream sos = response.getOutputStream();


				sos.write(json.getBytes());

				sos.flush();

			}catch (DataException de) {
				logger.error(de.toString());
				wsResponse.setErrorCode(ErrorNames.DATA_ERROR);
			}catch (ServiceException se) {
				logger.error(se.toString());
				wsResponse.setErrorCode(ErrorNames.SERVICE_ERROR);
			}
			
    		
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}