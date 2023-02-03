<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>상품상세등록</title>
</head>
<body>
<h1>
	상품상세등록
</h1>
	<section id="container">
		<form action="/setItemDetail" enctype="multipart/form-data"method="get">
			<div class="form-group has-feedback">
				상품번호 : ${idItem}
			</div>
			<div class="form-group has-feedback">
				상품명 : ${nameItem}
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="imageItem">상품상세내용 이미지</label>
				<input class="form-control" type="file" id="file" name="file">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="imageItem">상품상세내용 이미지</label>
				<input class="form-control" type="file" id="file" name="file">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="imageItem">상품상세내용 이미지</label>
				<input class="form-control" type="file" id="file" name="file">
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">등록</button>
				<button class="cancle btn-danger" type="button">취소</button>
			</div>
			
		</form>
	
	</section>
<script>
	$("#file").change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(data){
				$(".select_img img").attr("src",data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
</script>
</body>
</html>
