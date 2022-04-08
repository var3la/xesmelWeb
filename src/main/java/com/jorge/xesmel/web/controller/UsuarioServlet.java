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

import com.jorge.xesmel.exception.DataException;
import com.jorge.xesmel.exception.InvalidUserOrPasswordException;
import com.jorge.xesmel.exception.MailException;
import com.jorge.xesmel.exception.UserAlreadyExistsException;
import com.jorge.xesmel.model.Usuario;
import com.jorge.xesmel.model.UsuarioCriteria;
import com.jorge.xesmel.service.UsuarioService;
import com.jorge.xesmel.service.impl.UsuarioServiceImpl;
import com.jorge.xesmel.web.controller.utils.ActionNames;
import com.jorge.xesmel.web.controller.utils.AttributeNames;
import com.jorge.xesmel.web.controller.utils.CookieManager;
import com.jorge.xesmel.web.controller.utils.ParameterNames;
import com.jorge.xesmel.web.controller.utils.SessionManager;
import com.jorge.xesmel.web.controller.utils.ViewPaths;

/**
 * controlador para peticiones de usuario
 * 
 * @author jorge
 *
 */

public class UsuarioServlet extends HttpServlet {

	private static Logger logger = LogManager.getLogger(UsuarioServlet.class);

	private UsuarioService usuarioService = null;

	public UsuarioServlet() {
		super();
		usuarioService = new UsuarioServiceImpl();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

				targetView = ViewPaths.USER_RESULTS;
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

			String emailStr = request.getParameter(ParameterNames.EMAIL);
			String passwordStr = request.getParameter(ParameterNames.PASSWORD);
			String keepAuthenticated = request.getParameter(ParameterNames.KEEP_AUTHENTICATED);

			if (StringUtils.isBlank(emailStr)) {

				// tratarlo como error
				request.setAttribute("error", "El campo email es obligatorio.");
				targetView = ViewPaths.USER_LOGIN;
			}
			try {
				Usuario usuario = usuarioService.login(emailStr, passwordStr);				

				SessionManager.set(request, AttributeNames.USUARIO, usuario);
				
				if (keepAuthenticated!=null) {
					CookieManager.setValue(response,AttributeNames.USUARIO , emailStr, 30*24*60*60);
				} else {
					CookieManager.setValue(response,AttributeNames.USUARIO, emailStr, 0);
				}			

					targetView = ViewPaths.HOME;
					forward = false;
				
				}catch (InvalidUserOrPasswordException iupe) {
					logger.error("login: ",emailStr, iupe.getMessage());
					errors.addCommonError("Email o contraseña incorrectos");
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

			// vista en caso de error
			targetView = ViewPaths.USER_SIGNUP;

			String userNameStr = request.getParameter(ParameterNames.USER_NAME);

			if (StringUtils.isBlank(userNameStr)) {
				errors.addParameterError(ParameterNames.USER_NAME, "Campo obligatorio");
			}

			String lastNameStr = request.getParameter(ParameterNames.LAST_NAME);
			String lastNameTwoStr = request.getParameter(ParameterNames.LAST_NAME_TWO);
			String tradeNameStr = request.getParameter(ParameterNames.TRADENAME);
			String dniStr = request.getParameter(ParameterNames.DNI);
			String phoneStr = request.getParameter(ParameterNames.PHONE);
			String emailStr = request.getParameter(ParameterNames.EMAIL);
			String passwordStr = request.getParameter(ParameterNames.PASSWORD);
			String regaStr = request.getParameter(ParameterNames.REGA);

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

					targetView = ViewPaths.USER_LOGIN;

				} catch (UserAlreadyExistsException uaee) {
					if (logger.isInfoEnabled()) {
						logger.info(emailStr, uaee);
					}
					errors.addCommonError("El usuario ya existe");
				} catch (MailException me) {
					logger.error(emailStr, me);
					errors.addCommonError("No se ha podido enviar el email. Por favor, revise si es correcto o intentelo mas tarde.");

				} catch (Exception e) {
					logger.error(userNameStr, e);
					errors.addCommonError("Ha ocurrido un problema al guardar los datos. Por favor, intentelo de nuevo mas tarde.");
				}

			}
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
