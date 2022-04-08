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

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.jorge.xesmel.exception.DataException;
import com.jorge.xesmel.exception.ServiceException;
import com.jorge.xesmel.model.Usuario;
import com.jorge.xesmel.service.UsuarioService;
import com.jorge.xesmel.service.impl.UsuarioServiceImpl;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.CookieManager;
import com.jorge.xesmel.web.controller.utils.SessionManager;


public class KeepAuthenticatedFilter extends HttpFilter implements Filter {
	
	private static Logger logger = LogManager.getLogger(KeepAuthenticatedFilter.class);
	private UsuarioService usuarioService = null;
   
    public KeepAuthenticatedFilter() {
        super();
        usuarioService = new UsuarioServiceImpl();
    }


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		// No autenticado			
		String email = CookieManager.getValue(httpRequest, AttributeNames.USUARIO);
		if(email!=null) {
			try {
				Usuario usuario = usuarioService.findByEmail(email);
				SessionManager.set(httpRequest, AttributeNames.USUARIO, usuario);
				if (logger.isInfoEnabled()) {
					logger.info("User "+email+" authenticated form cookie");
				}
				
			} catch (DataException de) {
				logger.error("Trying to login by cookie: "+email, de);
			
			} catch (ServiceException se) {
				logger.error("Trying to login by cookie: "+email, se);
			}
		}					
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {
	}

}