package com.camel.community.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.mysql.cj.util.StringUtils;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class CamelLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private RequestCache requestCache = new HttpSessionRequestCache(); 
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	private String targetUrlParameter;
	
	private String defaultUrl;
	
	private boolean useReferer;
	
	public CamelLoginSuccessHandler() {
		this.targetUrlParameter = "";
		this.defaultUrl = "/";
		this.useReferer = false;
	}
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> role = new ArrayList<>();
		
		authentication.getAuthorities().forEach(auth -> {
			role.add(auth.getAuthority());
		});
		
		if(role.contains("ROLE_MEMBER")) {

			finalUrlFn(req, res);
		}
	}
	
	private void finalUrlFn(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		clearAuthenticationAttributes(req);
		
		int intRedirectStrategy = decideRedirectStrategy(req, res);
		switch (intRedirectStrategy) {
		case 1:
				useTargetUrl(req, res);
				break;
		case 2:
				useSessionUrl(req, res);
				break;
		case 3:
				useRefererUrl(req, res);
				break;
		default:
				useDefaultUrl(req, res);
		}
	}
	
	
	/**
	 *  로그인 하는 과정에서 로그인에 실패할 경우 세션에 에러메시지를
	 *  지워준다.
	 * @param req
	 */
	private void clearAuthenticationAttributes(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			return;
		}
		
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	private void useTargetUrl(HttpServletRequest req , HttpServletResponse res) throws IOException {
			
		SavedRequest savedRequest = requestCache.getRequest(req, res);
		
		if(savedRequest != null) {
			requestCache.removeRequest(req, res);
		}
		
		String targetUrl = req.getParameter(targetUrlParameter);
		
		redirectStrategy.sendRedirect(req, res , targetUrl);
			
	}
	
	/**
	 * 시큐리티에서 요구한 로그인폼에 로그인시 내가 가려는 url을 가져와 리다이렉트시킨다.
	 * @param req
	 * @param res
	 * @throws IOException
	 */
	private void useSessionUrl(HttpServletRequest req , HttpServletResponse res) throws IOException {
		
		SavedRequest savedRequest = requestCache.getRequest(req, res);
		
		String targetUrl = savedRequest.getRedirectUrl();
		
		redirectStrategy.sendRedirect(req, res , targetUrl);
		
	}
	
	private void useRefererUrl(HttpServletRequest req , HttpServletResponse res) throws IOException {
		String targetUrl = req.getHeader("REFERER");
		redirectStrategy.sendRedirect(req, res , targetUrl);
	}
	
	private void useDefaultUrl(HttpServletRequest req , HttpServletResponse res) throws IOException {
		
		redirectStrategy.sendRedirect(req, res, defaultUrl);
	}
	
	/**
	 *  인증 성공후 어떤 URL로 redirect 할지 결정
	 *  판단 기준은 targetUrlParameter 값을 읽은 URL이 존재할 경우가 1순위
	 *  1순위 URL이 없을 경우 Spring Security가 세션에 저장한 URL을 2순위
	 *  2순위 URL이 없을 경우 Request의 REFERER를 사용하고 그 REFERER URL이 존재할 경우 그 URL을
	 *  3순위 URL이 없을 경우 Default URL을 4순위로 한다.
	 * @param req
	 * @param res
	 * @return 1 : targetUrlParameter 값을 읽은 URL
	 * 		   2 : Session에 저장되어 있는 URL
	 * 	       3 : referer 헤더에 있는 url
	 * 	       0 : default url
	 */
	
	private int decideRedirectStrategy(HttpServletRequest req, HttpServletResponse res) {
		int result = 0;
		
		SavedRequest savedRequest = requestCache.getRequest(req, res);
		
		if(!"".equals(targetUrlParameter)) {
			String targetUrl = req.getParameter(targetUrlParameter);
			
			if(!StringUtils.isNullOrEmpty(targetUrl)) {
				result = 1;
			} else {
				if(savedRequest != null) {
					result = 2;
				}else {
					String refererUrl = req.getHeader("REFERER");
					if(useReferer && !StringUtils.isNullOrEmpty(refererUrl)) {
						result = 3;
					} else {
						result = 0;
					}
				}
			}
			
			return result;
		}
		
		if(savedRequest != null) {
			result = 2;
			return result;
		}
		
		String refererUrl = req.getHeader("REFERER");
		if(useReferer && !StringUtils.isNullOrEmpty(refererUrl)) {
				result = 3;
		}else {
				result = 0;
		}
		
		return result;
	}
	

}
