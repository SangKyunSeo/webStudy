<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<html>
<head>
	<title>상품 목록</title>
</head>
<body>
<h1>
	상품 목록
</h1>

<div class="container">
	<c:forEach items="${itemList}"  var="list" varStatus="status" >
		<tr>
			이미지
		</tr>
		<tr>
			<td class="detail">
				<div class="itemName">
					상품명 : ${list.nameItem}
				</div>
				<div class="madeName">
					제조사 : ${list.madeItem}
				</div>
				<div class="price">
					가격 : ${list.priceItem}
				</div>
				<div class="stock">
					재고량 : ${list.stockItem}
				</div>
				<form action="/orderParsing" method="GET">
					<input type="hidden" name="idItem" value="${list.idItem}">
					<input type="submit" value="이동">
				</form>
				<form action="/delete" method="GET">
					<input type="hidden" name="idItem" value="${list.idItem}">
					<input type="submit" value="삭제">
				</form>
			</td>
		</tr>
			<br><br>
	</c:forEach>
</div>

</body>
</html>
