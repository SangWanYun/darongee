package com.darong.service;

import java.util.List;

import com.darong.DTO.AttDTO;
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
	public void deleteC(ComDTO cDTO)throws Exception;
	public void updateC(ComDTO cDTO)throws Exception;
	public int getGCount()throws Exception;
	public List<GBoardDTO> getGListPage(int pageNum)throws Exception;
	public void insertA(AttDTO aDTO)throws Exception;
	public List<AttDTO> getAList(AttDTO aDTO)throws Exception;
	public int getACount(AttDTO aDTO)throws Exception;
	public void deleteA(AttDTO aDTO)throws Exception;
	public int getA(AttDTO aDTO)throws Exception;
	public void deleteMyA(AttDTO aDTO)throws Exception;

}
