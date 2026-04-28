package com.synergizglobal.kecdcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.synergizglobal.kecdcs.constants.PageConstants;
import com.synergizglobal.kecdcs.model.User;
import com.synergizglobal.kecdcs.service.DocumentUploadService;
import com.synergizglobal.kecdcs.service.LoginService;

@Controller
public class LoginController {
	Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	LoginService service;

	@Autowired
	DocumentUploadService docUploadService;

	@Value("${Login.Form.Invalid}")
	public String invalidUserName;
	
	@Value("${common.error.message}")
	public String commonError;
	
	@Value("${message.password.expired}")
	public String passwordExpired;
	
	@Value("${message.password.reset.fail}")
	public String passwordResetFail;
	
	@Value("${message.password.reset.success}")
	public String passwordResetSuccess;
	
	@Value("${message.wrong.password.entered}")
	public String wrongPasswordEntered;

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView model = null;
		try {
			model = new ModelAndView(PageConstants.login);
		} catch (Exception e) {
			logger.error("login() : " + e.getMessage());
		}
		return model;
	}

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.POST)
	public ModelAndView validateUser(@ModelAttribute User user, RedirectAttributes redir, HttpServletRequest request,
			HttpSession session) {
		ModelAndView model = new ModelAndView();
		String domain = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();

		try {

			if (!StringUtils.isEmpty(user.getUserId()) && !StringUtils.isEmpty(user.getPassword())) {
				User userDetails = service.validateUser(user);

				if (!StringUtils.isEmpty(userDetails)) {
					/* model.setViewName("redirect:/documents?levelId=1&folderId='0'"); */
					model.setViewName("redirect:/corresDocumentSearch");
					redir.addFlashAttribute("user", userDetails);
					request.getSession().setAttribute("USER", userDetails);
					request.getSession().setAttribute("USER_ID", userDetails.getUserId());
					request.getSession().setAttribute("LOGIN_ID", userDetails.getLogin_id());
					request.getSession().setAttribute("USER_NAME", userDetails.getUserName());
					request.getSession().setAttribute("LEVEL_MENU", docUploadService.getLevelMenu());
					request.getSession().setAttribute("USER_ACCESS",
							docUploadService.getUserAccessDetails(userDetails.getUserId()));
				} else {
					// model.setViewName("redirect:"+domain+"/sgadmin/login?userId="+user.getUserId()+"&password="+user.getPassword()+"&portalFrom=ircon");
					model.setViewName("redirect:/");
					redir.addFlashAttribute("fail", invalidUserName);
				}
			} else {
				// model.setViewName("redirect:"+domain+"/ircon/login");
				model.setViewName("redirect:/");
				redir.addFlashAttribute("fail", invalidUserName);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("validateUser() : " + e.getMessage());
			model.setViewName("redirect:/");
			redir.addFlashAttribute("fail", invalidUserName);
		}
		return model;
	}

	@Value("${Logout.Message}")
	private String logOutMessage;

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logut(HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		ModelAndView model = new ModelAndView();
		try {
			session.invalidate();
			redir.addFlashAttribute("logout", logOutMessage);
			model.setViewName("redirect:/");
		} catch (Exception e) {
			logger.fatal("logut() : " + e.getMessage());
		}
		return model;
	}
	
	/*******************************************************************/
	@RequestMapping(value = "/reset-password", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView resetPassword(){
		ModelAndView model = new ModelAndView();
		try{
			model.setViewName(PageConstants.resetPassword);
		}catch(Exception e){
			logger.error("resetPassword : " + e.getMessage());
			model.setViewName(PageConstants.resetPassword);
			model.addObject("message", commonError);
		}
		return model;
	}
	
	/**
	 * This method changePassowrd() is used for changing the login password, this method have three parameter.
	 * @param user is the User class type variable that will get and set the value in User model.
	 * @param session it will create/destroy the session for the user.
	 * @param attributes will show the flash message on the current request. 
	 * @return type of this method is model.
	 */
	@RequestMapping(value = "/change-password", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView changePassword(@ModelAttribute User user, HttpSession session,RedirectAttributes attributes){
		ModelAndView model = new ModelAndView();
		try{
			String login_id = (String) session.getAttribute("LOGIN_ID");
			user.setLogin_id(login_id);
			String temp = service.changePassword(user);
			if(temp.equals("true")) {
				session.invalidate();
				model.setViewName("redirect:/");
				attributes.addFlashAttribute("success", passwordResetSuccess);
			}else if(temp.equals("false")) {
				model.setViewName(PageConstants.resetPassword);
				model.addObject("error", wrongPasswordEntered);
			}else{
				model.setViewName(PageConstants.resetPassword);
				model.addObject("error", passwordResetFail);
			}
		}catch(Exception e){
			logger.error("changePassword : " + e.getMessage());
			model.setViewName(PageConstants.resetPassword);
			model.addObject("error", commonError);
		}
		return model;
	}
	/************************************************************************************/

}
