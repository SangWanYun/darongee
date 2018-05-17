package com.darong.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.darong.DTO.ComDTO;
import com.darong.DTO.GBoardDTO;
import com.darong.persistence.mapper.GBoardMapper;
import com.darong.service.IGBoardService;

@Service("GBoardService")
public class GBoardService implements IGBoardService{

	@Resource(name="GBoardMapper")
	private GBoardMapper gBoardMapper;
	
	@Override
	public List<GBoardDTO> getGList() throws Exception {
		// TODO Auto-generated method stub
		return gBoardMapper.getGList();
	}

	@Override
	public void insertG(GBoardDTO gDTO) throws Exception {
		// TODO Auto-generated method stub
		gBoardMapper.insertG(gDTO);
	}

	@Override
	public GBoardDTO getGDetail(GBoardDTO gDTO) throws Exception {
		// TODO Auto-generated method stub
		return gBoardMapper.getGDetail(gDTO);
	}

	@Override
	public List<ComDTO> getGCom(ComDTO cDTO) throws Exception {
		// TODO Auto-generated method stub
		return gBoardMapper.getGCom(cDTO);
	}

	@Override
	public void deleteG(GBoardDTO gDTO) throws Exception {
		// TODO Auto-generated method stub
		gBoardMapper.deleteG(gDTO);
	}

	@Override
	public void updateG(GBoardDTO gDTO) throws Exception {
		gBoardMapper.updateG(gDTO);
		
	}

	@Override
	public void insertC(ComDTO cDTO) throws Exception {
		gBoardMapper.insertC(cDTO);
		
	}

}
