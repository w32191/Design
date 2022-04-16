package com.eeit40.design.utils;

public class ValidFormat {

	public static boolean isEmail(String text) {
		
		return text.matches("^[_a-zA-Z0-9-]+([.][_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+([.][a-zA-Z0-9-]+)*$");
	}
	
	public static boolean isPassword(String text) {
		
		return text.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[\\w]{6,16}$");
	}
	
	public static boolean isIdNumber(String text) {
		
		return text.matches("^[A-Z]{1}[0-9]{9}$");
	}
	
	public static boolean isPhone(String text) {
		
		return text.matches("^09[0-9]{8}$");
	}
	
}
