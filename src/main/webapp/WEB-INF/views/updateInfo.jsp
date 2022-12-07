<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>회원정보 수정</title>
</head>
<body>
<h1>
	회원정보 수정
</h1>
	
		<form action="/updateInfo" method="post">
			<input type="hidden" id="memberId" name="memberId" value="${user.memberId}">
			<div class="form-group has-feedback">
				<label class="control-label" for="memberPw">패스워드</label>
				<input class="form-control" type="password" id="memberPw" name="memberPw">
			</div>
			<input type="hidden" id="memberName" name="memberName" value="${user.memberName}">
			<input type="hidden" id="memberAge" name="memberAge" value="${user.memberAge}">
			<input type="hidden" id="memberGender" name="memberGender" value="${user.memberGender}">
			<div class="form-group has-feedback">
				<label class="control-label" for="memberAddress">주소</label>
				<input class="form-control" type="text" id="memberAddress" name="memberAddress">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberPhone">연락처</label>
				<input class="form-control" type="text" id="memberPhone" name="memberPhone">
			</div>
			<div>
				<button class="btn btn-success" type="submit" id="submit">수정</button>
				<button class="cancle btn-danger" type="button">취소</button>
			</div>
	
		</form>
</body>
</html>
