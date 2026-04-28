package com.synergizglobal.kecdcs.authenticationinterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.synergizglobal.kecdcs.model.User;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	Logger logger = Logger.getLogger(AuthenticationInterceptor.class);

	/*
	 * @Autowired TemplatesService service;
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) {
		try {
			// Avoid a redirect loop for some urls
			if( !request.getRequestURI().equals("/kecdcs/") 
					&& !request.getRequestURI().equals("/kecdcs/login") 
					&& !request.getRequestURI().equals("/") 
					&& !request.getRequestURI().equals("/login")){
			    User userData = (User) request.getSession().getAttribute("USER");
			    if(userData == null){
			    	if(request.getRequestURI().contains("/kecdcs/")){
			    		response.sendRedirect("/kecdcs/");
			    	}else{
			    		response.sendRedirect("/login");
			    	}
				    return false;
			    }   
			}
		} catch (Exception e) {
			logger.error("preHandle() : " + e.getMessage());
		}
		
		return true;
	}
	
	
	@Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
		try {
			User user = (User)request.getSession().getAttribute("USER");
			//List<Template> accessList = service.getAccessList();
			//modelAndView.addObject("accessList", accessList);
		} catch (Exception e) {
			//logger.error("postHandle() : User Id - "+userId+" - User Name - "+userName+" - "+e.getMessage());
		}
		
        super.postHandle(request, response, handler, modelAndView);
    }
}
