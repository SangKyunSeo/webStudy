<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>상품 목록</title>
</head>
<body>
<h1>
	상품 목록
</h1>

<div class="container">
	<c:forEach items="${itemList}"  var="list" >
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
				<div class="amount">
				<label class="control-label" for="amountItem">수량</label>
				<input type="number" id="amountItem" name="amountItem">
				</div>
				<div class="button">
				<button class="btn btn-order" type="submit" id="order">주문</button>
				<button class="btn btn-cart" type="submit" id="cart">장바구니</button>
				<button class="cancle btn-danger" type="button">취소</button>
				</div>
				</td>
			</tr>
			<br><br><br>
	</c:forEach>
</div>

</body>
</html>
