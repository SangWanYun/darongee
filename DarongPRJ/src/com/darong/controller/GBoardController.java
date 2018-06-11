package com.darong.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.darong.DTO.AttDTO;
import com.darong.DTO.ComDTO;
import com.darong.DTO.GBoardDTO;
import com.darong.service.IGBoardService;
import com.darong.util.CmmUtil;


@Controller
public class GBoardController {
	
	@Resource(name = "GBoardService")
	private IGBoardService gboardService;
	
	@RequestMapping(value="gBoard", method=RequestMethod.GET)
	public String gBoard(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판페이지 도착");
		
		List<GBoardDTO>  glist = gboardService.getGList();
		int countG = gboardService.getGCount();
		
		System.out.println(countG);
		model.addAttribute("gCount", countG);
		model.addAttribute("glist", glist);
		model.addAttribute("jsonList", net.sf.json.JSONArray.fromObject(glist));
		
		return "gBoard";
	}
	
	@RequestMapping(value="gWriteCheck", method=RequestMethod.GET)
	public String gWriteCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판 글쓰기페이지 체크 도착");
		
		String msg = "";
		String url = "";
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		
		if(userId == null || userId == "") {
			msg= "글작성 시 로그인을 해주세요.";
			url = "gBoard.do";
		}else {
			msg= "나쁜글은 올리지 말아주세요.";
			url= "gWrite.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";
	}
	
	@RequestMapping(value="gWrite", method=RequestMethod.GET)
	public String gWrite(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판 글쓰기페이지 도착");
		
		return "gWrite";
	}
	
	@RequestMapping(value="gWriteProc", method=RequestMethod.POST)
	public String gWriteProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판 글쓰기페이지 프록도착");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String msg;
		String url;
		
		GBoardDTO gDTO = new GBoardDTO();
		request.setCharacterEncoding("utf-8");
		String title = CmmUtil.nvl(request.getParameter("gtitle"));
		String item = CmmUtil.nvl(request.getParameter("gItem"));
		String price = CmmUtil.nvl(request.getParameter("gPrice"));
		String seller = CmmUtil.nvl(request.getParameter("gName"));
		String origin = CmmUtil.nvl(request.getParameter("gPlace"));
		String content = request.getParameter("editordata");
		System.out.println(content);
		
		gDTO.setGbrdTitle(title);
		gDTO.setGbrdItem(item);
		gDTO.setGbrdPrice(price);
		gDTO.setGbrdName(seller);
		gDTO.setGbrdPlace(origin);
		gDTO.setRegUserNo(userId);
		gDTO.setGbrdContents(content);
		
		try {
			gboardService.insertG(gDTO);
			
			msg = "글쓰기 성공";
			url = "gBoard.do";
		}catch(Exception e) {
			e.printStackTrace();
			msg = "작성 실패";
			url = "gBoard.do";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "redirect";
	}
	
	@RequestMapping(value="imagePopup", method=RequestMethod.GET)
	public String imagePopup(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("사진 팝업 창 도착!");
		return "image";
	}
	
	@RequestMapping(value="fileupload", method=RequestMethod.POST)
	public String fileupload(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판 글쓰기페이지 이미지 넘기기 도착!");
		String filename = request.getParameter("image_file");
		model.addAttribute("image_file", filename);
		return "fileupload";
	}
	
	@RequestMapping(value = "singleUploadImageAjax", method = RequestMethod.POST)
	public @ResponseBody HashMap singleUploadImageAjax(@RequestParam("Filedata") MultipartFile multipartFile, HttpSession httpSession) 
	{ HashMap fileInfo = new HashMap(); // CallBack할 때 이미지 정보를 담을 Map 
	// 업로드 파일이 존재하면 
	if(multipartFile != null && !(multipartFile.getOriginalFilename().equals(""))) { // 확장자 제한
		String originalName = multipartFile.getOriginalFilename(); // 실제 파일명 
		String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1).toLowerCase(); // 실제파일 확장자 (소문자변경)
		if( !( (originalNameExtension.equals("jpg")) || (originalNameExtension.equals("gif")) || (originalNameExtension.equals("png")) || (originalNameExtension.equals("bmp")) ) ){ fileInfo.put("result", -1); // 허용 확장자가 아닐 경우
		return fileInfo; } // 파일크기제한 (1MB) 
		long filesize = multipartFile.getSize(); // 파일크기 
		long limitFileSize = 3*1024*1024; // 1MB 
		if(limitFileSize < filesize){ // 제한보다 파일크기가 클 경우 
			fileInfo.put("result", -2); 
			return fileInfo; } // 저장경로 
		String defaultPath = httpSession.getServletContext().getRealPath("/"); // 서버기본경로 (프로젝트 폴더 아님)
		String path = defaultPath + File.separator + "upload" + File.separator + "board" + File.separator + "images" + File.separator + ""; // 저장경로 처리 
		File file = new File(path); if(!file.exists()) { // 디렉토리 존재하지 않을경우 디렉토리 생성 
			file.mkdirs(); } // 파일 저장명 처리 (20150702091941-fd8-db619e6040d5.확장자) 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String today= formatter.format(new Date()); 
		String modifyName = today + "-" + UUID.randomUUID().toString().substring(20) + "." + originalNameExtension; // Multipart 처리 
		try { // 서버에 파일 저장 (쓰기) 
			multipartFile.transferTo(new File(path + modifyName)); // 로그
			System.out.println("** upload 정보 **"); 
			System.out.println("** path : " + path + " **"); 
			System.out.println("** originalName : " + originalName + " **"); 
			System.out.println("** modifyName : " + modifyName + " **"); } 
		catch (Exception e) { 
			e.printStackTrace(); System.out.println("이미지파일업로드 실패 - singleUploadImageAjax"); 
			} // CallBack - Map에 담기
		String imageurl = httpSession.getServletContext().getContextPath() + "/upload/board/images/" + modifyName; // separator와는 다름! 
		fileInfo.put("imageurl", imageurl); // 상대파일경로(사이즈변환이나 변형된 파일) 
		fileInfo.put("filename", modifyName); // 파일명 
		fileInfo.put("filesize", filesize); // 파일사이즈 
		fileInfo.put("imagealign", "C"); // 이미지정렬(C:center) 
		fileInfo.put("originalurl", imageurl); // 실제파일경로 
		fileInfo.put("thumburl", imageurl); // 썸네일파일경로(사이즈변환이나 변형된 파일) 
		fileInfo.put("result", 1); // -1, -2를 제외한 아무거나 싣어도 됨
		} 
		return fileInfo; // @ResponseBody 어노테이션을 사용하여 Map을 JSON형태로 반환
		}
	
	
		
	@RequestMapping(value="gBoardDetail", method=RequestMethod.GET)
	public String gBoardDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래 상세보기 조회 성공");
		String gbrdSeq = CmmUtil.nvl(request.getParameter("gbrdSeq"));
		System.out.println(gbrdSeq);
		GBoardDTO gDTO = new GBoardDTO();
		ComDTO cDTO = new ComDTO();
		AttDTO aDTO = new AttDTO();
		
		gDTO.setGbrdSeq(gbrdSeq);
		cDTO.setComNSeq(gbrdSeq);
		aDTO.setAttNSeq(gbrdSeq);
		System.out.println(cDTO.getComNSeq());
		List<ComDTO> cList = null;
		int aCount = 0;
		
		try {
			gDTO = gboardService.getGDetail(gDTO);
			cList = gboardService.getGCom(cDTO);
			aCount = gboardService.getACount(aDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("상세조회 실패");
		}
		System.out.println(gDTO.getGbrdTitle());
		System.out.println(gDTO.getGbrdContents());
		String str = gDTO.getGbrdContents();
		str = str.replace("& lt;", "<");
		str = str.replace("& gt;", ">");
		str = str.replace("& quot;", "\"");
		str = str.replace("& #39;", "'");
		str = str.replace("& nbsp;", " ");
		str = str.replace("<br />", "\n");
		
		model.addAttribute("aCount", aCount);
		model.addAttribute("gContents", str);
		model.addAttribute("gDetail", gDTO);
		model.addAttribute("gComments", cList);
		System.out.println(gboardService.getGCom(cDTO));
		System.out.println(cList);
		model.addAttribute("jsonList", net.sf.json.JSONArray.fromObject(cList));
		return "gBoardDetail";
	}
	
	@RequestMapping(value="deleteG", method=RequestMethod.GET)
	public String deleteG(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래삭제 페이지 도착!!");
		String gbrdSeq = request.getParameter("gbrdSeq");
		GBoardDTO gDTO = new GBoardDTO();
		gDTO.setGbrdSeq(gbrdSeq);
		String url = "";
		String msg = "";
		
		try {
			gboardService.deleteG(gDTO);
			
			url="gBoard.do";
			msg = "삭제가 정상적으로 이루어졌습니다.";
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패");
			url = "gBoardDetail.do?gbrdSeq=" + gbrdSeq;
			msg = "삭제 실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "redirect";
	}
	
	@RequestMapping(value="updateG")
	public String updateG(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래업데이트 페이지 도착!!");
		String gbrdSeq = request.getParameter("gbrdSeq");
		GBoardDTO gDTO = new GBoardDTO();
		gDTO.setGbrdSeq(gbrdSeq);
		
		gDTO.setGbrdSeq(gbrdSeq);
		
		try {
			gDTO = gboardService.getGDetail(gDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("상세조회 실패");
		}
		System.out.println(gDTO.getGbrdTitle());
		System.out.println(gDTO.getGbrdContents());
		
		String str = gDTO.getGbrdContents();
		
		str = str.replace("& lt;", "<");
		str = str.replace("& gt;", ">");
		str = str.replace("& quot;", "\"");
		str = str.replace("& #39;", "'");
		str = str.replace("& nbsp;", " ");
		str = str.replace("<br />", "\n");
		
		model.addAttribute("gContents", str);
		model.addAttribute("gDetail", gDTO);
		return "gUpdate";
	}
	
	@RequestMapping(value="gUpdateProc", method=RequestMethod.POST)
	public String gUpdateProc(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래업데이트 프록 페이지 도착!!");
		GBoardDTO gDTO = new GBoardDTO();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String gbrdSeq = request.getParameter("gbrdSeq");

		String url = "";
		String msg = "";
		
		request.setCharacterEncoding("utf-8");
		String title = CmmUtil.nvl(request.getParameter("gtitle"));
		String item = CmmUtil.nvl(request.getParameter("gItem"));
		String price = CmmUtil.nvl(request.getParameter("gPrice"));
		String seller = CmmUtil.nvl(request.getParameter("gName"));
		String origin = CmmUtil.nvl(request.getParameter("gPlace"));
		String content = request.getParameter("editordata");
		System.out.println(gbrdSeq);
		System.out.println(content);
		
		gDTO.setGbrdSeq(gbrdSeq);
		gDTO.setGbrdTitle(title);
		gDTO.setGbrdItem(item);
		gDTO.setGbrdPrice(price);
		gDTO.setGbrdName(seller);
		gDTO.setGbrdPlace(origin);
		gDTO.setRegUserNo(userId);
		gDTO.setGbrdContents(content);
		
		try {
			gboardService.updateG(gDTO);
			
			url= "gBoardDetail.do?gbrdSeq=" + gbrdSeq;
			msg = "업데이트가 정상적으로 이루어졌습니다.";
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 실패");
			url = "gBoardDetail.do?gbrdSeq=" + gbrdSeq;
			msg = "업데이트 실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "redirect";
	}
	
	
	@RequestMapping(value="commentInsert", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> commentInsert(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 쓰기 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String gbrdSeq = CmmUtil.nvl(request.getParameter("gbrdSeq"));
		String userId = CmmUtil.nvl(request.getParameter("userId"));
		String comment = CmmUtil.nvl(request.getParameter("comment"));
		System.out.println(userId);
		System.out.println(gbrdSeq);
		System.out.println(comment);
		
		cDTO.setComNSeq(gbrdSeq);
		cDTO.setComContents(comment);
		cDTO.setRegUserNo(userId);
		
		try {
			gboardService.insertC(cDTO);
			cList = gboardService.getGCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 등록 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="commentDelete", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> commentDelete(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 삭제 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String gbrdSeq = CmmUtil.nvl(request.getParameter("gbrdSeq"));
		String comSeq = CmmUtil.nvl(request.getParameter("comSeq"));
		String userId = CmmUtil.nvl(request.getParameter("userId"));
		System.out.println(gbrdSeq);
		System.out.println(comSeq);
		System.out.println(userId);
		
		cDTO.setComNSeq(gbrdSeq);
		cDTO.setComSeq(comSeq);
		cDTO.setRegUserNo(userId);
		
		try {
			gboardService.deleteC(cDTO);
			cList = gboardService.getGCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="commentRefresh", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> commentRefresh(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 삭제 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String gbrdSeq = CmmUtil.nvl(request.getParameter("gbrdSeq"));
		System.out.println(gbrdSeq);
		
		cDTO.setComNSeq(gbrdSeq);

		
		try {
			cList = gboardService.getGCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="modifyProcC", method=RequestMethod.POST)
	public @ResponseBody List<ComDTO> modifyProcC(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("댓글 수정 도착");
		ComDTO cDTO = new ComDTO();
		List<ComDTO> cList = null;
		String gbrdSeq = CmmUtil.nvl(request.getParameter("gbrdSeq"));
		String cid = CmmUtil.nvl(request.getParameter("cid"));
		String commentHtml = CmmUtil.nvl(request.getParameter("commentHtml"));
		System.out.println(gbrdSeq);
		System.out.println(cid);
		System.out.println(commentHtml);
		
		cDTO.setComNSeq(gbrdSeq);
		cDTO.setComSeq(cid);
		cDTO.setComContents(commentHtml);
		
		try {
			gboardService.updateC(cDTO);
			cList = gboardService.getGCom(cDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 삭제 실패");
		}
		
		return cList;
	}
	
	@RequestMapping(value="gBoardPaging", method=RequestMethod.POST)
	public @ResponseBody List<GBoardDTO> gBoardPaging(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("거래게시판페이징 아작스 도착");
		String batch = request.getParameter("pageNum");
		
		int pageNum = Integer.parseInt(batch);
		
		pageNum = pageNum * 10 - 10;
		
		List<GBoardDTO>  glist = gboardService.getGListPage(pageNum);
		int countG = gboardService.getGCount();
		
		System.out.println(countG);
		model.addAttribute("gCount", countG);
		
		
		return glist;
	}
	
	@RequestMapping(value="attentionInsert", method=RequestMethod.POST)
	public @ResponseBody int attentionInsert(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("관심 프록 도착");
		AttDTO aDTO = new AttDTO();
		GBoardDTO gDTO = new GBoardDTO();
		
		String countNum = "";
		int countingA = 0;
		
		String gbrdSeq = CmmUtil.nvl(request.getParameter("gbrdSeq"));
		String userId = CmmUtil.nvl(request.getParameter("userId"));
		
		System.out.println(gbrdSeq);
		System.out.println(userId);
		
		aDTO.setAttNSeq(gbrdSeq);
		aDTO.setRegUserNo(userId);
		
		gDTO.setGbrdSeq(gbrdSeq);
		
		try {
			countingA = gboardService.getA(aDTO);
			System.out.println(countingA);
			if(countingA > 0) {
				gboardService.deleteA(aDTO);
			}else {
				gDTO = gboardService.getGDetail(gDTO);
				aDTO.setAttNSeq(gDTO.getGbrdSeq());
				aDTO.setAttTitle(gDTO.getGbrdTitle());
				aDTO.setAttName(gDTO.getRegUserNo());
				System.out.println(gDTO.getRegDate());
				aDTO.setAttDate(gDTO.getRegDate());
				
				aDTO.setRegUserNo(userId);
				System.out.println(aDTO.getAttDate());
				
				gboardService.insertA(aDTO);
			}
			
			countingA = gboardService.getACount(aDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("관심 실패");
		}
		
		
		
		return countingA;
	}
	
	
}
	

