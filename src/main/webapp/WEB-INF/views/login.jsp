<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script>
$(document).ready(function(){
	$("#btnLogin").on("click",function(){
		var memberId=$("#memberId").val();
		var memberPw=$("#memberPw").val(); 
		if(memberId == ""){
			alert("아이디를 입력하세요");
			$("#memberId").focus(); //입력포커스 이동
			return; //함수 종료
		}
		if(memberPw==""){
			 alert("비밀번호를 입력하세요"); 
			 $("#memberPw").focus();
			  return;
			}
		 document.form1.action= "/login/check";
		 document.form1.submit(); //제출
	})
})
</script>
</head>

<body>
<h2>로그인</h2>
<form name="form1" method="post">
<table border="1" width="400px">
<tr>
 <td>아이디</td>
 <td><input id="memberId" name="memberId"></td>
</tr>
<tr>
 <td>비밀번호</td>
 <td><input type="password" id="memberPw" name="memberPw"></td>
</tr>
<tr>
 <td colspan="2" align="center">
 <button type="button" id="btnLogin">로그인 </button>
 	
 <c:if test="${message == 'Error'}">
 <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
 </div>
</c:if>
<c:if test="${message == 'logout'}">
 <div style="color:red;"> 로그아웃되었습니다.
 </div>
</c:if>
</td>
</tr>
</table>
</form>
</body>
</html>
