package com.jorge.xesmel.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.jorge.xesmel.model.Cosecha;
import com.jorge.xesmel.service.ColmenaService;
import com.jorge.xesmel.service.CosechaService;
import com.jorge.xesmel.service.impl.ColmenaServiceImpl;
import com.jorge.xesmel.service.impl.CosechaServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;


public class CosechaServlet extends HttpServlet{
	
	private static Logger logger = LogManager.getLogger(CosechaServlet.class);
	
	private CosechaService cosechaService = null;
	
	public CosechaServlet() {
		super();
		cosechaService = new CosechaServiceImpl();
	}
	/*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String targetView = null;
		
		String action = request.getParameter(ParameterNames.ACTION);
	
		//busqueda cosechas
		
		if(ActionNames.SEARCH.equalsIgnoreCase(action)) {
			
			String colmenaStr = request.getParameter(ParameterNames.COLMENA_ID);
			
			Cosecha c = new Cosecha();
			
			c.setColmenaId(colmenaStr);
			
			try {
				
				ColmenaDAO colmenaDAO = ColmenaService
			}
		}
		
		
		*/
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request, response);
		}

}
