package com.spring.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.validation.Errors;

import com.spring.dto.MemberVO;

public interface MemberService {
	public void register(MemberVO memberVo) throws Exception;
	public String loginCheck(MemberVO memberVo, HttpSession session) throws Exception;
	public MemberVO login(MemberVO memberVo);
	public void logout(HttpSession session);
	public MemberVO buyer(String id_member) throws Exception;
	public void updateInfo(MemberVO memberVo) throws Exception;
	public Map<String, String> validateHandling(Errors errors) throws Exception;
	public MemberVO idcheck(String id_member) throws Exception;
}
