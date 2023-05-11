package com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.naver.cowork.handler.SocketHandler;

@Configuration
@EnableWebSocket   //WebSocket을 사용할 수 있도록 활성화하는 어노테이션입니다.
public class WebSocketConfig implements WebSocketConfigurer{ //WebSocketConfigurer 인터페이스를 구현하는 WebSocketConfig 클래스를 정의합니다.
	
		@Autowired  //스프링의 의존성 주입(Dependency Injection) 기능을 사용하여 SocketHandler 클래스의 인스턴스를 주입받습니다.
		SocketHandler socketHandler;  //SocketHandler 클래스의 인스턴스를 선언합니다. 이는 스프링의 의존성 주입 기능을 통해 주입받을 것입니다.

		@Override
		public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) { //WebSocketHandlerRegistry를 통해 WebSocket 핸들러를 등록하는 메서드를 구현합니다.
			registry.addHandler(socketHandler, "/chating/{roomNumber}"); 
			//SocketHandler 인스턴스를 "/chating/{roomNumber}" 경로에 등록합니다. 
			//이는 WebSocket 연결이 이 경로로 들어왔을 때 해당 핸들러를 통해 처리될 것임을 나타냅니다.
		}
}
//이 코드는 스프링에서 WebSocket을 사용하기 위한 설정 클래스로, 
//WebSocket 핸들러를 등록하고 의존성 주입을 통해 SocketHandler 클래스의 인스턴스를 사용하는 것을 보여줍니다.