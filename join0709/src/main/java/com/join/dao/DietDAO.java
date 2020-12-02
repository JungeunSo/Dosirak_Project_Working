package com.join.dao;

import java.util.Map;

import com.join.dto.FoodCalory;
import com.sun.tools.javac.util.List;

public interface DietDAO {

    int setCalory(Map<String, Object> paramMap);
    
    List<FoodCalory> getFoodCalory(Map<String, Object> paramMap);
	
}
