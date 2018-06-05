package com.darong.persistence.mapper;

import java.util.List;

import com.darong.DTO.ComDTO;
import com.darong.DTO.HBoardDTO;
import com.darong.config.Mapper;

@Mapper("HBoardMapper")
public interface HBoardMapper {
	public List<HBoardDTO> getHList()throws Exception;
	public void insertH(HBoardDTO hDTO)throws Exception;
	public HBoardDTO getHDetail(HBoardDTO hDTO)throws Exception;
	public List<ComDTO> getHCom(ComDTO cDTO)throws Exception;
	public void deleteH(HBoardDTO hDTO)throws Exception;
	public void updateH(HBoardDTO hDTO)throws Exception;
	public void insertCH(ComDTO cDTO)throws Exception;
	public void deleteCH(ComDTO cDTO)throws Exception;
	public void updateCH(ComDTO cDTO)throws Exception;
	public int getHCount()throws Exception;
	public List<HBoardDTO> getHListPage(int pageNum)throws Exception;
}
