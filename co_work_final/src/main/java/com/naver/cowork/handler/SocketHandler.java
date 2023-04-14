package com.naver.cowork.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {  //WebSocketHandler를 상속받아 웹소켓 핸들러를 구현한 클래스
	
	//HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	List<HashMap<String, Object>> rls = new ArrayList<>(); //웹소켓 세션을 담아둘 리스트 ---roomListSessions
	
	@Override //해당 메서드가 상위 클래스나 인터페이스의 메서드를 재정의하는 것을 의미
	public void handleTextMessage(WebSocketSession session, TextMessage message) { //클라이언트에서 메시지를 수신할 때 호출되는 메서드
								//WebSocket 세션에서 텍스트 메시지를 수신할 때 호출되는 메서드를 정의
								//WebSocketSession은 웹소켓 연결을 나타내는 객체로, 세션에 대한 정보와 메서드를 제공
								//TextMessage는 수신된 텍스트 메시지를 나타내는 객체
		//메시지 발송
		String msg = message.getPayload();  //message객체에서 텍스트 메시지 내용을 가져와서 msg변수에 저장. getPayload()메서드를 사용하여 텍스트 메시지의 내용을 얻음
		JSONObject obj = jsonToObjectParser(msg);  //JSON형태의 메시지를 파싱하여 JSONObject로 변환
		System.out.print("2. 메시지 전송" + msg);
		
		String rN = (String) obj.get("roomNumber"); //파싱된 JSON객체 obj에서 roomNumber라는 키에 해당하는 값을 가져와서 rN에 저장. 이 값은 메시지에서 추출한 방 번호임.
		System.out.print("3. 방번호 rN = " + rN);
		HashMap<String, Object> temp = new HashMap<String, Object>(); //해당 방번호의 세션을 저장할 임시 맵 생성
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String roomNumber = (String) rls.get(i).get("roomNumber"); //세션리스트의 저장된 방번호를 가져와서
				if(roomNumber.equals(rN)) { //roomNumber와 rN의 값이 같은 경우만 수행한다. (=현재 순회 중인 세션의 방번호와 메시지에서 추출한 방 번호가 일치하면 처리해라)
					temp = rls.get(i); //temp변수에 현재 순회 중인 세션을 저장한다. 즉, 같은 방 번호를 가진 세션 중에서 첫 번째 세션의 정보를 temp에 저장한다.
					break;
				}
			}
			
			//해당 방의 세션들만 찾아서 메시지를 발송해준다.
			for(String k : temp.keySet()) { //temp 맵의 키들을 순회하면서(=방의 세션들을 순회하면서)반복함. temp맵은 해당 방번호의 세션을 저장한 맵
				if(k.equals("roomNumber")) { //만약 키가 "roomNumber"일 경우에는 건너뛴다. 방번호일 경우에는 건너뛴다.
					continue; //왜냐면 메시지는 방번호를 제외한 다른 키에 대해서만 발송되어야 하기 때문임.
				}
				
				WebSocketSession wss = (WebSocketSession) temp.get(k);  //현재 순회중인 키(k)에 해당하는 값을 가져와서 WebSocketSession타입으로 캐스팅하여 wss변수에 저장.
																//이는 해당 세션에 대한 WebSocket세션 객체를 가져오는 과정임
				if(wss != null) { //세션이 존재할 경우에만 메시지 발송을 진행한다.
					try {
						wss.sendMessage(new TextMessage(obj.toJSONString()));  //해당 세션에 JSON형태의 메시지 발송
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	@SuppressWarnings("unchecked")// 해당 메서드에서 사용되는 제네릭 타입 관련 경고를 무시하는 어노테이션입니다. 제네릭 타입을 사용할 때 발생하는 경고를 무시하고 컴파일을 허용합니다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception { //클라이언트와 웹소켓 연결이 성공한 후 호출되는 메서드
		//소켓 연결
		super.afterConnectionEstablished(session);  //부모클래스의 메서드를 호출한다. (WebSocketHandler의 afterConnectionEstablished 메서드)
		boolean flag = false;  //방 존재 여부를 나타내는 플래그 변수. 초기값 false.
		String url = session.getUri().toString();  //연결된 세션의 URI 가져와서 문자열로 변환
		System.out.println("1 = " + url);
		String roomNumber = url.split("/chating/")[1];  //URI에서 "/chating/"이후의 문자열을 추출하여 방 번호를 가져온다.
		int idx = rls.size(); //방의 사이즈를 조사한다. 초기값은 리스트 rls의 사이즈로 설정
		if(rls.size() > 0) { //방 리스트 rls에 원소가 존재하는 경우에만 처리한다
			for(int i=0; i<rls.size(); i++) {  //rls리스르트를 순회하면서 session에 저장된 번호랑 room번호랑 같은게 있는지 확인
				String rN = (String) rls.get(i).get("roomNumber"); //i번째 인덱스의 방 번호를 가져온다.
				if(rN.equals(roomNumber)) { //가져온 방 번호와 현재 방 번호가 일치하는 경우
					flag = true;	//플래그 변수를 true로 변경
					idx = i;		//현재 방 번호의 인덱스를 idx에 저장
					break;
				}
			}
		}
		
		if(flag) { //이미 존재하는 방인 경우 (=존재하는 방이라면 세션만 추가한다.)
			HashMap<String, Object> map = rls.get(idx);	//이미 존재하는 방의 인덱스에 해당하는 맵을 가져옴. 세션리스트, 방번호 방이 있어서 확인된 애를 map에 담아. 몇 번에 있는지 확인하고 가져옴.
			map.put(session.getId(), session); //해당 세션을 방의 맵에 추가함. (세션 ID를 키, 세션을 값으로 사용)
		}else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.   얘는 false상황.. 최초생성 방이라서 방번호넣고 세선넣고.
			HashMap<String, Object> map = new HashMap<String, Object>(); //새로운 맵 객체 생성
			map.put("roomNumber", roomNumber); //방 번호를 맵에 추가
			map.put(session.getId(), session); //해당 세션을 맵에 추가
			rls.add(map); //방 리스트에 맵 추가
			System.out.println("1 = " + idx);
		}
		
		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
		JSONObject obj = new JSONObject();   //JSON 형태의 객체를 생성한다.
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());  //session.getId()는 WebSocket세션의 고유한 아이디를 반환하는 메서드이다.
		
		session.sendMessage(new TextMessage(obj.toJSONString())); //생성된 JSON 객체를 문자열 형태로 변환하여 WebSocket세션을 통해 클라이언트로 전송
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception { //웹소켓세션이 종료된 후 호출되는 메서드 정의.
		//소켓 종료. WebSocketSession은 웹소켓 연결을 나타내는 객체로, 세션에 대한 정보와 메서드를 제공
		//CloseStatus는 세션이 종료된 원인에 대한 상태를 나타내는 객체
		System.out.print("끊김" );
		if(rls.size() > 0) { //rls리스트에서 session.getId()와 일치하는 세션을 찾아 해당 세션을 제거한다
			for(int i=0; i<rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status); //상위 클래스인 'super'의 afterConnectionClosed메서드를 호출하여 웹소켓 세션의 종료처리한다
	}
	
	private static JSONObject jsonToObjectParser(String jsonStr) { //JSON 형식의 문자열을 파싱하기 위한 JSONParser 객체를 생성한다.
																   //org.json.simple.parser.JSONParser 클래스를 사용하여 JSON을 파싱할 수 있다.
		System.out.print("3. jsonToObjectParser" );  
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr); //parser객체를 사용하여 jsonStr문자열을 JSON객체로 파싱한다.
													//parse()메서드는 파싱된 JSON객체를 반환하며, 형변환을 통해 JSONObject타입으로 캐스팅한다.
		} catch (ParseException e) {
			e.printStackTrace();
		} //JSON파싱 과정에서 발생하는 예외인 printStackTrace을 처리한다. 
		return obj; //파싱된 JSON객체를 반환한다. 이 메서드를 통해 JSON 형식의 문자열을 객체로 변환하여 활용할 수 있다.
	}
}