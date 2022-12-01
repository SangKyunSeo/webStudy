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
		<div class="col-lg-3 com md-6" style="border-radius: 5px;">
			<div class="card" style="width: 18rem;">
				<p class="card-text" style="text-align: center;">
					상품명 : ${list.nameItem}
					</p>
				<p class="card-text" style="text-align: center;">
					제조사 : ${list.madeItem}
					</p>
				<p class="card-text" style="text-align: center;">
					가격 : ${list.priceItem}
					</p>
				<p class="card-text" style="text-align: center;">
					재고량 : ${list.stockItem}
					</p>
					</div>
				</div>
	</c:forEach>
</div>

</body>
</html>
