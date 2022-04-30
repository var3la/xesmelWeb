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
	
	private static final String EMAIL_VALIDATION = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\\\.[A-Za-z0-9-]+)*(\\\\.[A-Za-z]{2,})$";
	private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_VALIDATION);
	
	private static final String DNI_VALIDATION = "[0-9]{8}+[a-zA-Z]{1}";
	private static final Pattern DNI_PATTERN = Pattern.compile(DNI_VALIDATION);
	
	private static final String PHONE_VALIDATION = "^(0034|\\\\+34)?(\\\\d\\\\d\\\\d)-? ?(\\\\d\\\\d)-? ?(\\\\d)-? ?(\\\\d)-? ?(\\\\d\\\\d)$";
	private static final Pattern PHONE_PATTERN = Pattern.compile(PHONE_VALIDATION);
		
	//ES - provincia(27,15,36,32)(dos digitos) - municipio(3 digitos) - (siete digitos unicos) 
	private static final String REGA_VALIDATION = "^ES+[27,15,36,32]+[0-9]{3}+[0-9]{7}$";
	private static final Pattern REGA_PATTERN = Pattern.compile(REGA_VALIDATION);
	
	
	public static final boolean validateDNI (String dni) {
		Matcher m = DNI_PATTERN.matcher(dni);
		return m.matches();
	}
	
	public static final boolean validatePhone(String phone) {
		Matcher m = PHONE_PATTERN.matcher(phone);
		return m.matches();
	}
	
	public static final boolean validateEmail (String email) {
		Matcher m = EMAIL_PATTERN.matcher(email);
		return m.matches();
	}
	
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
