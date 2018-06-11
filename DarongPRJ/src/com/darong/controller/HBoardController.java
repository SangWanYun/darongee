package com.darong.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.darong.DTO.ComDTO;
import com.darong.DTO.GBoardDTO;
import com.darong.DTO.HBoardDTO;
import com.darong.service.IHBoardService;
import com.darong.util.CmmUtil;

@Controller
public class HBoardController {

	@Resource(name = "HBoardService")
	private IHBoardService hboardService;
	
	@RequestMapping(value="hBoard", method=RequestMethod.GET)
	public String hBoard(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("후기게시판페이지 도착");
		
		List<HBoardDTO>  hlist = hboardService.getHList();
		int countH = hboardService.getHCount();
		
		System.out.println(countH);
		model.addAttribute("hCount", countH);
		model.addAttribute("hlist", hlist);
		model.addAttribute("jsonList", net.sf.json.JSONArray.fromObject(hlist));
		
		return "hBoard";
	}
	
	@RequestMapping(value="hWriteCheck", method=RequestMethod.GET)
	public String hWriteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("후기게시판 글쓰기페이지 체크 도착");
		
		String msg = "";
		String url = "";
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		
		if(userId == null || userId == "") {
			msg= "글작성 시 로그인을 해주세요.";
			url = "hBoard.do";
		}else {
			msg= "나쁜글은 올리지 말아주세요.";
			url= "hWrite.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";
	}
	
	@RequestMapping(value="hWrite", method=RequestMethod.GET)
	public String hWrite(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판 글쓰기페이지 도착");
		
		return "hWrite";
	}
	
	@RequestMapping(value="hWriteProc", method=RequestMethod.POST)
	public String hWriteProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판 글쓰기페이지 프록도착");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String msg;
		String url;
		
		HBoardDTO hDTO = new HBoardDTO();
		request.setCharacterEncoding("utf-8");
		String title = CmmUtil.nvl(request.getParameter("htitle"));
		String content = request.getParameter("editordata");
		System.out.println(title);
		System.out.println(content);
		
		hDTO.setHbrdTitle(title);
		hDTO.setRegUserNo(userId);
		hDTO.setHbrdContents(content);
		
		try {
			hboardService.insertH(hDTO);
			
			msg = "글쓰기 성공";
			url = "hBoard.do";
		}catch(Exception e) {
			e.printStackTrace();
			msg = "작성 실패";
			url = "hBoard.do";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";
	}
	
		
	@RequestMapping(value="hBoardDetail", method=RequestMethod.GET)
	public String hBoardDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("후기 상세보기 조회 성공");
		String hbrdSeq = CmmUtil.nvl(request.getParameter("hbrdSeq"));
		System.out.println(hbrdSeq);
		HBoardDTO hDTO = new HBoardDTO();
		ComDTO cDTO = new ComDTO();
		
		hDTO.setHbrdSeq(hbrdSeq);
		cDTO.setComNSeq(hbrdSeq);
		System.out.println(cDTO.getComNSeq());
		List<ComDTO> cList = null;
		
		try {
			hDTO = hboardService.getHDetail(hDTO);
			cList = hboardService.getHCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("상세조회 실패");
		}
		System.out.println(hDTO.getHbrdTitle());
		System.out.println(hDTO.getHbrdContents());
		String str = hDTO.getHbrdContents();
		str = str.replace("& lt;", "<");
		str = str.replace("& gt;", ">");
		str = str.replace("& quot;", "\"");
		str = str.replace("& #39;", "'");
		str = str.replace("& nbsp;", " ");
		str = str.replace("<br />", "\n");
		
		model.addAttribute("hContents", str);
		model.addAttribute("hDetail", hDTO);
		model.addAttribute("hComments", cList);
		System.out.println(hboardService.getHCom(cDTO));
		System.out.println(cList);
		model.addAttribute("jsonList", net.sf.json.JSONArray.fromObject(cList));
		return "hBoardDetail";
	}
	
	@RequestMapping(value="deleteH", method=RequestMethod.GET)
	public String deleteH(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래삭제 페이지 도착!!");
		String hbrdSeq = request.getParameter("hbrdSeq");
		HBoardDTO hDTO = new HBoardDTO();
		hDTO.setHbrdSeq(hbrdSeq);
		String url = "";
		String msg = "";
		
		try {
			hboardService.deleteH(hDTO);
			
			url="hBoard.do";
			msg = "삭제가 정상적으로 이루어졌습니다.";
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패");
			url = "hBoardDetail.do?hbrdSeq=" + hbrdSeq;
			msg = "삭제 실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "redirect";
	}
	
	@RequestMapping(value="updateH")
	public String updateH(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래업데이트 페이지 도착!!");
		String hbrdSeq = request.getParameter("hbrdSeq");
		HBoardDTO hDTO = new HBoardDTO();
		hDTO.setHbrdSeq(hbrdSeq);
		
		hDTO.setHbrdSeq(hbrdSeq);
		
		try {
			hDTO = hboardService.getHDetail(hDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("상세조회 실패");
		}
		System.out.println(hDTO.getHbrdTitle());
		System.out.println(hDTO.getHbrdContents());
		
		String str = hDTO.getHbrdContents();
		
		str = str.replace("& lt;", "<");
		str = str.replace("& gt;", ">");
		str = str.replace("& quot;", "\"");
		str = str.replace("& #39;", "'");
		str = str.replace("& nbsp;", " ");
		str = str.replace("<br />", "\n");
		
		model.addAttribute("hContents", str);
		model.addAttribute("hDetail", hDTO);
		return "hUpdate";
	}
	
	@RequestMapping(value="hUpdateProc", method=RequestMethod.POST)
	public String hUpdateProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래업데이트 프록 페이지 도착!!");
		HBoardDTO hDTO = new HBoardDTO();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String hbrdSeq = request.getParameter("hbrdSeq");

		String url = "";
		String msg = "";
		
		request.setCharacterEncoding("utf-8");
		String title = CmmUtil.nvl(request.getParameter("htitle"));
		String content = request.getParameter("editordata");
		System.out.println(hbrdSeq);
		System.out.println(content);
		
		hDTO.setHbrdSeq(hbrdSeq);
		hDTO.setHbrdTitle(title);
		hDTO.setRegUserNo(userId);
		hDTO.setHbrdContents(content);
		
		try {
			hboardService.updateH(hDTO);
			
			url= "hBoardDetail.do?hbrdSeq=" + hbrdSeq;
			msg = "업데이트가 정상적으로 이루어졌습니다.";
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 실패");
			url = "hBoardDetail.do?hbrdSeq=" + hbrdSeq;
			msg = "업데이트 실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "redirect";
	}
	
	
	@RequestMapping(value="hcommentInsert", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> hcommentInsert(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 쓰기 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String hbrdSeq = CmmUtil.nvl(request.getParameter("hbrdSeq"));
		String userId = CmmUtil.nvl(request.getParameter("userId"));
		String comment = CmmUtil.nvl(request.getParameter("comment"));
		System.out.println(userId);
		System.out.println(hbrdSeq);
		System.out.println(comment);
		
		cDTO.setComNSeq(hbrdSeq);
		cDTO.setComContents(comment);
		cDTO.setRegUserNo(userId);
		
		try {
			hboardService.insertCH(cDTO);
			cList = hboardService.getHCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 등록 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="hcommentDelete", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> hcommentDelete(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 삭제 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String hbrdSeq = CmmUtil.nvl(request.getParameter("hbrdSeq"));
		String comSeq = CmmUtil.nvl(request.getParameter("comSeq"));
		String userId = CmmUtil.nvl(request.getParameter("userId"));
		System.out.println(hbrdSeq);
		System.out.println(comSeq);
		System.out.println(userId);
		
		cDTO.setComNSeq(hbrdSeq);
		cDTO.setComSeq(comSeq);
		cDTO.setRegUserNo(userId);
		
		try {
			hboardService.deleteCH(cDTO);
			cList = hboardService.getHCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="hcommentRefresh", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> hcommentRefresh(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 삭제 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String hbrdSeq = CmmUtil.nvl(request.getParameter("hbrdSeq"));
		System.out.println(hbrdSeq);
		
		cDTO.setComNSeq(hbrdSeq);

		
		try {
			cList = hboardService.getHCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="modifyProcHC", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> modifyProcHC(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 수정 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String hbrdSeq = CmmUtil.nvl(request.getParameter("hbrdSeq"));
		String cid = CmmUtil.nvl(request.getParameter("cid"));
		String commentHtml = CmmUtil.nvl(request.getParameter("commentHtml"));
		System.out.println(hbrdSeq);
		System.out.println(cid);
		System.out.println(commentHtml);
		
		cDTO.setComNSeq(hbrdSeq);
		cDTO.setComSeq(cid);
		cDTO.setComContents(commentHtml);
		
		try {
			hboardService.updateCH(cDTO);
			cList = hboardService.getHCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="hBoardPaging", method=RequestMethod.POST)
	public @ResponseBody List<HBoardDTO> hBoardPaging(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("후기게시판페이징 아작스 도착");
		String batch = request.getParameter("pageNum");
		
		int pageNum = Integer.parseInt(batch);
		
		pageNum = pageNum * 10 - 10;
		
		List<HBoardDTO>  hlist = hboardService.getHListPage(pageNum);
		int countH = hboardService.getHCount();
		
		System.out.println(countH);
		model.addAttribute("hCount", countH);
		
		
		return hlist;
	}
	
	@RequestMapping(value="blogWordSave.do", method=RequestMethod.GET)
	public @ResponseBody JSONArray blogWordSave(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("블로그 워드 저장 도착");
		String bWord = CmmUtil.nvl(request.getParameter("bWord"));
		System.out.println(bWord);
		
		JSONArray item = null;
		String clientId = "czCv5VoFxP7uiPwfV543";
		String clientSecret = "rZsm7H9Fm5";
		
		try{
			String text = URLEncoder.encode(bWord, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text + "&display=5"; //json 결과 blog
			
			System.out.println(apiURL);
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			
			if(responseCode==200){
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}
			else{
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response1 = new StringBuffer();
			while((inputLine = br.readLine()) != null){
				response1.append(inputLine);
			}
			br.close();
			String str = response1.toString();
			System.out.println(str);
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject)parser.parse(str);
			
			item = (JSONArray)jsonObject.get("items");
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return item;
	}
}
