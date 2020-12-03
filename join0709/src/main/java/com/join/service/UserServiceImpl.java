package com.join.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.join.dao.UserDAO;
import com.join.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {

	
	@Inject
	UserDAO dao;
	
	
	@Override
	public void insertUser(UserVO userVO) throws Exception
	{
		dao.insertUser(userVO);
	}
	
	@Override
	public int checkEmail(UserVO userVO)  throws Exception
	{
		return dao.checkEmail(userVO);
	}
	
	@Override
	public int loginCheck(UserVO userVO)  throws Exception
	{
		return dao.loginCheck(userVO);
	}
	
	@Override
	public int setInfo(UserVO userVO) throws Exception 
	{
		return dao.setInfo(userVO);
	}
}
