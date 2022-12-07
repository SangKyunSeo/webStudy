package com.spring.dao;

import java.util.List;

import com.spring.dto.MemberVO;

public interface MemberDAO {
	public void register(MemberVO memberVo) throws Exception;
	public String loginCheck(MemberVO memberVo) throws Exception;
	public MemberVO buyer(String id_member) throws Exception;
	public MemberVO login(MemberVO memberVo);
	public void updateInfo(MemberVO memberVo) throws Exception;
}
