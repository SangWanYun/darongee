package com.darong.persistence.mapper;


import com.darong.DTO.UserDTO;
import com.darong.config.Mapper;

@Mapper("UserMapper")
public interface UserMapper {
	
	public void userJoin(UserDTO uDTO)throws Exception;
	public UserDTO userLogin(UserDTO uDTO)throws Exception;
	public UserDTO userIdFind(UserDTO uDTO)throws Exception;
	public UserDTO getUserNo(UserDTO uDTO)throws Exception;
	public void userPwFind(UserDTO udto)throws Exception;
	public UserDTO myInfo(UserDTO udto)throws Exception;
	public void myInfoChg(UserDTO udto)throws Exception;
	public int checkDup(UserDTO uDTO)throws Exception;
}

