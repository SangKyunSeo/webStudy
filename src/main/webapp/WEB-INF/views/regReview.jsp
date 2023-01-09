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
		<form name="childForm" action="/regReview" method="POST">
			<div class="form-group has-feedback">
				<input type="hidden" id="memberId" name="memberId" value="${user.memberId}">
				<input type="hidden" id="dateReview" name="dateReview" value="${date}">
				<label class="control-label" for="contentReview">내용</label>
				<input class="form-control" type="text" id="contentReview" name="contentReview"/>
				<select name="scoreReview" id="scoreReview">
					<option value="">점수</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				<input type="button" value="완료" id="complete" name="complete"/>
			</div>
		</form>
		<div class="form-group has-feedback">
			<input type="button" value="취소" id="cancel" name="cancel"/>
		</div>
	</section>
	
	<script>
		$(function(){
			$("#complete").click(function(){
				opener.document.getElementById("memberId").value = document.getElementById("memberId").value;
				opener.document.getElementById("dateReview").value = document.getElementById("dateReview").value;
				opener.document.getElementById("contentReview").value = document.getElementById("contentReview").value;
				opener.document.getElementById("scoreReview").value = document.getElementById("scoreReview").value;
				opener.location.href="/regReview"
				opener.document.registReviewForm.submit();
				window.close();
			});
			
			$("#cancel").click(function(){
				window.close();
			});
		});
	</script>

</body>
</html>
