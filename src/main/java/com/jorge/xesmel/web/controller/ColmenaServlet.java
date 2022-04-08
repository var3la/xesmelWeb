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

import com.jorge.xesmel.model.Colmena;
import com.jorge.xesmel.model.ColmenaCriteria;
import com.jorge.xesmel.service.ColmenaService;
import com.jorge.xesmel.service.impl.ColmenaServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;
import com.jorge.xesmel.web.controller.utils.ViewPaths;

/**
 * controlador (Servlet) para peticiones de colmena.
 */

public class ColmenaServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(ColmenaServlet.class);

	private ColmenaService colmenaService = null;


	public ColmenaServlet() {
		super();
		colmenaService = new ColmenaServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String targetView = null;
		boolean forward = true;
		
		Errors errors = new Errors();
		request.setAttribute(AttributeNames.ERRORS, errors);
		
		String action = request.getParameter(ParameterNames.ACTION);
		
		//busqueda de colmenas
		
		if(ActionNames.SEARCH.equalsIgnoreCase(ParameterNames.ACTION)) {
			
			Colmena colmena = (Colmena) request.getSession().getAttribute(AttributeNames.COLMENA);
			
			String codigoEnApiarioStr = request.getParameter(ParameterNames.COD_APIARIO);
			String fechaDesdeStr = request.getParameter(ParameterNames.FECHA_DESDE);
			String tipoOrigenStr = request.getParameter(ParameterNames.TIPO_ORIGEN);
			
			Long codigoEnApiario = Long.valueOf(tipoOrigenStr);
			Long tipoOrigen = Long.valueOf(tipoOrigenStr);
			
			ColmenaCriteria cc = new ColmenaCriteria();
			
			cc.setCodEnApiario(codigoEnApiario);
			if(tipoOrigen!=0) {
				cc.setTipoOrigenId(tipoOrigen);
			}
			
			try {
				
				List<Colmena> colmenas = colmenaService.findBy(cc);
				request.setAttribute(AttributeNames.COLMENAS, colmenas);				
				targetView= ActionNames.DETAIL;
				
			} catch (Exception e) {
			logger.error("Search colmena: "+ e.getMessage());
			}
			//detalle colmena
			
		}else if(ActionNames.DETAIL.equalsIgnoreCase(action)) {
			try {
				String colmenaIdStr = request.getParameter(ParameterNames.COLMENA_ID);
				Colmena c = colmenaService.findById(Long.valueOf(colmenaIdStr));
				request.setAttribute(AttributeNames.COLMENA, c);
				targetView= ViewPaths.COLMENA_DETAIL;
				
			}catch (Exception e){
				logger.error("Search detail colmena: ",e.getMessage(), e);;
			}
		}
		logger.trace("redirigiendo a: "+targetView);
		request.getRequestDispatcher(targetView).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
