<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>리뷰 작성</title>
</head>


<body>
<h1>
	리뷰 작성
</h1>
	<section id="container">
		<form action="/register" method="post" >
			<div class="form-group has-feedback">
				<label class="control-label" for="memberId">내용</label>
				<input class="form-control" type="text" id="contentReview" name="contentReview"/>
				<input type="button" value="완료" id="complete" name="complete"/>
			</div>
			<div class="form-group has-feedback">
				<input type="button" value="취소" id="cancel" name="cancel"/>
			</div>
		</form>
	</section>
	
	<script>
		$(function(){
			$("#complete").click(function(){
				opener.document.getElementById("reviewContent").value = document.getElementById("contentReview").value;
				window.close();
			});
			
			$("#cancel").click(function(){
				window.close();
			});
		});
	</script>

</body>
</html>
