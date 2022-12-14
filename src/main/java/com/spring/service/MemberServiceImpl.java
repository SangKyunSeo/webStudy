package com.spring.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.spring.dao.MemberDAO;
import com.spring.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
    private MemberDAO dao;
    
    @Override
    public void register(MemberVO memberVo) throws Exception{
    	dao.register(memberVo);
    }
    
    @Override
    public String loginCheck(MemberVO memberVo, HttpSession session) throws Exception{
    	MemberVO login = dao.login(memberVo);
    	String email = dao.loginCheck(memberVo);
    	if(email!=null) {
    		session.setAttribute("LoginVo", login);
    	}
    	return email;
    }
    
    @Override
    public MemberVO login(MemberVO memberVo) {
    	return dao.login(memberVo);
    }
    @Override
    public void logout(HttpSession session) {
    	session.invalidate();
    }
    
    @Override
    public MemberVO buyer(String id_member) throws Exception{
    	return dao.buyer(id_member);
    }
    
    @Override
    public void updateInfo(MemberVO memberVo) throws Exception{
    	dao.updateInfo(memberVo);
    }
    
    @Override
    public Map<String, String> validateHandling(Errors errors) throws Exception{
    	Map<String, String> validatorResult = new HashMap<>();
    	
    	for(FieldError error : errors.getFieldErrors()) {
    		String vaildKeyName =  String.format("valid_%s",error.getField());
    		validatorResult.put(vaildKeyName, error.getDefaultMessage());
    	}
    	return validatorResult;
    }
    
    @Override
    public MemberVO idcheck(String id_member) throws Exception{
    	return dao.idcheck(id_member);
    }
}
