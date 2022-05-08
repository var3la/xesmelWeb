package com.jorge.xesmel.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.jorge.xesmel.configuration.ConfigurationManager;
import com.jorge.xesmel.dao.util.ConfigUtilsNames;
import com.jorge.xesmel.exception.DataException;
import com.jorge.xesmel.exception.InvalidUserOrPasswordException;
import com.jorge.xesmel.exception.MailException;
import com.jorge.xesmel.exception.UserAlreadyExistsException;
import com.jorge.xesmel.model.Usuario;
import com.jorge.xesmel.model.UsuarioCriteria;
import com.jorge.xesmel.service.MailService;
import com.jorge.xesmel.service.UsuarioService;
import com.jorge.xesmel.service.impl.MailServiceImpl;
import com.jorge.xesmel.service.impl.UsuarioServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.ConfigNames;
import com.jorge.xesmel.web.controller.utils.ControllerPaths;
import com.jorge.xesmel.web.controller.utils.CookieManager;
import com.jorge.xesmel.web.controller.utils.ErrorNames;
import com.jorge.xesmel.web.controller.utils.ParameterNames;
import com.jorge.xesmel.web.controller.utils.SessionManager;
import com.jorge.xesmel.web.controller.utils.ViewPaths;

/**
 * controlador para peticiones de usuario parte publica
 * 
 * @author jorge
 *
 */

public class UsuarioServlet extends HttpServlet {

	private static Logger logger = LogManager.getLogger(UsuarioServlet.class);

	private static final String CFGM_PFX = ConfigNames.PFX;
	private static final String MAIL = CFGM_PFX + ConfigNames.MAIL;
	private ConfigurationManager cfgM = ConfigurationManager.getInstance();

	private UsuarioService usuarioService = null;
	private MailService mailService = null;

	public UsuarioServlet() {
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

		// SEARCH(BUSQUEDA DE USUARIO POR EMAIL)

		if (ActionNames.SEARCH.equalsIgnoreCase(action)) {

			Usuario usuario = (Usuario) request.getSession().getAttribute(AttributeNames.USUARIO);

			String emailStr = request.getParameter(ParameterNames.EMAIL);

			UsuarioCriteria uc = new UsuarioCriteria();

			uc.setEmail(emailStr);

			try {

				Usuario user = usuarioService.findByEmail(emailStr);
				request.setAttribute(emailStr, user);

				targetView = ViewPaths.USER_PROFILE;
			} catch (Exception e) {
				logger.error(emailStr, e);
			}

			// DETALLE USUARIO

		} else if (ActionNames.DETAIL.equalsIgnoreCase(action)) {

			String usuarioIdStr = request.getParameter(ParameterNames.ID);

			try {
				Usuario user = usuarioService.findById(Long.valueOf(usuarioIdStr));
				logger.trace("usuario id= " + usuarioIdStr + ": " + user);

				targetView = ActionNames.DETAIL;
			} catch (Exception e) {
				logger.error(e);
			}

			// LOGIN

		} else if (ActionNames.LOGIN.equalsIgnoreCase(action)) {

			targetView = ViewPaths.USER_LOGIN;
			forward = true;

			String emailStr = request.getParameter(ParameterNames.EMAIL);
			String passwordStr = request.getParameter(ParameterNames.PASSWORD);
			String keepAuthenticated = request.getParameter(ParameterNames.KEEP_AUTHENTICATED);

			if (StringUtils.isBlank(emailStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("El email es obligatorio " + emailStr);
				}
				errors.addParameterError(ParameterNames.EMAIL, ErrorNames.REQUIRED);
			} else {
				emailStr = emailStr.trim();
				if (!Validator.validateEmail(emailStr)) {
					if (logger.isDebugEnabled()) {
						logger.debug("email incorrecto");
					}
					errors.addParameterError(ParameterNames.EMAIL, ErrorNames.MAIL_ERROR);
				}
			}
			if (StringUtils.isBlank(passwordStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("null password: ");
				}
				errors.addParameterError(ParameterNames.PASSWORD, ErrorNames.PASSWORD_ERROR);
			}
			try {
				Usuario usuario = usuarioService.login(emailStr, passwordStr);

				SessionManager.set(request, AttributeNames.USUARIO, usuario);

				if (keepAuthenticated != null) {
					CookieManager.setValue(response, AttributeNames.USUARIO, emailStr, 30 * 24 * 60 * 60);
				} else {
					CookieManager.setValue(response, AttributeNames.USUARIO, emailStr, 0);
				}

				targetView = ViewPaths.HOME;
				forward = false;

			} catch (InvalidUserOrPasswordException iupe) {
				logger.error("login: ", emailStr, iupe.getMessage());
				errors.addCommonError("Email o contraseña incorrectos.");
			} catch (DataException de) {
				logger.error("Login: " + emailStr, de.getMessage(), de);
				errors.addCommonError("Ha ocurrido un problema al consultar sus datos. Intentelo de nuevo mas tarde.");
			} catch (Exception e) {
				logger.error("Login: ", emailStr, e);
				errors.addCommonError("Ha ocurrido un problema al autenticarse. Intentelo de nuevo mas tarde.");
			}

			// LOGOUT

		} else if (ActionNames.LOGOUT.equalsIgnoreCase(action)) {

			SessionManager.set(request, AttributeNames.USUARIO, null);
			targetView = ViewPaths.USER_LOGIN;

			// SIGNUP (REGISTRO)

		} else if (ActionNames.SIGNUP.equalsIgnoreCase(action)) {

			targetView = ViewPaths.USER_SIGNUP;

			String userNameStr = request.getParameter(ParameterNames.USER_NAME);
			userNameStr = userNameStr.trim();
			if (!Validator.validateSeveralText(userNameStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto nombre: ");
				}
				errors.addParameterError(ParameterNames.USER_NAME, ErrorNames.NAME_ERROR);
			}

			String lastNameStr = request.getParameter(ParameterNames.LAST_NAME);
			lastNameStr = lastNameStr.trim();
			if (!Validator.validateSeveralText(lastNameStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto apellido:");
				}
				errors.addParameterError(ParameterNames.LAST_NAME, ErrorNames.LAST_NAME_ERROR);
			}

			String lastNameTwoStr = request.getParameter(ParameterNames.LAST_NAME_TWO);
			lastNameTwoStr = lastNameTwoStr.trim();
			if (!Validator.validateSeveralText(lastNameTwoStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto segundo apellido: ");
				}
				errors.addParameterError(ParameterNames.LAST_NAME_TWO, ErrorNames.LAST_NAME_ERROR);
			}

			String tradeNameStr = request.getParameter(ParameterNames.TRADENAME);
			tradeNameStr = tradeNameStr.trim();
			if (!Validator.validateSeveralText(tradeNameStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto nombre comercial: ");
				}
				errors.addParameterError(ParameterNames.TRADENAME, ErrorNames.TRADENAME_ERROR);
			}

			String dniStr = request.getParameter(ParameterNames.DNI);
			dniStr = dniStr.trim();
			if (!Validator.validateDNI(dniStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto dni:");
				}
				errors.addParameterError(ParameterNames.DNI, ErrorNames.DNI_ERROR);
			}

			String phoneStr = request.getParameter(ParameterNames.PHONE);
			phoneStr = phoneStr.trim();
			if (!Validator.validatePhone(phoneStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto password:");
				}
				errors.addParameterError(ParameterNames.PHONE, ErrorNames.PHONE_ERROR);
			}

			String emailStr = request.getParameter(ParameterNames.EMAIL);
			emailStr = emailStr.trim();
			if (!Validator.validateEmail(emailStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto email: ");
				}
				errors.addParameterError(ParameterNames.PASSWORD, ErrorNames.EMAIL_ERROR);
			}

			String passwordStr = request.getParameter(ParameterNames.PASSWORD);
			passwordStr = passwordStr.trim();
			if (!Validator.validatePassword(passwordStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto password:");
				}
				errors.addParameterError(ParameterNames.PASSWORD, ErrorNames.PASSWORDS_ERROR);
			}
			String regaStr = request.getParameter(ParameterNames.REGA);
			regaStr = regaStr.trim();
			if (!Validator.validateRega(regaStr)) {
				if (logger.isDebugEnabled()) {
					logger.debug("Dato incorrecto REGA: ");
				}
				errors.addParameterError(ParameterNames.REGA, ErrorNames.REGA_ERROR);
			}

			if (!errors.hasErrors()) {

				try {

					Usuario user = new Usuario();
					user.setNombre(userNameStr);
					user.setApellido(lastNameStr);
					user.setSegundoApellido(lastNameTwoStr);
					user.setNombreComercial(tradeNameStr);
					user.setDni(dniStr);
					user.setTelefono(phoneStr);
					user.setEmail(emailStr);
					user.setPassword(passwordStr);
					user.setRega(regaStr);

					usuarioService.signUp(user);

					targetView = ViewPaths.HOME;

				} catch (UserAlreadyExistsException uaee) {
					if (logger.isInfoEnabled()) {
						logger.info(emailStr, uaee);
					}
					errors.addCommonError(ErrorNames.ALREADY_EXISTS);
				} catch (MailException me) {
					logger.error(emailStr, me);
					errors.addCommonError(ErrorNames.MAIL_ERROR);

				} catch (Exception e) {
					logger.error(userNameStr, e);
					errors.addCommonError(ErrorNames.EXCEPTION_ERROR);

				}

			}

			// Actualizar perfil

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
			
			// formulario contacto indexHome
			
		} else if (ActionNames.CONTACT_US.equalsIgnoreCase(action)) {

			targetView = ControllerPaths.HOME;
			forward = false;

			String nombreStr = request.getParameter(ParameterNames.USER_NAME);
			String emailStr = request.getParameter(ParameterNames.EMAIL);
			String mensajeStr = request.getParameter(ParameterNames.MENSAJE);

			String to = cfgM.getParameter(ConfigUtilsNames.WEB_XESMEL_WEB_PROPERTIES, MAIL);

			String messageOkStr = nombreStr + " con email " + emailStr + " le ha enviado la siguiente sugerencia : "
					+ mensajeStr;

			try {
				mailService.sendEmail(emailStr, null, messageOkStr, to);
			} catch (MailException me) {
				if (logger.isErrorEnabled()) {
					logger.error(ErrorNames.MAIL_ERROR);
				}
			}

			targetView = ViewPaths.HOME_INDEX;
			forward = false;

		}

		logger.info(forward ? "Forwarding to " : "Redirecting to ", targetView);
		if (forward) {
			request.getRequestDispatcher(targetView).forward(request, response);

		} else {
			response.sendRedirect(request.getContextPath() + targetView);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
