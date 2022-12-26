<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
				<span id = "emailChk"></span>
				
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberPw">패스워드</label>
				<input class="form-control" type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요">
				<span id = "pwChk"></span>
				<spring:hasBindErrors name="memberVO">
            	<c:if test="${errors.hasFieldErrors('memberPw') }">
            	 <spring:message  code="${errors.getFieldError('memberPw').codes[0]}" text="${errors.getFieldError('memberPw' ).defaultMessage  }"/>                                           
				</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberName">이름</label>
				<input class="form-control" type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요">
				<spring:hasBindErrors name="memberVO">
            	<c:if test="${errors.hasFieldErrors('memberName') }">
            	 <spring:message  code="${errors.getFieldError('memberName').codes[0]}" text="${errors.getFieldError('memberName' ).defaultMessage  }"/>                                           
				</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberAge">나이</label>
				<input class="form-control" type="text" id="memberAge" name="memberAge">
				<spring:hasBindErrors name="memberVO">
            	<c:if test="${errors.hasFieldErrors('memberAge') }">
            	 <spring:message  code="${errors.getFieldError('memberAge').codes[0]}" text="${errors.getFieldError('memberAge' ).defaultMessage  }"/>                                           
				</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberGender">성별</label>
				<input class="form-control" type="text" id="memberGender" name="memberGender">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberAddress">주소</label>
				<input class="form-control" type="text" id="memberAddress" name="memberAddress">
				<spring:hasBindErrors name="memberVO">
            	<c:if test="${errors.hasFieldErrors('memberAddress') }">
            	 <spring:message  code="${errors.getFieldError('memberAddress').codes[0]}" text="${errors.getFieldError('memberAddress' ).defaultMessage  }"/>                                           
				</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberPhone">연락처</label>
				<input class="form-control" type="text" id="memberPhone" name="memberPhone">
				<spring:hasBindErrors name="memberVO">
            	<c:if test="${errors.hasFieldErrors('memberPhone') }">
            	 <spring:message  code="${errors.getFieldError('memberPhone').codes[0]}" text="${errors.getFieldError('memberPhone' ).defaultMessage  }"/>                                           
				</c:if>
				</spring:hasBindErrors>
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cancle btn-danger" type="button">취소</button>
			</div>
		
		</form>
	
	</section>
	
	<script>
	$(function(){
		var email_rule =  /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/i;
		var pw_rule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		var email_chk = false;
		var pw_chk = false;
		
		$("#memberId").keyup(function(){
			var query = {id_member : $("#memberId").val()};
			
			if($("#memberId").val()===null||$("#memberId").val()===''||$("#memberId").val()==null||$("#memberId").val()=='' ) {
		           $("#emailChk").html('<b style="font-size: 14px; color: red"> [아이디는 필수값입니다.]</b>'); 
		           email_chk = false;
		    }else if(!email_rule.test($("#memberId").val())){
	            $("#emailChk").html('<b style="font-size: 14px; color: red"> [이메일 형식으로 입력하세요.]</b>');
	            email_chk = false;
	        }else{
				$.ajax({
					url : "/idchk",
					type : "post",
					data : query,
					success : function(data){
						if(data==1){
							$("#emailChk").html('<b style="font-size: 14px; color: red">[이메일 중복]</b>');
				            
							email_chk=false;
						}else{
							$("#emailChk").html('<b style="font-size: 14px; color: blue">[사용가능]</b>');
							email_chk=true;
						}
					}
				});
			}
		});
		
		$("#memberPw").keyup(function(){
			var query = {id_member : $("#memberPw").val()};
			
			if($("#memberPw").val()===null||$("#memberPw").val()===''||$("#memberPw").val()==null||$("#memberPw").val()=='' ) {
		           $("#pwChk").html('<b style="font-size: 14px; color: red"> [비밀번호는 필수값입니다.]</b>'); 
		           pw_chk = false;
		    }else if(!pw_rule.test($("#memberPw").val())){
	            $("#pwChk").html('<b style="font-size: 14px; color: red"> [비밀번호는 최소 8자리 이상 20자리 이하,영문자와 특수문자를 포함시켜주세요.]</b>');
	            pw_chk = false;
	        }else{
	        	$("#pwChk").html('<b style="font-size: 14px; color: blue"> [사용가능]</b>');
	        	pw_chk = true;
	        }
		});
	});
	</script>

</body>
</html>
