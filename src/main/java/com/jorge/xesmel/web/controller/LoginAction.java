package com.jorge.xesmel.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jorge.xesmel.model.Usuario;
import com.jorge.xesmel.service.UsuarioService;
import com.jorge.xesmel.service.impl.UsuarioServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;
import com.jorge.xesmel.web.controller.utils.ViewPaths;

public class LoginAction extends Action{
	
	private UsuarioService usuarioService = null;
	
	public LoginAction() {
		super(ActionNames.LOGIN);
		usuarioService = new UsuarioServiceImpl();
	}
	
	public final String doIt(HttpServletRequest request, HttpServletResponse response) {

		String emailStr = request.getParameter(ParameterNames.EMAIL);
		String passWordStr = request.getParameter(ParameterNames.PASSWORD);


		try {
			Usuario usuario = usuarioService.login(emailStr, passWordStr);
			request.setAttribute(AttributeNames.USUARIO, usuario);
			
			return ViewPaths.USER_RESULTS;
			
		} catch (Exception e) {
			// TODO
			e.printStackTrace();
			return ViewPaths.USER_LOGIN;
		}		

	}
}
