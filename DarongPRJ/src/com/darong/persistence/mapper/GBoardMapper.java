package com.darong.persistence.mapper;

import java.util.List;

import com.darong.DTO.ComDTO;
import com.darong.DTO.GBoardDTO;
import com.darong.config.Mapper;

@Mapper("GBoardMapper")
public interface GBoardMapper {
	
	public List<GBoardDTO> getGList()throws Exception;
	public void insertG(GBoardDTO gDTO)throws Exception;
	public GBoardDTO getGDetail(GBoardDTO gDTO)throws Exception;
	public List<ComDTO> getGCom(ComDTO cDTO)throws Exception;
	public void deleteG(GBoardDTO gDTO)throws Exception;
	public void updateG(GBoardDTO gDTO)throws Exception;
	public void insertC(ComDTO cDTO)throws Exception;
}
