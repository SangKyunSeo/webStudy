<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>Home</title>
	<script src="${path}/resources/js/test.js"></script>
	<link href="${path}/resources/css/test.css" rel="stylesheet"/> 	
</head>
<body>
<br><br><br>
<div class="header"  id="main_top">
	<h1 class="inline_view" >
		상세 페이지
	</h1>
</div>
<div class="container">
		<form class="itemForm" method="GET" id="itemCard"  name="itemCard">
				<div id="itemClick" class="itemListCard">
					<p>
						<img src="/resources/img/iphone8.png" width="300" height="450">
						상품명 : ${item.nameItem}
					</p>
					<div class="itemName">
						상품명 : ${item.nameItem}
					</div>
					<div class="madeName">
						제조사 : ${item.madeItem}
					</div>
					<div class="price">
						가격 : ${item.priceItem}
					</div>
					<div class="stock">
						재고량 : ${item.stockItem}
					</div>
				</div>
		</form>
		<form action="/orderParsing" method="GET">
			<input type="hidden" name="idItem" value="${item.idItem}">
			<input type="submit" value="주문">
		</form>
		<form action="/registCart" method="GET">
			<input type="hidden" name="idItem" value="${item.idItem}">
			<input type="submit" value="장바구니">
		</form>
		<br><br>
</div>

<script>
	$(function(){
		$(document).ready(function(){
			window.onpageshow = function (event){
				if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
					$("#nameItem").val("");
				}
			}
		});
	});
</script>

</body>
</html>
