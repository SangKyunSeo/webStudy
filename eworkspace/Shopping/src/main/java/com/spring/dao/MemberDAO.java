package com.spring.dao;

import java.util.List;

import com.spring.dto.MemberVO;

public interface MemberDAO {
	public void register(MemberVO memberVo) throws Exception;
}
