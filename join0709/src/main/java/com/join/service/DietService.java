package com.join.service;

import java.util.Map;

import com.join.dto.FoodCalory;
import com.sun.tools.javac.util.List;

public interface DietService {
	
//	List<FoodCalory> getFoodCalory(Map<String, Object> paramMap) throws Exception;
	int setCalory(Map<String, Object> paramMap);
	
	List<FoodCalory> getFoodCalory(Map<String, Object> paramMap);
	
}
