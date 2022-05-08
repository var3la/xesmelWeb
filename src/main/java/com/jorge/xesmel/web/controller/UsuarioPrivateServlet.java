package com.jorge.xesmel.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.jorge.xesmel.configuration.ConfigurationManager;
import com.jorge.xesmel.exception.MailException;
import com.jorge.xesmel.exception.UserAlreadyExistsException;
import com.jorge.xesmel.model.Usuario;
import com.jorge.xesmel.service.MailService;
import com.jorge.xesmel.service.UsuarioService;
import com.jorge.xesmel.service.impl.MailServiceImpl;
import com.jorge.xesmel.service.impl.UsuarioServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.ConfigNames;
import com.jorge.xesmel.web.controller.utils.ErrorNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;
import com.jorge.xesmel.web.controller.utils.SessionManager;
import com.jorge.xesmel.web.controller.utils.ViewPaths;

/**
 * controlador para peticiones de usiario parte privada
 * 
 * @author jorge
 *
 */

public class UsuarioPrivateServlet extends HttpServlet {

	private static Logger logger = LogManager.getLogger(UsuarioPrivateServlet.class);

	private static final String CFGM_PFX = ConfigNames.PFX;
	private static final String MAIL = CFGM_PFX + ConfigNames.MAIL;
	private ConfigurationManager cfgM = ConfigurationManager.getInstance();

	private UsuarioService usuarioService = null;
	private MailService mailService = null;

	public UsuarioPrivateServlet() {
		super();
		usuarioService = new UsuarioServiceImpl();
		mailService = new MailServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cookie[] cookies = request.getCookies();

		String targetView = null;
		boolean forward = true;

		Errors errors = new Errors();
		request.setAttribute(AttributeNames.ERRORS, errors);

		String action = request.getParameter(ParameterNames.ACTION);

		// Detalle Usuario

		if (ActionNames.DETAIL.equalsIgnoreCase(action)) {

			String usuarioIdStr = request.getParameter(ParameterNames.ID);

			try {
				Usuario user = usuarioService.findById(Long.valueOf(usuarioIdStr));
				logger.trace("usuario id= " + usuarioIdStr + ": " + user);

				targetView = ActionNames.DETAIL;
			} catch (Exception e) {
				logger.error(e);
			}

			logger.info(forward ? "Forwarding to " : "Redirecting to ", targetView);
			if (forward) {
				request.getRequestDispatcher(targetView).forward(request, response);

			} else {
				response.sendRedirect(request.getContextPath() + targetView);
			}
			
		//LogOut cierre de sesion usuario

		} else if (ActionNames.LOGOUT.equalsIgnoreCase(action)) {

			SessionManager.set(request, AttributeNames.USUARIO, null);
			targetView = ViewPaths.USER_LOGIN;
			
		//Actualizar perfil	

		} else if (ActionNames.UPDATE.equalsIgnoreCase(action)) {

			targetView = ViewPaths.USER_PROFILE;
			forward = false;

			String userNameStr = request.getParameter(ParameterNames.USER_NAME);
			if (StringUtils.isBlank(userNameStr)) {
				errors.addParameterError(ParameterNames.USER_NAME, ErrorNames.REQUIRED);
			}

			String lastNameStr = request.getParameter(ParameterNames.LAST_NAME);
			if (StringUtils.isBlank(lastNameStr)) {
				errors.addParameterError(ParameterNames.LAST_NAME, ErrorNames.REQUIRED);
			}

			String lastNameTwoStr = request.getParameter(ParameterNames.LAST_NAME_TWO);
			if (StringUtils.isBlank(lastNameTwoStr)) {
				errors.addParameterError(ParameterNames.LAST_NAME_TWO, ErrorNames.REQUIRED);
			}

			String tradeNameStr = request.getParameter(ParameterNames.TRADENAME);
			if (StringUtils.isBlank(tradeNameStr)) {
				errors.addParameterError(ParameterNames.TRADENAME, ErrorNames.REQUIRED);
			}

			String dniStr = request.getParameter(ParameterNames.DNI);
			if (StringUtils.isBlank(dniStr)) {
				errors.addParameterError(ParameterNames.DNI, ErrorNames.REQUIRED);
			}

			String phoneStr = request.getParameter(ParameterNames.PHONE);
			if (StringUtils.isBlank(phoneStr)) {
				errors.addParameterError(ParameterNames.PHONE, ErrorNames.REQUIRED);
			}

			String regaStr = request.getParameter(ParameterNames.REGA);
			if (StringUtils.isBlank(regaStr)) {
				errors.addParameterError(ParameterNames.REGA, ErrorNames.REQUIRED);
			}

			Usuario usuario = (Usuario) SessionManager.get(request, AttributeNames.USUARIO);

			if (!errors.hasErrors()) {
				try {

					Usuario user = new Usuario();
					user = usuario;
					user.setNombre(userNameStr);
					user.setApellido(lastNameStr);
					user.setSegundoApellido(lastNameTwoStr);
					user.setNombreComercial(tradeNameStr);
					user.setDni(dniStr);
					user.setTelefono(phoneStr);
					user.setPassword(usuario.getPassword());
					user.setRega(regaStr);

					usuarioService.update(user);

					SessionManager.set(request, AttributeNames.USUARIO, user);

					targetView = ViewPaths.USER_PROFILE;

				} catch (UserAlreadyExistsException uaee) {
					if (logger.isInfoEnabled()) {
						logger.info(userNameStr, uaee);
					}
					errors.addCommonError(ErrorNames.ALREADY_EXISTS);
				} catch (MailException me) {
					logger.error(userNameStr, me);
					errors.addCommonError(ErrorNames.MAIL_ERROR);

				} catch (Exception e) {
					logger.error(userNameStr, e);
					errors.addCommonError(ErrorNames.EXCEPTION_ERROR);

				}

			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
