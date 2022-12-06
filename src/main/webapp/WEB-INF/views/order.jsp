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
		<td>상품명 : 
</table>
</html>
