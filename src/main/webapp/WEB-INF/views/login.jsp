<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
</head>

<body>
<h2>로그인</h2>
<form name="form1" method="post" action="/login">
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
 <button type="submit">로그인 </button>
 	
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
