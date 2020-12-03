package com.join.dao;

import com.join.dto.UserVO;
import java.util.List;

public interface UserDAO {
	public int checkEmail(UserVO userVO)  throws Exception;
	public void insertUser(UserVO userVO) throws Exception;
	public int loginCheck(UserVO userVO)  throws Exception;
	public int setInfo(UserVO userVO) throws Exception;
}
