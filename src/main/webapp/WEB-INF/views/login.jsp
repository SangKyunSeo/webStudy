<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>

<body>
<h2>로그인</h2>
<form name="form1" method="post" action="/login">
<table border="1" width="400px">
<tr>
 <td>아이디</td>
 <td>
 	<input type="text" id="memberId" name="memberId">
 	<span id="emailChk"></span>
 </td>
</tr>
<tr>
 <td>비밀번호</td>
 <td>
 	<input type="password" id="memberPw" name="memberPw">
 	<span id="pwChk"></span>
 </td>
</tr>
<tr>
 <td colspan="2" align="center">
 <button type="submit" id="btnLogin">로그인 </button></td>
</tr>
 <c:if test="${msg == 'Error'}">
 <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
 </div>
</c:if>
<c:if test="${msg == 'logout'}">
 <div style="color:red;"> 로그아웃되었습니다.
 </div>
</c:if>

</table>
</form>
<div>
	<button onclick="location='/register'">회원가입</button>
</div>

<script>
	$(function(){
		$("#btnLogin").click(function(){
			var memberId=$("#memberId").val();
			var memberPw=$("#memberPw").val();
			
			if(memberId==""||memberId==''||memberId==null){
				$("#emailChk").html('<b style="font-size: 14px; color: red"> [이메일을 입력해주세요]</b>');
			    $("#memberId").focus();
			    return;
			}
			
			if(memberPw==""){
				$("#pwChk").html('<b style="font-size: 14px; color: red"> [비밀번호를 입력해주세요]</b>');
			    $("#memberPw").focus();
			    return;
			}
			
			document.form1.action= "/loginCheck";
			document.form1.submit();
		})
	})
</script>
</body>
</html>
