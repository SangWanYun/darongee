package com.darong.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.darong.DTO.DataDTO;
import com.darong.persistence.mapper.DataMapper;
import com.darong.service.IDataService;

@Service("DataService")
public class DataService implements IDataService{
	
	@Resource(name="DataMapper")
	private DataMapper dMapper;

	@Override
	public List<DataDTO> getAllData() throws Exception {
		// TODO Auto-generated method stub
		return dMapper.getAllData();
	}

	@Override
	public List<DataDTO> getFirstData() throws Exception {
		// TODO Auto-generated method stub
		return dMapper.getFirstData();
	}

	@Override
	public List<DataDTO> getSTData1() throws Exception {
		// TODO Auto-generated method stub
		return dMapper.getSTData1();
	}
	
	public List<DataDTO> getSTData2() throws Exception {
		// TODO Auto-generated method stub
		return dMapper.getSTData2();
	}

	@Override
	public List<DataDTO> getIEList(DataDTO dDTO) throws Exception {
		// TODO Auto-generated method stub
		return dMapper.getIEList(dDTO);
	}

	@Override
	public List<DataDTO> getPList(DataDTO dDTO) throws Exception {
		// TODO Auto-generated method stub
		return dMapper.getPList(dDTO);
	}

	@Override
	public List<DataDTO> getFishDataList(DataDTO dDTO) throws Exception {
		// TODO Auto-generated method stub
		return dMapper.getFishDataList(dDTO);
	}
}
