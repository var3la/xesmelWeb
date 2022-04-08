package com.jorge.xesmel.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.jorge.xesmel.model.Usuario;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.SessionManager;
import com.jorge.xesmel.web.controller.utils.ViewPaths;

/**
 * filtro de autentificacion
 */
//@WebFilter("/*")
//no es recomendable poner aqui los filtros porque no sabemos en que orden se ejecutan
public class AuthenticationFilter extends HttpFilter implements Filter {
	
	private static Logger logger = LogManager.getLogger(AuthenticationFilter.class);
       
    public AuthenticationFilter() {
        super();
        
    }

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		Usuario usuario = (Usuario) SessionManager.get(httpRequest, AttributeNames.USUARIO);
		if(usuario==null) {
			//si no esta autenticado
			
			
			
			if (logger.isWarnEnabled()) {
				logger.warn("Trying to GET..."+httpRequest.getRequestURI());
			}
			httpRequest.getRequestDispatcher(ViewPaths.USER_LOGIN).forward(httpRequest, httpResponse);
		}else {
		// pasa al siguiente filtro
		chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	
	public void destroy() {
		
	}


}
