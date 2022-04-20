package com.eeit40.design.Util;

public class ValidFormat {

	public static boolean isIdNumber(String text) {
		
		return text.matches("^[A-Z]{1}[0-9]{9}$");
	}
	
	public static boolean isPhone(String text) {
		
		return text.matches("^09[0-9]{8}$");
	}
	
}
