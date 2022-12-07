<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>장바구니</title>
</head>
<body>
<h1>
	장바구니 담기 페이지
</h1>

</body>
<h2>상품 정보</h2>
<table border="1">
	<tr>
		<td>상품번호</td>
		<td> ${cartItem.idItem}</td>
	</tr>
	<tr>
		<td>상품명</td>
		<td> ${cartItem.nameItem}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td> ${cartItem.priceItem}</td>
	</tr>
</table>
	<form action="/cartDetail" method="POST">
		<input type="hidden" value="${user.memberId}" id="memberCart" name="memberCart">
		<input type="hidden" value="${cartItem.idItem}" id="idCart" name="idCart">
		<input type="hidden" value="${cartItem.nameItem}" id="nameCart" name="nameCart">
		<label for="amount">수량</label>
		<input type="number" name="amountCart" id="amountCart">
		<input type="hidden" value="${cartItem.priceItem}" id="priceCart" name="priceCart">
		<input type="hidden" value="${date}" id="dateCart" name="dateCart">
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">장바구니 담기</button>
			<button class="cancle btn-danger" type="button">취소</button>
		</div>
	</form>
</html>
