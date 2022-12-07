<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>상품정보수정</title>
</head>
<body>
<h1>
	상품수정
</h1>
	<section id="container">
		<form action="/updateItem" method="GET">
			<div class="form-group has-feedback">
				<label class="control-label" for="nameItem">상품이름</label>
				<input class="form-control" type="text" id="nameItem" name="nameItem" value="${item.nameItem}">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="madeItem">제조사</label>
				<input class="form-control" type="text" id="madeItem" name="madeItem">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="priceItem">가격</label>
				<input class="form-control" type="number" id="priceItem" name="priceItem">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="stockItem">재고량</label>
				<input class="form-control" type="number" id="stockItem" name="stockItem">
			</div>
				<input type="hidden" id="idItem" name="idItem" value="${item.idItem}">
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">수정</button>
				<button class="cancle btn-danger" type="button">취소</button>
			</div>
		
		</form>
	
	</section>

</body>
</html>
