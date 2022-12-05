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
<table border="1">
	<tr>
		<td>이름</td>
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
</html>
