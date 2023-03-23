//package com;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.access.AccessDeniedHandler;
//import org.springframework.security.web.authentication.AuthenticationFailureHandler;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//
//import com.naver.security.CustomAccessDeniedHandler;
//import com.naver.security.CustomUserDetailsService;
//import com.naver.security.LoginFailHandler;
//import com.naver.security.LoginSuccessHandler;
//
//@EnableWebSecurity
//@Configuration
//public class SecurityConfig2  {
//	// <security:http> 설정 부분
//	@Bean
//	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//		http.authorizeRequests()
//				.antMatchers("/resources/**/**").permitAll()
//				.antMatchers("/member/main").permitAll()
//				.antMatchers("/member/login").permitAll()
//				.antMatchers("/member/sendMail").permitAll()
//				.antMatchers("/member/join").permitAll()
//				.antMatchers("/member/idcheck").permitAll()
//				.antMatchers("/member/joinProcess").permitAll()
//				.antMatchers("/member/list").access("hasRole('ROLE_ADMIN')")
//				.antMatchers("/member/info").access("hasRole('ROLE_ADMIN')")
//				.antMatchers("/**").access("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')");
//		
//			http.formLogin().loginPage("/member/login")
//			.loginProcessingUrl("/member/loginProcess")
//			.usernameParameter("id")
//			.passwordParameter("password")
//			.successHandler(loginSuccessHandler())
//			.failureHandler(loginFailHandler());
//			
//		/*
//		 * (1) logoutSuccessUrl : 로그아웃 후 이동할 주소 
//		 * (2) logoutUrl(여기서 처리하기 때문에 컨트롤러 logout 제거합니다. post방식을 요구합니다.) 
//		 * (3) invalidateHttpSession : 로그아웃 시 세션 속성들 제거 
//		 * (4) deleteCookies : 쿠키 제거
//		 */
//
//		http.logout().logoutSuccessUrl("/member/login").logoutUrl("/member/logout").invalidateHttpSession(true)
//				.deleteCookies("remember-me", "JSESSION_ID");
//
//		http.rememberMe().rememberMeParameter("remember-me").rememberMeCookieName("remember-me")
//				.tokenValiditySeconds(2419200);
//
//		http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
//		
//		return http.build();
//	}
//
//	
//	AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
//			throws Exception {
//		return authenticationConfiguration.getAuthenticationManager();
//	}
//
//	// 로그인 성공 시 실행할 객체 생성
//	@Bean
//	public AuthenticationSuccessHandler loginSuccessHandler() {
//		return new LoginSuccessHandler(); // 패키지 com.naver.security에 존재하는 모든 클래스 파일에 @Service 없애주세요
//	}
//
//	/*
//	 * 1. UserDetailsService 인터페이스는 DB에서 유저 정보를 불러오는 loadUserByUsername()가 존재합니다.
//	 * 
//	 */
//	@Bean
//	public UserDetailsService customUserService() {
//		return new CustomUserDetailsService(); // 패키지 com.naver.security에 존재하는 모든 클래스 파일에 @Service 없애주세요.
//	}
//
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//
//	@Bean
//	public AccessDeniedHandler accessDeniedHandler() {
//		return new CustomAccessDeniedHandler();
//	}
//
//	@Bean
//	public AuthenticationFailureHandler loginFailHandler() {
//		return new LoginFailHandler();
//	}
//}
