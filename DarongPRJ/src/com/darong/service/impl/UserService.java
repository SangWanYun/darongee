package com.darong.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.darong.DTO.UserDTO;
import com.darong.persistence.mapper.UserMapper;
import com.darong.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{

	@Resource(name="UserMapper")
	private UserMapper userMapper;
	
	@Override
	public void userJoin(UserDTO uDTO) throws Exception {
		userMapper.userJoin(uDTO);
	}

	@Override
	public UserDTO userLogin(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.userLogin(uDTO);
	}

	@Override
	public UserDTO userIdFind(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.userIdFind(uDTO);
	}

	@Override
	public UserDTO getUserNo(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserNo(uDTO);
	}

	@Override
	public void userPwFind(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		userMapper.userPwFind(udto);
	}

	@Override
	public UserDTO myInfo(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.myInfo(udto);
	}

	@Override
	public void myInfoChg(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		userMapper.myInfoChg(udto);
	}

	@Override
	public int checkDup(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.checkDup(uDTO);
	}

	@Override
	public List<UserDTO> memberList() throws Exception {
		// TODO Auto-generated method stub
		return userMapper.memberList();
	}

	@Override
	public void deleteU(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		userMapper.deleteU(uDTO);
	}
	
	

}
