package com.darong.service;

import java.util.List;

import com.darong.DTO.ComDTO;
import com.darong.DTO.GBoardDTO;

public interface IGBoardService {
	
	List<GBoardDTO> getGList()throws Exception;
	public void insertG(GBoardDTO gDTO)throws Exception;
	public GBoardDTO getGDetail(GBoardDTO gDTO)throws Exception;
	public List<ComDTO> getGCom(ComDTO cDTO)throws Exception;
	public void deleteG(GBoardDTO gDTO)throws Exception;
	public void updateG(GBoardDTO gDTO)throws Exception;
	public void insertC(ComDTO cDTO)throws Exception;
}
