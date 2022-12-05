package com.spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.dto.MemberVO;

public interface MemberService {
	public void register(MemberVO memberVo) throws Exception;
	public String loginCheck(MemberVO memberVo, HttpSession session) throws Exception;
	public void logout(HttpSession session);
}
