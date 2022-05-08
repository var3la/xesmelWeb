package com.jorge.xesmel.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.google.gson.Gson;
import com.jorge.xesmel.configuration.ConfigurationManager;
import com.jorge.xesmel.dao.util.ConfigUtilsNames;
import com.jorge.xesmel.exception.DataException;
import com.jorge.xesmel.exception.ServiceException;
import com.jorge.xesmel.model.Colmena;
import com.jorge.xesmel.model.ColmenaCriteria;
import com.jorge.xesmel.model.Results;
import com.jorge.xesmel.service.ColmenaService;
import com.jorge.xesmel.service.impl.ColmenaServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.ConfigNames;
import com.jorge.xesmel.web.controller.utils.ErrorNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;


@WebServlet("/ColmenaWebService")
public class ColmenaWebServiceServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(ColmenaWebServiceServlet.class);
	
	private ColmenaService colmenaService = null;
	private static final String CFGM_PFX = ConfigNames.PFX_WEB;
	private static final String PAGE_SIZE_WEB = CFGM_PFX +  ConfigNames.PAGE_SIZE_WEB;
	private static final String START_INDEX = CFGM_PFX + ConfigNames.START_INDEX_WEB;
	private ConfigurationManager cfg = ConfigurationManager.getInstance();
	
	private Gson gson = null;
	
	
    public ColmenaWebServiceServlet() {
        super();        
        colmenaService = new ColmenaServiceImpl();
       
        gson = new Gson();
        
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String actionStr = request.getParameter(ParameterNames.ACTION);

    	WebServiceResponse wsResponse = new WebServiceResponse();
    	
    	//busqueda de colmenas por apiario
    	
    	if(ActionNames.SEARCH.equals(actionStr)) {
    		
    		ColmenaCriteria colmena = new ColmenaCriteria();
    		    		
    		try {
    			
    			Results<Colmena> results = colmenaService.findBy(colmena, Integer.valueOf(cfg.getParameter(ConfigUtilsNames.WEB_XESMEL_WEB_PROPERTIES, START_INDEX)) , Integer.valueOf(cfg.getParameter(ConfigUtilsNames.WEB_XESMEL_WEB_PROPERTIES, PAGE_SIZE_WEB)));	

    			wsResponse.setData(results.getData());
    			
    		}catch (DataException de) {
    			logger.error(de.toString());
    			wsResponse.setErrorCode(ErrorNames.DATA_ERROR);

    		}catch (ServiceException se) {
    			logger.error(se.toString());
    			wsResponse.setErrorCode(ErrorNames.SERVICE_ERROR);
    		}

    		String json=gson.toJson(wsResponse);
    		 

    		response.setContentType("aplication/json");
    		response.setCharacterEncoding("ISO-8859-1");

    		ServletOutputStream sos = response.getOutputStream();

    		sos.write(json.getBytes());
    		
    		sos.flush();			

    		response.getWriter().append("Served at: ").append(request.getContextPath());
    	}

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
