package com.join.myapp;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.join.service.BoardService;
import com.join.service.DietService;
import com.join.service.UserService;

@Controller
@RequestMapping("/diet/*")
public class DietController {
	
	 @Inject
	 UserService userService;
	 @Inject
	 DietService dietService;
	 
    @RequestMapping(value = "/")
    public String daily(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request) {
 
    	HttpSession httpSession = request.getSession();
    	model.addAttribute("LOGIN",httpSession.getAttribute("LOGIN"));
 	
    	return "daily";
    }
    
    @RequestMapping(value = "caloryView")
    public String caloryView(@RequestParam Map<String, Object> paramMap, Model model, HttpServletRequest request) {
 
    	HttpSession httpSession = request.getSession();
    	model.addAttribute("LOGIN",httpSession.getAttribute("LOGIN"));
    	model.addAttribute("Food", dietService.getFoodCalory(paramMap));
    	
    	
    	return "caloryView";
    }
    
    
    //AJAX 호출 (일간 식단 입력)
    @RequestMapping(value="dailySave", method=RequestMethod.POST)
    @ResponseBody
    public Object boardSave(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, Model model) {

    	HttpSession httpSession = request.getSession();
    	model.addAttribute("LOGIN",httpSession.getAttribute("LOGIN"));
    	
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        //정보입력
        int result = dietService.setCalory(paramMap);
 
        if(result > 0) {
        	retVal.put("code", "OK");
            retVal.put("message", "등록에 성공 하였습니다.");
        }
        
        else {           
        	  retVal.put("code", "FAIL");
              retVal.put("message", "등록에 실패 하였습니다.");
        	}
 
        return retVal;
    }
    
	
}
