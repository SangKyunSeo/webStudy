<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>주문</title>
</head>
<body>
<h1>
	주문 페이지
</h1>

</body>
<h2>구매자 정보</h2>
<table border="1">
	<tr>
		<td>구매자</td>
		<td>${buyer.memberName}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${buyer.memberId}</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${buyer.memberPhone}</td>
	</tr>
</table>
<h2>받는사람 정보</h2>
<table border="1">
	<tr>
		<td>수령인</td>
		<td>${buyer.memberName}</td>
	</tr>
	<tr>
		<td>배송주소</td>
		<td>${buyer.memberAddress}</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${buyer.memberPhone}</td>
	</tr>
</table>
<h2>상품 정보</h2>
<table border="1">
	<tr>
		<td>상품번호</td>
		<td> ${detailList.idItem}</td>
	</tr>
	<tr>
		<td>상품명</td>
		<td> ${detailList.nameItem}</td>
	</tr>
	<tr>
		<td>가격</td>
		<td> ${detailList.priceItem}</td>
	</tr>
</table>
	<form action="/successOrder" method="POST">
		<input type="hidden" value="${orderNumber}" id="idOrder" name="idOrder">
		<input type="hidden" value="${buyer.memberId}" id="memberId" name="memberId">
		<input type="hidden" value="${buyer.memberAddress}" id="addressOrder" name="addressOrder">
		<input type="hidden" value="${date}" id="dateOrder" name="dateOrder">
		<input type="hidden" value="${detailList.idItem}" id="idItem" name="idItem">
		<label for="amount">수량</label>
		<input type="number" name="amountOrder" id="amountOrder">
		<input type="hidden" value="${detailList.priceItem}" id="priceOrder" name="priceOrder">
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">주문</button>
			<button class="cancle btn-danger" type="button">취소</button>
		</div>
	</form>
</html>
