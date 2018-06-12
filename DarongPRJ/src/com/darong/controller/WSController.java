package com.darong.controller;

import java.io.IOException;

import javax.inject.Singleton;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@ServerEndpoint(value="/ws")
@Controller
@Singleton
public class WSController {
	private static String rtnMsg = "";
	private static final java.util.Set<Session> sessions = java.util.Collections.synchronizedSet(new java.util.HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("세션 ID : "+ session.getId());
		
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("- Connect Success -");
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}
		
		sessions.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("세션 ID : " + session.getId() + "내용 : "+ message);
		
		rtnMsg =  message;
		
		sendAll(session, rtnMsg);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(rtnMsg);
		}catch(IOException ex) {
			ex.printStackTrace();
		}
	}
	
	@OnError
	public void onError(Throwable t) {
		t.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session session) {
		System.out.println("종료 : "+session.getId());
		sessions.remove(session);
	}

	private void sendAll(Session ss, String message) {
		
		try {
			for(Session session : WSController.sessions) {
				if(!ss.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(message);
				}
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
}
