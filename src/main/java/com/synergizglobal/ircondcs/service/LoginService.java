package com.synergizglobal.ircondcs.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.synergizglobal.ircondcs.dao.LoginDao;
import com.synergizglobal.ircondcs.model.User;

@Component
public class LoginService {
	Logger logger = Logger.getLogger(LoginService.class);
	@Autowired
	LoginDao dao;
	
	public User validateUser(User user) throws Exception {
		return dao.validateUser(user);
	}

	public String changePassword(User user) throws Exception {
		return dao.changePassword(user);
	}
}
