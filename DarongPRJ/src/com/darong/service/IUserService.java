package com.darong.service;

import java.util.List;

import com.darong.DTO.UserDTO;

public interface IUserService {
	
	public void userJoin(UserDTO uDTO)throws Exception;
	public UserDTO userLogin(UserDTO uDTO)throws Exception;
	public UserDTO userIdFind(UserDTO uDTO)throws Exception;
	public UserDTO getUserNo(UserDTO uDTO)throws Exception;
	public void userPwFind(UserDTO udto)throws Exception;
	public UserDTO myInfo(UserDTO udto)throws Exception;
	public void myInfoChg(UserDTO udto)throws Exception;
	public int checkDup(UserDTO uDTO)throws Exception;
	public List<UserDTO> memberList()throws Exception;
	public void deleteU(UserDTO uDTO)throws Exception;
}
