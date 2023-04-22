package com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.naver.cowork.handler.SocketHandler;

@Configuration
@EnableWebSocket  
public class WebSocketConfig implements WebSocketConfigurer{
	
		@Autowired
		SocketHandler socketHandler;  //socketHandler 鍮�(Bean) 媛앹껜瑜� 二쇱엯諛쏆쓬

		@Override
		public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
			registry.addHandler(socketHandler, "/chating/{roomNumber}");
		}
}