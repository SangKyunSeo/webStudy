<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>회원가입</title>
</head>
<body>
<h1>
	회원가입
</h1>
	<section id="container">
		<form action="/register" method="post" >
			<div class="form-group has-feedback">
				<label class="control-label" for="memberId">이메일</label>
				<input class="form-control" type="text" id="memberId" name="memberId" placeholder="이메일을 입력해주세요"/>
				<spring:hasBindErrors name="memberVO">
            	<c:if test="${errors.hasFieldErrors('memberId') }">
            	 <spring:message  code="${errors.getFieldError('memberId').codes[0]}" text="${errors.getFieldError('memberId' ).defaultMessage  }"/>                                           
				</c:if>

</spring:hasBindErrors>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberPw">패스워드</label>
				<input class="form-control" type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberName">이름</label>
				<input class="form-control" type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberAge">나이</label>
				<input class="form-control" type="number" id="memberAge" name="memberAge">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberGender">성별</label>
				<input class="form-control" type="text" id="memberGender" name="memberGender">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberAddress">주소</label>
				<input class="form-control" type="text" id="memberAddress" name="memberAddress">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberPhone">연락처</label>
				<input class="form-control" type="text" id="memberPhone" name="memberPhone">
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cancle btn-danger" type="button">취소</button>
			</div>
		
		</form>
	
	</section>

</body>
</html>
