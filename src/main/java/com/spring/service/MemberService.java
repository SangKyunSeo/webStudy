package com.spring.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.dto.MemberVO;

public interface MemberService {
	public void register(MemberVO memberVo) throws Exception;
	public String loginCheck(MemberVO memberVo, HttpSession session) throws Exception;
	public MemberVO login(MemberVO memberVo);
	public void logout(HttpSession session);
	public MemberVO buyer(String id_member) throws Exception;
}
