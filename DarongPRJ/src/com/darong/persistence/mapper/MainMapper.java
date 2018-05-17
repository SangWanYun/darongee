package com.darong.persistence.mapper;

import java.util.List;

import com.darong.DTO.MainDTO;
import com.darong.config.Mapper;


@Mapper("MainMapper")
public interface MainMapper {

	List<MainDTO> getInfo()throws Exception;
	

	

}