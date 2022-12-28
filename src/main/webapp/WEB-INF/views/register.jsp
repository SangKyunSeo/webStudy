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
			</div>
			<div class="form-group check password">
				<label class="control-label" for="pw_check" >패스워드 확인</label>
				<input class="form-control" type="password" id="pw_check" name="pw_check" placeholder="비밀번호를 다시 입력해주세요">
				<span id = "rpwChk"></span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberName">이름</label>
				<input class="form-control" type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요">
				<span id = "nameChk"></span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberAge">생년월일</label>
				<input class="form-control" type="text" id="memberAge" name="memberAge" placeholder="8자리 숫자로 입력 (ex.19970101)">
				<span id = "ageChk"></span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="memberGender">성별</label>
				<input class="form-control" type="radio" id="memberGender" name="memberGender" value="남자"> 남자
				<input class="form-control" type="radio" id="memberGender" name="memberGender" value="여자"> 여자
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
				<input class="form-control" type="text" id="memberPhone" name="memberPhone" placeholder="-없이 입력">
				<span id = "phoneChk"></span>
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
		var name_rule = /^[가-힣a-zA-Z]+$/;
		var age_rule = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var phone_rule = /^(01[0-9])([0-9]{3,4})([0-9]{4})$/;
		
		var email_chk = false;
		var pw_chk = false;
		var name_chk = false;
		var rpw_chk = false;
		var age_chk = false;
		var phone_chk = false;
		
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
		
		$("#pw_check").keyup(function(){
			if($("#pw_check").val()===null||$("#pw_check").val()===''||$("#pw_check").val()==null||$("#pw_check").val()=='' ) {
				   $("#rpwChk").html('<b style="font-size: 14px; color: red"> [비밀번호는 필수값입니다.]</b>'); 
				   rpw_chk = false;
			}else if($("#pw_check").val()!=$("#memberPw").val()){
			    $("#rpwChk").html('<b style="font-size: 14px; color: red"> [비밀번호가 일치 하지 않습니다.]</b>');
			    rpw_chk = false;
			}else{
				$("#rpwChk").html('<b style="font-size: 14px; color: blue"> [비밀번호가 일치 합니다.]</b>');
			    rpw_chk = true;
			}
		});
	
		$("#memberName").keyup(function(){
			var query = {id_member : $("#memberPw").val()};
			
			if($("#memberName").val()===null||$("#memberName").val()===''||$("#memberName").val()==null||$("#memberName").val()=='' ) {
		           $("#nameChk").html('<b style="font-size: 14px; color: red"> [이름은 필수값입니다.]</b>'); 
		           name_chk = false;
		    }else if(!name_rule.test($("#memberName").val())){
	            $("#nameChk").html('<b style="font-size: 14px; color: red"> [이름 형식이 맞지 않습니다. 한글 또는 영문자 입력을 확인해주세요.]</b>');
	            name_chk = false;
	        }else{
	        	$("#nameChk").html('<b style="font-size: 14px; color: blue"> [제대로 된 입력입니다.]</b>');
	        	name_chk = true;
	        }
		});
		
		$("#memberAge").keyup(function(){
			if($("#memberAge").val()===null||$("#memberAge").val()===''||$("#memberAge").val()==null||$("#memberAge").val()=='' ) {
		           $("#ageChk").html('<b style="font-size: 14px; color: red"> [생년월일은 필수값입니다.]</b>'); 
		           age_chk = false;
		    }else if(!age_rule.test($("#memberAge").val())){
	            $("#ageChk").html('<b style="font-size: 14px; color: red"> [생년월일 형식에 맞지 않습니다. 다시 입력해주세요.]</b>');
	            age_chk = false;
	        }else{
	        	$("#ageChk").html('<b style="font-size: 14px; color: blue"> [제대로 된 입력입니다.]</b>');
	        	age_chk = true;
	        }
		});
		
		$("#memberPhone").keyup(function(){
			if($("#memberPhone").val()===null||$("#memberPhone").val()===''||$("#memberPhone").val()==null||$("#memberPhone").val()=='' ) {
		           $("#phoneChk").html('<b style="font-size: 14px; color: red"> [연락처는 필수값입니다.]</b>'); 
		           phone_chk = false;
		    }else if(!phone_rule.test($("#memberPhone").val())){
	            $("#phoneChk").html('<b style="font-size: 14px; color: red"> [연락처 형식에 맞지 않습니다. 다시 입력해주세요.]</b>');
	            phone_chk = false;
	        }else{
	        	$("#phoneChk").html('<b style="font-size: 14px; color: blue"> [제대로 된 입력입니다.]</b>');
	        	phone_chk = true;
	        }
		});
		
		$("#submit").click(function(){
			if(email_chk && pw_chk && name_chk && rpw_chk && age_chk && phone_chk){
				alert("회원가입 성공");
			}else{
				alert("회원가입 실패");
			}
		});
	});
	</script>

</body>
</html>
