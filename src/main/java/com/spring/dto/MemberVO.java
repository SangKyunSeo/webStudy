package com.spring.dto;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class MemberVO {
	
	@NotBlank(message = "이메일은 필수 입력입니다.")
	@Email(message = "이메일 형식으로 입력하세요.")
    private String memberId;
	
	@NotBlank(message = "비밀번호는 필수 입력입니다.")
    private String memberPw;
	
	@NotBlank(message = "이름은 필수 입력입니다.")
    private String memberName;
	
	@NotBlank(message = "나이는 필수 입력입니다.")
    private String memberAge;
	
    private String memberGender;
    
    @NotBlank(message = "주소는 필수 입력입니다.")
    private String memberAddress;
    
    @NotBlank(message = "연락처는 필수 입력입니다.")
    private String memberPhone;
    
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(String memberAge) {
		this.memberAge = memberAge;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
}
