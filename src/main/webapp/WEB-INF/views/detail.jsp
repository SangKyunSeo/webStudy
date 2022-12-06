<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
	<title>주문</title>
</head>
<body>
<h1>
	상품 주문
</h1>
<form action="/detail" method="GET" class="order_form">
	<input type="hidden" name="idItem" value="나">
</form>

</body>
</html>
