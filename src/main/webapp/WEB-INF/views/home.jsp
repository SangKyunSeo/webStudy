<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	메인 홈페이지
</h1>

<div class ="login_class" id="login">
	<form action="/login" method="POST">
		<input type="submit" value="로그인">
	</form>
</div>

<div class ="login_class" id="logout">
	<form action="/logout" method="POST">
		<input type="submit" value="로그아웃">
	</form>
</div>

<form action="/myCart" method="GET">
	<input type="submit" value="내장바구니">
</form>
<br><br>
<form action="/updateInfo" method="POST">
	<input type="submit" value="내정보수정">
</form>
<script>
	$(function(){
		var user = '${user}';
		if(user==null||user==''||user==""){
			$("#login").show();
			$("#logout").hide();
		}else{
			$("#login").hide();
			$("#logout").show();
		}
	});
</script>

</body>
</html>
