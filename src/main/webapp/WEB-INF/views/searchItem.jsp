<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>물품 검색</title>
</head>
<body>
<br><br><br>
<div class="header"  id="main_top">
	<h1 class="inline_view" >
		'${name}' 검색 결과
	</h1>
</div>
<div class="container" id="items">
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
						<input type="submit" value="주문">
					</form>
					<form action="/registCart" method="GET">
						<input type="hidden" name="idItem" value="${list.idItem}">
						<input type="submit" value="장바구니">
					</form>
				</td>
			</tr>
				<br><br>
		</c:forEach>
</div>
<div class="print" id="none">
	<h2>
		검색결과가 없습니다.
	</h2>
</div>
<script>
	$(function(){
		var check =${exist};
		if(check==false){
			$("#items").hide();
			$("#none").show();
		}else{
			$("#items").show();
			$("#none").hide();
		}
	});
</script>

</body>
</html>
