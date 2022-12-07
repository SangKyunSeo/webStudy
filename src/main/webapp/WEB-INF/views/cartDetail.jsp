<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>장바구니</title>
</head>
<body>
<h1>
	장바구니 내역
</h1>
<table border="1">
	<tr>
		<td>회원아이디</td>
		<td>${cart.memberCart}</td>
	</tr>
	<tr>
		<td>상품번호</td>
		<td>${cart.idCart}</td>
	</tr>
	<tr>
		<td>상품명</td>
		<td>${cart.nameCart}</td>
	</tr>
	<tr>
		<td>상품수량</td>
		<td>${cart.amountCart}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td>${cart.priceCart}</td>
	</tr>
	<tr>
		<td>담은날짜</td>
		<td>${cart.dateCart}</td>
	</tr>
</table>
	<form action="/myCart" method="GET">
		<input type="submit" value="내 장바구니">
	</form>

</body>
</html>
