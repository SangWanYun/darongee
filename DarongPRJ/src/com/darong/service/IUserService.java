package com.darong.service;

import com.darong.DTO.UserDTO;

public interface IUserService {
	
	public void userJoin(UserDTO uDTO)throws Exception;
	public UserDTO userLogin(UserDTO uDTO)throws Exception;
	public UserDTO userIdFind(UserDTO uDTO)throws Exception;
	public UserDTO getUserNo(UserDTO uDTO)throws Exception;
	public void userPwFind(UserDTO udto)throws Exception;
	public UserDTO myInfo(UserDTO udto)throws Exception;
	public void myInfoChg(UserDTO udto)throws Exception;
	
}
