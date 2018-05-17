package com.darong.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.darong.DTO.MainDTO;
import com.darong.service.IMainService;
	
@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "MainService")
	private IMainService mainService;
	
	//濡쒓렇�씤 �쟾
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		
		List<MainDTO>  mlist = mainService.getInfo();
		
		System.out.println(mlist.size());
		
		model.addAttribute("mList",mlist);
		
		return "main";
		
	}
	


}