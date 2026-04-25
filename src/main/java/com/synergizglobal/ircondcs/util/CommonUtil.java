package com.synergizglobal.ircondcs.util;

public class CommonUtil {

	public static boolean emptyValidation(String value) {

		if (value != null && !"".equalsIgnoreCase(value.trim())) {
			return true;
		}

		return false;
	}

}
