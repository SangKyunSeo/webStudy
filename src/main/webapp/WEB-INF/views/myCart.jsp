<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>내 장바구니</title>
</head>
<body>
<h1>
	내 장바구니 내역
</h1>

</body>
<table border="1">
<c:forEach items="${myCartList}"  var="list" varStatus="status" >
	<tr>
		<td>상품명</td>
		<td>${list.nameCart}</td>
		<td>수량</td>
		<td>${list.amountCart}</td>
		<td>전체 가격</td>
		<td>${list.priceCart}</td>
		<td>장바구니에 담은 날짜</td>
		<td>${list.dateCart}</td>
	</tr>
	<tr>
		<form action="/deleteCart" method="GET">
			<input type="hidden" name="memberId" value="${list.memberId}">
			<input type="hidden" name="idItem" value="${list.idItem}">
			<input type="submit" value="삭제">
		</form>
	</tr>

</c:forEach>
</table>


</html>
