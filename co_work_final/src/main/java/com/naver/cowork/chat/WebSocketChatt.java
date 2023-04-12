package com.naver.cowork.chat;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
//
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
//
import org.springframework.stereotype.Service;
//
@Service
@ServerEndpoint(value="/chat")
public class WebSocketChatt {
	private static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<Session>());

	// new WebSocket("ws://" + location.host + "/chatt");실행하면
	@OnOpen
	public void onOpen(Session s) {
		System.out.println("open session : " + s.toString());
		if(!clients.contains(s)) {
			clients.add(s);
			System.out.println("session open : " + s);
		}else {
			System.out.println("이미 연결된 session 임!!!");
		}
	}
	
//	
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception{
		System.out.println("receive message : " + msg);
		for(Session s : clients) {
			System.out.println("send data : " + msg);
			s.getBasicRemote().sendText(msg);  //주소지

		}
	}
//	
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove(s);
	}
}

/*
 이 코드는 WebSocket을 이용한 채팅 서버를 구현한 코드입니다.

@ServerEndpoint 어노테이션을 사용하여 WebSocket endpoint를 정의합니다.
@OnOpen 어노테이션을 사용하여 WebSocket이 연결되었을 때 호출되는 메소드를 정의합니다. 이 메소드에서는 새로 연결된 세션을 clients 집합에 추가합니다.
@OnMessage 어노테이션을 사용하여 WebSocket에서 메시지를 수신할 때 호출되는 메소드를 정의합니다. 이 메소드에서는 수신한 메시지를 clients 집합의 모든 세션에 전송합니다.
@OnClose 어노테이션을 사용하여 WebSocket이 종료되었을 때 호출되는 메소드를 정의합니다. 이 메소드에서는 종료된 세션을 clients 집합에서 제거합니다.
이렇게 구현된 WebSocket 서버는 /chatt 경로로 접속하여 채팅을 할 수 있습니다.
 * */
