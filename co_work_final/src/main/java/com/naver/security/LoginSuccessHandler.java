package com.naver.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.naver.cowork.domain.Member;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info("로그인 성공 : LoginSuccessHandler");

		String user_id = authentication.getName();
		String userAgent = request.getHeader("User-Agent");
		String ip = request.getHeader("X-Forwarded-For");
		String os = null;
		String browser = null;

		if (userAgent.indexOf("Trident") > -1) { // IE
			browser = "ie";
		} else if (userAgent.indexOf("Edge") > -1) { // Edge
			browser = "edge";
		} else if (userAgent.indexOf("Whale") > -1) { // Naver Whale
			browser = "whale";
		} else if (userAgent.indexOf("Opera") > -1 || userAgent.indexOf("OPR") > -1) { // Opera
			browser = "opera";
		} else if (userAgent.indexOf("Firefox") > -1) { // Firefox
			browser = "firefox";
		} else if (userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1) { // Safari
			browser = "safari";
		} else if (userAgent.indexOf("Chrome") > -1) { // Chrome
			browser = "chrome";
		}

		System.out.println("browser = " + userAgent);
		System.out.println("browser = " + browser);

		logger.info(">>>> X-FORWARDED-FOR : " + ip);

		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
			logger.info(">>>> Proxy-Client-IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
			logger.info(">>>> WL-Proxy-Client-IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
			logger.info(">>>> HTTP_CLIENT_IP : " + ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			logger.info(">>>> HTTP_X_FORWARDED_FOR : " + ip);
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		logger.info(">>>> Result : IP Address : " + ip);
		
		var agent = userAgent.toLowerCase();
				
	    if (agent.indexOf("windows nt 10.0") > -1) {
	        os = "Windows10";
	    }else if (agent.indexOf("windows nt 6.1") > -1) {
	        os = "Windows7";
	    }else if (agent.indexOf("windows nt 6.2") > -1 || userAgent.indexOf("windows nt 6.3") > -1 ) {
	        os = "Windows8";
	    }else if (agent.indexOf("windows nt 6.0") > -1) {
	        os = "WindowsVista";
	    }else if (agent.indexOf("windows nt 5.1") > -1) {
	        os = "WindowsXP";
	    }else if (agent.indexOf("windows nt 5.0") > -1) {
	        os = "Windows2000";
	    }else if (agent.indexOf("windows nt 4.0") > -1) {
	        os = "WindowsNT";
	    }else if (agent.indexOf("windows 98") > -1) {
	        os = "Windows98";
	    }else if (agent.indexOf("windows 95") > -1) {
	        os = "Windows95";
	    }else if (agent.indexOf("iphone") > -1) {
	        os = "iPhone";
	    }else if (agent.indexOf("ipad") > -1) {
	        os = "iPad";
	    }else if (agent.indexOf("android") > -1) {
	        os = "android";
	    }else if (agent.indexOf("mac") > -1) {
	        os = "mac";
	    }else if (agent.indexOf("linux") > -1) {
	        os = "Linux";
	    }else if (agent.indexOf("windows nt 11.0") > -1) {
	    	os = "Windows11";
	    }else{
	        os = "Other";
	    }      
	    
	    logger.info("접속 os = " + os);
	    
	    logger.info(userAgent);

		String url = request.getContextPath() + "/main/main?user_id="+user_id;
		logger.info(url);
		response.sendRedirect(url);
	}
}
