package com.jorge.xesmel.web.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.jorge.xesmel.web.controller.utils.DateUtil;

public class Validator {
	//TODO todas las validaciones
	private static Logger logger = LogManager.getLogger(Validator.class);
	
	//ES - provincia(27,15,36,32)(dos digitos) - municipio(3 digitos) - (siete digitos unicos) 
	
	private static final String REGA = "ES+[27,15,36,32]+[0-9]{3}+[0-9]{7}";
	
	private static final Pattern REGA_PATTERN = Pattern.compile(REGA);
	
	public static final boolean validateRega (String rega) {
		Matcher m = REGA_PATTERN.matcher(rega);
		return m.matches();
	}
	
	public static Double parseDouble (String s) {
		Double v = null;
		if (s!=null) s=s.trim();
		try {
			v = Double.parseDouble(s);
		}catch (NumberFormatException nfe) {
			
		}
		return v;
	}
	
	public static Double validate(String s,double from,double to) {
		Double v = parseDouble(s);
		if((v==null)||(v<from)|| (v>to)) {
			v=null;
		}
		return null;
	}
	
	public static Date parseDate(String s) {
		Date v = null;
		try {
			DateUtil.INPUT_DATE_FORMAT.parse(s);
		}catch (ParseException pe){
			logger.error(pe);
		}
		return v;
		
	}
	
	
}
