package com.darong.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

import com.darong.DTO.ComDTO;
import com.darong.DTO.DataDTO;
import com.darong.service.IDataService;
import com.darong.util.CmmUtil;
import com.darong.util.Greeting;
import com.darong.util.HelloMessage;

@Controller
public class ChartController {

	@Resource(name = "DataService")
	private IDataService dataService;
	
	@RequestMapping(value="fChart", method=RequestMethod.GET)
	public String fChart(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		System.out.println("chart 도착.");
		List<DataDTO> dList = null;
		List<DataDTO> dSList1 = null;
		List<DataDTO> dSList2 = null;
		DataDTO dDTO = new DataDTO();
		
		try {
			//dList = dataService.getAllData();
			dList = dataService.getFirstData();
			dSList1 = dataService.getSTData1();
			dSList2 = dataService.getSTData2();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dList", dList);
		model.addAttribute("jsonList", net.sf.json.JSONArray.fromObject(dList));
		model.addAttribute("dSList1", dSList1);
		model.addAttribute("jsonSList1", net.sf.json.JSONArray.fromObject(dSList1));
		model.addAttribute("dSList2", dSList2);
		model.addAttribute("jsonSList2", net.sf.json.JSONArray.fromObject(dSList2));

		
		return "fChart";
	}
	
	
	@RequestMapping(value="dataIEList", method=RequestMethod.POST)
	public @ResponseBody List<DataDTO> dataIEList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("수입/수출 국가 리스트 도착");
		DataDTO dDTO = new DataDTO();
		List<DataDTO> dList = null;
		
		String datFCode = CmmUtil.nvl(request.getParameter("datFCode"));
		
		System.out.println(datFCode);
		
		dDTO.setDatFCode(datFCode);
		
		
		try {
			
			dList = dataService.getIEList(dDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("리스트 출력 실패");
		}
		
		return dList;
	}
	
	@RequestMapping(value="dataPList", method=RequestMethod.POST)
	public @ResponseBody List<DataDTO> dataPList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("수입/수출 국가 리스트 도착");
		DataDTO dDTO = new DataDTO();
		List<DataDTO> dList = null;
		
		String datFCode = CmmUtil.nvl(request.getParameter("datFCode"));
		String datPUCode = CmmUtil.nvl(request.getParameter("datPUCode"));
		
		System.out.println(datPUCode);
		
		dDTO.setDatPUCode(datPUCode);
		dDTO.setDatFCode(datFCode);
		
		
		try {
			
			dList = dataService.getPList(dDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("리스트 출력 실패");
		}
		
		return dList;
	}
	
	
	@RequestMapping(value="fishDataList", method=RequestMethod.POST)
	public @ResponseBody List<DataDTO> fishDataList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		System.out.println("수입/수출 국가 리스트 도착");
		DataDTO dDTO = new DataDTO();
		List<DataDTO> dList = null;
		
		String datFCode = CmmUtil.nvl(request.getParameter("datFCode"));
		String datPUCode = CmmUtil.nvl(request.getParameter("datPUCode"));
		String datTCode = CmmUtil.nvl(request.getParameter("datTCode"));
		
		System.out.println(datPUCode);
		System.out.println(datFCode);
		System.out.println(datTCode);
		
		datTCode = datTCode.replace("& #40;", "(");
		datTCode = datTCode.replace("& #41;", ")");
		
		System.out.println(datTCode);
		
		dDTO.setDatPUCode(datPUCode);
		dDTO.setDatFCode(datFCode);
		dDTO.setDatTCode(datTCode);
		
		
		try {
			
			dList = dataService.getFishDataList(dDTO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("리스트 출력 실패");
		}
		
		return dList;
	}
	
	
	@RequestMapping(value= "chatting.do", method = RequestMethod.GET)
	public String chat(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		
		//User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println("user name : " + user.getUsername());
		
		System.out.println("normal chat page");
		
		//mv.addObject("userid", user.getUsername());
		
		//model.addAttribute("userid", user.getUsername());
		return "chatingView";
	}
	
	@MessageMapping("/hello")
	@SendTo("/topic/greetings")
	public Greeting greeting(HelloMessage message) throws Exception{
		System.out.println("greeting");
		Thread.sleep(1000);
		return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
	}
}
