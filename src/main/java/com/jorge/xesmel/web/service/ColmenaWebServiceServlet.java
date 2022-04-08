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
import com.jorge.xesmel.exception.ErrorCodes;
import com.jorge.xesmel.exception.ServiceException;
import com.jorge.xesmel.model.Colmena;
import com.jorge.xesmel.model.ColmenaCriteria;
import com.jorge.xesmel.service.ColmenaService;
import com.jorge.xesmel.service.impl.ColmenaServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.ErrorNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;


@WebServlet("/ColmenaWebService")
public class ColmenaWebServiceServlet extends HttpServlet {
	
	private static Logger logger = LogManager.getLogger(ColmenaWebServiceServlet.class);
	
	private ColmenaService colmenaService = null;
	
	private Gson gson = null;
	
	
    public ColmenaWebServiceServlet() {
        super();        
        colmenaService = new ColmenaServiceImpl();
        
        gson = new Gson();
        
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String actionStr = request.getParameter(ParameterNames.ACTION);

    	WebServiceResponse wsResponse = new WebServiceResponse();

    	if(ActionNames.SEARCH.equals(actionStr)) {
    		//id de apiario
    		String apiarioIdStr = request.getParameter(ParameterNames.APIARIO_ID);

    		//validacion
    		Long apiarioId = Long.valueOf(apiarioIdStr);

    		try {
    			ColmenaCriteria colmenaCriteria = new ColmenaCriteria();


    			List<Colmena> colmenas = colmenaService.findBy(colmenaCriteria);	

    			wsResponse.setData(colmenas);
    		}catch (DataException de) {
    			logger.error(de.toString());
    			wsResponse.setErrorCode(ErrorNames.DATA_ERROR);

    		}catch (ServiceException se) {
    			logger.error(se.toString());
    			wsResponse.setErrorCode(ErrorNames.SERVICE_ERROR);
    		}

    		String json=gson.toJson(wsResponse);
    		//mimetype. aqui definimos lo que sale por html. convertimos al formato de salida 

    		response.setContentType("aplication/json");
    		response.setCharacterEncoding("ISO-8859-1");

    		ServletOutputStream sos = response.getOutputStream();

    		sos.write(json.getBytes());
    		//saca por consola los datos en json
    		sos.flush();			

    		response.getWriter().append("Served at: ").append(request.getContextPath());
    	}

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
