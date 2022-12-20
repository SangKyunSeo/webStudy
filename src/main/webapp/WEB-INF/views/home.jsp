<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	반갑습니다! 여기는 온라인 쇼핑몰 입니다!
</h1>
<form action="/login" method="POST">
	<input type="submit" value="로그인">
</form>
<form action="/myCart" method="GET">
	<input type="submit" value="내장바구니">
</form>
<br><br>
<form action="/updateInfo" method="POST">
	<input type="submit" value="내정보수정">
</form>


</body>
</html>
