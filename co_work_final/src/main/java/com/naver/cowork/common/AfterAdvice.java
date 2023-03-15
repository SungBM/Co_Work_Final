package com.naver.cowork.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*	호출되는 비즈니스 메서드의 정보를 JoinPoint 인터페이스로 알 수 있습니다.

 * JoinPoint 인터페이스의 메서드
  1. Signature getSignature() : 호출되는 메서드에 대한 정보를 구합니다.
  2. Object getTarget() : 호출한 비즈니스 메서드를 포함하는 비즈니스 객체를 구합니다.
  3. getClass().getName() : 클래스 이름을 구합니다.
  4. proceeding.getSignature().getName() : 호출되는 메서드 이름을 구합니다.
 */

// 공통으로 처리할 로직을 BeforeAdvice 클래스에 beforeLog() 메서드로 구현합니다.
// Advice : 횡단 관심에 해당하는 공통 기능을 의미하며 독립된 클래스의 메서드로 작성됩니다.
// Advice 클래스는 스프링 설정 파일에서 <bean>으로 등록하거나 @Service annotation을 사용합니다.

//@Service
//@Aspect
public class AfterAdvice {
	private static final Logger logger = LoggerFactory.getLogger(AfterAdvice.class);

	@After("execution(* com.naver.myhome4..*Impl.get*(..))")
	public void afterLog(JoinPoint proceeding) {
		/*  출력 내용
		   [BeforeAdvice] : 비즈니스 로직 수행 전 동작입니다.
		   [BeforeAdvice] : com.naver.myhome4.service.BoardServiceImpl의 getBoardList() 호출합니다.
		 */
		
		logger.info("============================================================================");
		logger.info("[AfterAdvice] : 비즈니스 로직 수행 후  동작입니다.");
		logger.info("[AfterAdvice] : "
				+ proceeding.getTarget().getClass().getName()
				+"의 " + proceeding.getSignature().getName() + "() 호출합니다.");
		logger.info("============================================================================");
		
	}
}
