package com.synergizglobal.ircondcs.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.synergizglobal.ircondcs.dao.UserDao;
import com.synergizglobal.ircondcs.model.User;

@Component
public class UserService {
	Logger logger = Logger.getLogger(UserService.class);
	@Autowired
	UserDao dao;
	public List<User> getUsersList(User user) throws Exception {
		return dao.getUsersList(user);
	}
	public boolean deleteUser(String userId) throws Exception {
		return dao.deleteUser(userId);
	}
	public User getUser(String userId) throws Exception {
		return dao.getUser(userId);
	}
	
	public List<User> getUsersListForUploadTemplate(String clientId) throws Exception {
		return dao.getUsersListForUploadTemplate(clientId);
	}
	public User getRole(String roleId) throws Exception {
		return dao.getRole(roleId);
	}
	public boolean deleteRole(String roleId) throws Exception {
		return dao.deleteRole(roleId);
	}
	
	public boolean addRole(User role) throws Exception {
		return dao.addRole(role);
	}
	public boolean updateRole(User role) throws Exception {
		return dao.updateRole(role);
	}
}
