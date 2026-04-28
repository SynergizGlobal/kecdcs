package com.synergizglobal.kecdcs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.synergizglobal.kecdcs.constants.PageConstants;
import com.synergizglobal.kecdcs.model.User;
import com.synergizglobal.kecdcs.service.UserService;

@Controller
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	UserService service;

	@Value("${common.error.message}")
	public String commonError;

	@Value("${record.delete.fail}")
	public String deleteFail;

	@Value("${record.delete.success}")
	public String deleteSuccess;

	@Value("${record.update.fail}")
	public String updateFail;

	@Value("${record.update.success}")
	public String updateSuccess;

	@Value("${record.get.fail}")
	public String getRecordError;

	@Value("${record.create.fail}")
	public String createFail;

	@Value("${record.create.success}")
	public String createSuccess;

	@RequestMapping(value = "/users", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView users(HttpSession session) {
		ModelAndView model = new ModelAndView();
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			model.setViewName(PageConstants.users);
		} catch (Exception e) {
			logger.error("users() : User Id - " + userId + " - User Name - " + userName + " - " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = "/getUsersList", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getUsersList(HttpSession session) {
		List<User> usersList = null;
		User user = new User();
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			User user2 = (User) session.getAttribute("USER");
			user.setCompanyId(user2.getCompanyId());
			usersList = service.getUsersList(user);
		} catch (Exception e) {
			logger.error(
					"getUsersList() : User Id - " + userId + " - User Name - " + userName + " - " + e.getMessage());
		}
		return usersList;
	}

}
