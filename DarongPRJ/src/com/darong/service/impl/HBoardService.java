package com.darong.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.darong.DTO.ComDTO;
import com.darong.DTO.HBoardDTO;
import com.darong.persistence.mapper.HBoardMapper;
import com.darong.service.IHBoardService;

@Service("HBoardService")
public class HBoardService implements IHBoardService{

	@Resource(name="HBoardMapper")
	private HBoardMapper hBoardMapper;
	
	@Override
	public List<HBoardDTO> getHList() throws Exception {
		// TODO Auto-generated method stub
		return hBoardMapper.getHList();
	}

	@Override
	public void insertH(HBoardDTO hDTO) throws Exception {
		// TODO Auto-generated method stub
		hBoardMapper.insertH(hDTO);
	}

	@Override
	public HBoardDTO getHDetail(HBoardDTO hDTO) throws Exception {
		// TODO Auto-generated method stub
		return hBoardMapper.getHDetail(hDTO);
	}

	@Override
	public List<ComDTO> getHCom(ComDTO cDTO) throws Exception {
		// TODO Auto-generated method stub
		return hBoardMapper.getHCom(cDTO);
	}

	@Override
	public void deleteH(HBoardDTO hDTO) throws Exception {
		// TODO Auto-generated method stub
		hBoardMapper.deleteH(hDTO);
	}

	@Override
	public void updateH(HBoardDTO hDTO) throws Exception {
		hBoardMapper.updateH(hDTO);
		
	}

	@Override
	public void insertCH(ComDTO cDTO) throws Exception {
		hBoardMapper.insertCH(cDTO);
		
	}

	@Override
	public void deleteCH(ComDTO cDTO) throws Exception {
		// TODO Auto-generated method stub
		hBoardMapper.deleteCH(cDTO);
	}

	@Override
	public void updateCH(ComDTO cDTO) throws Exception {
		// TODO Auto-generated method stub
		hBoardMapper.updateCH(cDTO);
	}

	@Override
	public int getHCount() throws Exception {
		// TODO Auto-generated method stub
		return hBoardMapper.getHCount();
	}

	@Override
	public List<HBoardDTO> getHListPage(int pageNum) throws Exception {
		// TODO Auto-generated method stub
		return hBoardMapper.getHListPage(pageNum);
	}
}
