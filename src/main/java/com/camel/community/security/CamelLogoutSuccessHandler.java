package com.camel.community.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class CamelLogoutSuccessHandler implements LogoutSuccessHandler{
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

	if (authentication != null && authentication.getDetails() != null) {
         try {
              request.getSession().invalidate();
         } catch (Exception e) {
             e.printStackTrace();
         }
     } 
	 
     response.setStatus(HttpServletResponse.SC_OK);
     useRefererUrl(request, response);
	}
	
	
	private void useRefererUrl(HttpServletRequest req , HttpServletResponse res) throws IOException {
		String targetUrl = req.getHeader("REFERER");
		redirectStrategy.sendRedirect(req, res , targetUrl);
	}

	
	

}
