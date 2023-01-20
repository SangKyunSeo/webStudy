<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>상품등록</title>
</head>
<body>
<h1>
	상품등록
</h1>
	<section id="container">
		<form action="/setitem" enctype="multipart/form-data"method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="nameItem">상품명</label>
				<input class="form-control" type="text" id="nameItem" name="nameItem">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="nameItem">상품 카테고리</label>
				<select name="categoryItem" id="categoryItem">
					<option value="">카테고리</option>
					<option value="woman">woman</option>
					<option value="man">man</option>
				</select>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="madeItem">제조사</label>
				<input class="form-control" type="text" id="madeItem" name="madeItem">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="imageItem">이미지</label>
				<input class="form-control" type="file" id="file" name="file">
			</div>
			<div class="select_img"><img src=""/></div>
			<div class="form-group has-feedback">
				<label class="control-label" for="priceItem">가격</label>
				<input class="form-control" type="number" id="priceItem" name="priceItem">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="stockItem">재고량</label>
				<input class="form-control" type="number" id="stockItem" name="stockItem">
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
