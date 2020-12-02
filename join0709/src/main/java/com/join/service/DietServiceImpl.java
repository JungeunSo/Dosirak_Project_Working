package com.join.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.join.dao.DietDAO;
import com.join.dto.FoodCalory;
import com.sun.tools.javac.util.List;

@Service
public class DietServiceImpl implements DietService {
	
	@Resource(name="dietDao")
	private DietDAO dietDao;
	
	@Override
    public int setCalory(Map<String, Object> paramMap) {
        return dietDao.setCalory(paramMap);
    }
	
	@Override
	public List<FoodCalory> getFoodCalory(Map<String, Object> paramMap) {
		return dietDao.getFoodCalory(paramMap);
	}
	

}
