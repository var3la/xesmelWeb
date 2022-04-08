package com.jorge.xesmel.web.controller.utils;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.util.Strings;

public class ParameterUtils {
	
	public static final String getValue(HttpServletRequest request, String parameterName) {
		return URLDecoder.decode(request.getParameter(parameterName));
	}
	
	
	public static final String getURL(String uri, Map<String, String> parameters) {
		StringBuilder sb = new StringBuilder(uri);
		if (parameters.size()>0) {
			sb.append("?");
		}
		for (String pname: parameters.keySet()) {
			sb.append(URLEncoder.encode(pname)).append("=")
					.append(URLEncoder.encode(parameters.get(pname))).append("&");
		}
		return sb.toString();
	}
	
	public static final String print(String parameterValue) {
		if (StringUtils.isEmpty(parameterValue)) {
			return Strings.EMPTY;
		} else {
			return parameterValue.trim();
		}
	}
	
	public static final void main(String args[]) {
		Map<String, String> userDetailParams = new HashMap<String, String>();
		userDetailParams.put(ParameterNames.ACTION, ActionNames.DETAIL);
		userDetailParams.put(ParameterNames.ID, "");
		
		String url = getURL(ControllerPaths.USER, userDetailParams);
		System.out.println(url);
		
	}
}
