package com.darong.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.darong.DTO.MainDTO;
import com.darong.persistence.mapper.MainMapper;
import com.darong.service.IMainService;

@Service("MainService")
public class MainService implements IMainService {
		
	@Resource(name="MainMapper")
	private MainMapper mainMapper;

	@Override
	public List<MainDTO> getInfo() throws Exception {
		return mainMapper.getInfo();
	}
		
	
		
}