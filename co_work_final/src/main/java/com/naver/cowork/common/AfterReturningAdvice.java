package com.naver.cowork.common;

import org.aspectj.lang.annotation.AfterReturning;
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
// AfterReturngingAdvice : 타겟 메소드가 성공적으로 결과값을 반환 후에 어드바이스 기능을 수행합니다.

//@Service
//@Aspect
public class AfterReturningAdvice {
	private static final Logger logger = LoggerFactory.getLogger(AfterReturningAdvice.class);

	@AfterReturning(pointcut = "execution(* com.naver.myhome4..*Impl.get*(..))", returning = "obj")
	public void afterReturningLog(Object obj) {
		logger.info("============================================================================");
		logger.info("[AfterReturningAdvice] obj : " + obj.toString());
		logger.info("============================================================================");
	}
}
