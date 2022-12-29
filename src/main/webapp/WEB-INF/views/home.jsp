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
		메인
	</h1>
	<div class="inline_view searchParent" id="search">
		<form action ="/" method="GET" id="searchForm">
			<input type="text" class="search" id="search" placeholder="검색어를 입력하세요">
			<input type="submit" class="searchIcon" value="">
		</form>
	</div>
</div>

<div class ="login_class" id="login">
	<form action="/login" method="POST">
		<input type="submit" value="로그인">
	</form>
</div>

<div class ="login_class" id="logout">
	<form action="/logout" method="POST">
		<input type="submit" value="로그아웃">
	</form>
</div>

<form action="/myCart" method="GET">
	<input type="submit" value="내장바구니">
</form>
<br><br>
<form action="/updateInfo" method="POST">
	<input type="submit" value="내정보수정">
</form>
<script>
	$(function(){
		var user = '${user}';
		if(user==null||user==''||user==""){
			$("#login").show();
			$("#logout").hide();
		}else{
			$("#login").hide();
			$("#logout").show();
		}
	});
</script>

</body>
</html>
