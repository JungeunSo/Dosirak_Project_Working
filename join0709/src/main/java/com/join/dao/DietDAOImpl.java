package com.join.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.join.dto.FoodCalory;
import com.sun.tools.javac.util.List;


@Repository("dietDao")
public class DietDAOImpl implements DietDAO {
	
    @Inject
    private SqlSession sqlSession;
    
    private static final String Namespace = "com.join.mapper.caloryMapper";
    
    @Override
    public int setCalory(Map<String, Object> paramMap) {
        return sqlSession.insert(Namespace+".insertCalory", paramMap);
    }
    
    @Override
    public List<FoodCalory> getFoodCalory(Map<String, Object> paramMap) {
    	return sqlSession.selectOne(Namespace+".selectFoodName", paramMap);
    }

}
