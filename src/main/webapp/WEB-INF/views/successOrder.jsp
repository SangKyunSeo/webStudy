<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>주문내역</title>
</head>
<body>
<h1>
	주문 내역
</h1>

<table border="1">
	<tr>
		<td>주문번호</td>
		<td>${order.idOrder}</td>
	</tr>
	<tr>
		<td>회원아이디</td>
		<td>${order.memberId}</td>
	</tr>
	<tr>
		<td>배송지주소</td>
		<td>${order.addressOrder}</td>
	</tr>
	<tr>
		<td>주문일자</td>
		<td>${order.dateOrder}</td>
	</tr>
	<tr>
		<td>상품번호</td>
		<td>${order.idItem}</td>
	</tr>
	<tr>
		<td>주문수량</td>
		<td>${order.amountOrder}</td>
	</tr>
	<tr>
		<td>주문가격</td>
		<td>${order.priceOrder}</td>
	</tr>
	
</table>

</body>
</html>
