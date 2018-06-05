package com.darong.service;

import java.util.List;

import com.darong.DTO.DataDTO;

public interface IDataService {

	public List<DataDTO> getAllData()throws Exception;

	public List<DataDTO> getFirstData()throws Exception;
	
	public List<DataDTO> getSTData1()throws Exception;
	public List<DataDTO> getSTData2()throws Exception;

	public List<DataDTO> getIEList(DataDTO dDTO)throws Exception;

	public List<DataDTO> getPList(DataDTO dDTO)throws Exception;

	public List<DataDTO> getFishDataList(DataDTO dDTO)throws Exception;
}
