package com.darong.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.darong.DTO.AttDTO;
import com.darong.DTO.GBoardDTO;
import com.darong.DTO.UserDTO;
import com.darong.service.IGBoardService;
import com.darong.service.IUserService;
import com.darong.util.CmmUtil;
import com.darong.util.SHAUtill;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "UserService")
	private IUserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name = "GBoardService")
	private IGBoardService gboardService;
	
	
	//濡쒓렇�씤 �쟾
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("조인페이지 도착");
		
		return "join";
		
	}
	
	@RequestMapping(value="joinProc", method=RequestMethod.POST)
	public String joinProc(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		
		UserDTO udto = new UserDTO();
		String msg = "";
		String url = "";
		
		try {
			udto.setUserId(request.getParameter("userId"));
			udto.setUserName(request.getParameter("userName"));
			udto.setUserPw(SHAUtill.encryption(request.getParameter("userPw")));
			udto.setUserEmail1(request.getParameter("userEmail1"));
			udto.setUserTel1(request.getParameter("userTel1"));
			udto.setUserTel2(request.getParameter("userTel2"));
			udto.setUserTel3(request.getParameter("userTel3"));
			udto.setUserBirth(request.getParameter("userBirth"));
			
			System.out.println(udto.getUserPw());
			System.out.println(udto.getUserId());
			System.out.println(udto.getUserName());
			userService.userJoin(udto);
			
			msg = "회원가입 성공.";
			url = "login.do";
			
			System.out.println("회원가입 성공");
			
			udto = null;
		}catch(Exception e) {
			msg = "회원가입 실패.";
			System.out.println("회원가입 실패");
			url="join.do";
			e.printStackTrace();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "redirect";
		
	}	
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("로그인페이지 도착");
		
		return "login";
		
	}
	
	@RequestMapping(value="loginProc", method=RequestMethod.POST)
	public String loginProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("로그인페이지 도착");
		String msg = "";
		String url = "";
		UserDTO udto = new UserDTO();
		
		try {
			HttpSession session = request.getSession();
			String userId = CmmUtil.nvl(request.getParameter("userId"));
			String userPw = CmmUtil.nvl(request.getParameter("userPw"));
			System.out.println(SHAUtill.encryption(userPw));
			udto.setUserId(userId);
			udto.setUserPw(SHAUtill.encryption(userPw));
			System.out.println(udto.getUserId());
			udto = userService.userLogin(udto);
			
			if(udto.getUserNo() == null) {
				msg = "incorrect ID or PW.";
				System.out.println("로그인 실패");
				url="login.do";
			}else {
				msg = "login success.";
				url = "main.do";
				session.setAttribute("userId", userId);
				session.setAttribute("userNo", udto.getUserNo());
			}
			
			
						
			
			udto = null;
		}catch(Exception e) {
			msg = "incorrect ID or PW.";
			System.out.println("로그인 실패");
			url="login.do";
			e.printStackTrace();
		}
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "redirect";
		
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("로그아웃 도착");
		HttpSession session = request.getSession();
		   log.info(this.getClass() + ".logOut start");
		      session.setAttribute("userId", "");
		      model.addAttribute("msg", "로그아웃되었습니다.");
		      model.addAttribute("url", "main.do");
		      log.info(this.getClass() + ".logOut end");
		      return "redirect";
		   
		
	}
	
	@RequestMapping(value="idFind", method=RequestMethod.GET)
	public String idSearch() {
		System.out.println("아이디찾기 도착");
		
		return "idFind";
	
	}
	
	@RequestMapping(value="idFindProc", method=RequestMethod.POST)
	public String idFindProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("아이디찾기프록 도착");
		log.info(this.getClass() + ".id_search_proc start");
		

		String email1 = CmmUtil.nvl(request.getParameter("userEmail1"));
		String birth = CmmUtil.nvl(request.getParameter("userBirth"));
	

		
		UserDTO uDTO = new UserDTO();
		
		System.out.println("이메일: " + email1);
		System.out.println("생년: " + birth);
		

		uDTO.setUserEmail1(email1);
		uDTO.setUserBirth(birth);
		uDTO.setUserName(CmmUtil.nvl(request.getParameter("userName")));
		System.out.println(uDTO.getUserName());

		uDTO = userService.userIdFind(uDTO);
		
		
		if (uDTO != null) {
			model.addAttribute("msg", "회원님의 아이디는 [ " + uDTO.getUserId() + " ]입니다.");
			model.addAttribute("url", "login.do");
		} else {
			model.addAttribute("msg", "일치하는 회원이 없습니다. 다시 확인해주세요");
			model.addAttribute("url", "idFind.do");
		}
		log.info(this.getClass() + ".id_search_proc end");
		uDTO = null;
		return "redirect";
		   
		
	}
	
	@RequestMapping(value="pwChg", method=RequestMethod.GET) //pw찾기 페이지로 이동.
	public String pwChange() {
		System.out.println("패스워드 도착");
		
		return "pwChg";
	
	}
	
	@RequestMapping(value="pwChgProc", method=RequestMethod.POST) //pw변경 메일 발송
	public String pwChgProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("비번바꾸기프록 도착");
		
		log.info(this.getClass() + ".pwSearch start");
		
		String user_id = request.getParameter("userId");
		String email = request.getParameter("userEmail1");
		String birth = request.getParameter("userBirth");
		
		log.info(this.getClass() + "id : " + user_id);
		log.info(this.getClass() + "email : " + email);
		
		UserDTO uDTO = new UserDTO();
		
		uDTO.setUserId(user_id);
		uDTO.setUserEmail1(email);
		uDTO.setUserBirth(birth);
				
		
		//이메일 인증 url 발송
				
		
		log.info(uDTO.getUserEmail1());
		String setfrom = "wanyyun@naver.com";					//송신자 메일 주소
		String tomail = uDTO.getUserEmail1();				        //수신자 메일 주소
		String title = "Darongee 비밀번호변경";		        //메일 제목
		StringBuffer contents = new StringBuffer();
		try{
			uDTO = userService.getUserNo(uDTO);
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		if(uDTO.getUserNo() == null) {
			model.addAttribute("msg", "제대로된 정보를 입력해주세요.");
			model.addAttribute("url", "pwChg.do");
			return "redirect";
		}
		String key = uDTO.getUserNo();
		log.info(key);
		
		contents.append("비밀번호변경해주시길 바랍니다. <br/>")
				.append("<a href='http://192.168.175.16:8080/userPwChange.do?key=")
				.append(key)
				.append("'><h2>비밀번호 변경</h2></a>");
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		messageHelper.setFrom(setfrom);						//송신자를 생략하면 정상작동을 안함
		messageHelper.setTo(tomail);						//수신자 메일
		messageHelper.setSubject(title);					//메일 제목은 생략 가능
		messageHelper.setText(contents.toString(),true);	//메일 내용
		
		mailSender.send(message);
		
		if (uDTO != null) {
			model.addAttribute("msg", "이메일을 전송했습니다! 비밀번호를 변경해주세요.");
			String smail[] = tomail.split("@");
			String mail = "http://www." + smail[1];
			model.addAttribute("url", mail);
		}else{
			model.addAttribute("msg", "이메일 전송을 실패했습니다.");
			model.addAttribute("url", "pwChg.do");
		}
		log.info(this.getClass() + ".pwSearch end");
		
		uDTO = null;
		
		
		
		return "redirect";
	}
	
	@RequestMapping(value="userPwChange", method=RequestMethod.GET) //pw변경 메일 발송
	public String userPwChange(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("이메일에서비번바꾸기 도착");
		
		HttpSession session = request.getSession();
		session.setAttribute("key", request.getParameter("key"));
		return "userPwChange";
	}
	
	@RequestMapping(value="userPwChangeProc", method=RequestMethod.POST)
	public String userPwChangeProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("이메일에서비번바꾸기프록 도착");
		String msg = "";
		String url = "";
		UserDTO udto = new UserDTO();
		
		try {
			HttpSession session = request.getSession();
			String user_no = (String) session.getAttribute("key");
			String password = CmmUtil.nvl(SHAUtill.encryption((request.getParameter("userPw"))));
			
			udto.setUserNo(user_no);
			udto.setUserPw(password);
			
			userService.userPwFind(udto);
			
			msg = "change success.";
			url = "login.do";
						
			
			udto = null;
		}catch(Exception e) {
			msg = "다시 확인해주세요.";
			System.out.println("바꾸기 실패");
			url="userPwChange.do";
			e.printStackTrace();
		}
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "redirect";
		
	}
	
	@RequestMapping(value="myPage", method=RequestMethod.GET) //마이페이지로 이동.
	public String myPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("마이페이지 도착");
		HttpSession session = request.getSession();
		String userNo = (String)session.getAttribute("userNo");
		String userId = (String)session.getAttribute("userId");
		
		System.out.println(userId);
		
		UserDTO udto = new UserDTO();
		AttDTO aDTO = new AttDTO();
		aDTO.setRegUserNo(userId);
		
		
		
		List<AttDTO>  glist = null;
		
		
		try {
			udto.setUserNo(userNo);
			udto = userService.myInfo(udto);
			model.addAttribute("udto",udto);
			
			glist = gboardService.getAList(aDTO);
		}catch(Exception e) {
			System.out.println("회원정보 조회 실패");
			e.printStackTrace();
		}
		
		udto = null;
		model.addAttribute("glist", glist);
		model.addAttribute("jsonList", net.sf.json.JSONArray.fromObject(glist));
		return "myPage";
	}
	
	@RequestMapping(value="myInfoChg", method=RequestMethod.POST) //마이페이지로 이동.
	public String myInfoChg(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("마이페이지정보수정 도착");
		HttpSession session = request.getSession();
		String userNo = (String)session.getAttribute("userNo");
		UserDTO udto = new UserDTO();
		String msg = "";
		String url = "";
		
		String email = CmmUtil.nvl(request.getParameter("userEmail1"));
		String tel1 = CmmUtil.nvl(request.getParameter("userTel1"));
		String tel2 = CmmUtil.nvl(request.getParameter("userTel2"));
		String tel3 = CmmUtil.nvl(request.getParameter("userTel3"));
		String birth = CmmUtil.nvl(request.getParameter("userBirth"));
		String pw = CmmUtil.nvl(SHAUtill.encryption(request.getParameter("userPw")));
		
		try {
			udto.setUserBirth(birth);
			udto.setUserEmail1(email);
			udto.setUserPw(pw);
			udto.setUserTel1(tel1);
			udto.setUserTel2(tel2);
			udto.setUserTel3(tel3);
			udto.setUserNo(userNo);
			
			userService.myInfoChg(udto);
			
			
			url = "myPage.do";
			msg = "Changed";
			
			System.out.println("회원정보 업데이트 성공");
		}catch(Exception e) {
			url = "myPage.do";
			System.out.println("회원정보 업데이트 실패");
			e.printStackTrace();
			msg = "Incorrect value";
		}
		
		udto = null;
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "redirect";
	}
	
	@RequestMapping(value="deleteA", method=RequestMethod.POST)
	public @ResponseBody List<AttDTO> deleteA(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("관심삭제 아작스 도착");
		
		HttpSession session = request.getSession();
		String attSeq = request.getParameter("attSeq");
		String userId = (String)session.getAttribute("userId");
		
		
		AttDTO aDTO = new AttDTO();
		
		List<AttDTO>  alist = null;
		aDTO.setAttSeq(attSeq);
		System.out.println(aDTO.getAttSeq());
		try {
			gboardService.deleteMyA(aDTO);
			
			aDTO.setRegUserNo(userId);
			
			alist = gboardService.getAList(aDTO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return alist;
	}
	
	@RequestMapping(value="dIdCheck", method=RequestMethod.POST)
	public @ResponseBody int dIdCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("아이디 중복체크 아작스 도착");
		int idCount = 0;
		String prdId = request.getParameter("prdId");
		
		UserDTO uDTO = new UserDTO();
		
		
		uDTO.setUserId(prdId);
		
		
		System.out.println(uDTO.getUserId());
		try {
			idCount = userService.checkDup(uDTO);
			System.out.println(idCount);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return idCount;
	}
	
	@RequestMapping(value="memberAdmin", method=RequestMethod.GET)
	public String memberAdmin(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("회원정보 관리 페이지 도착");
		List<UserDTO> uList = null;
		
		try {
			uList = userService.memberList();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("uList", uList);
		model.addAttribute("jsonList", net.sf.json.JSONArray.fromObject(uList));
		return "memberAdmin";
		
	}
	
	@RequestMapping(value="deleteU", method=RequestMethod.POST)
	public @ResponseBody List<UserDTO> deleteU(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("유저삭제 아작스 도착");
		
		String userNo = request.getParameter("userNo");
		
		
		UserDTO uDTO = new UserDTO();
		
		List<UserDTO>  uList = null;
		uDTO.setUserNo(userNo);
		System.out.println(uDTO.getUserNo());
		try {
			userService.deleteU(uDTO);
			
			uList = userService.memberList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return uList;
	}
}
