<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<html>
<head>
	<title>Home</title>
	<script src="${path}/resources/js/bs1.js"></script>
	<link href="${path}/resources/css/bs1.css" rel="stylesheet"/> 	
</head>
<body>
<br><br><br>
<div class="header"  id="main_top">
	<h1 class="inline_view" >
		상세 페이지
	</h1>
</div>
<div class="item-header">
		<form class="itemForm" method="GET" id="itemCard"  name="itemCard">
				<div id="itemClick" class="itemListCard">
					<p>
						<img src="/resources/img/iphone8.png" width="300" height="450">
						상품명 : ${item.nameItem}
					</p>
					<div class="itemName">
						상품명 : ${item.nameItem}
					</div>
					<div class="madeName">
						제조사 : ${item.madeItem}
					</div>
					<div class="price">
						가격 : ${item.priceItem}
					</div>
					<div class="stock">
						재고량 : ${item.stockItem}
					</div>
				</div>
		</form>
		<form action="/orderParsing" method="GET">
			<input type="hidden" name="idItem" value="${item.idItem}">
			<input type="submit" value="주문">
		</form>
		<form action="/registCart" method="GET">
			<input type="hidden" name="idItem" value="${item.idItem}">
			<input type="submit" value="장바구니">
		</form>
		<br><br>
</div>
<div id="content" class="item-content">
	<div id="contentTab" class="tab">
		<ul class="tab-titles">
			<li name="detail" >상품상세</li>
			<li name="review" >상품평
				<span class="item-tab-review-count">0</span>
			</li>
			<li name="inquiry" >상품문의</li>
			<li name="inquiry" >배송/교환/반품</li>
		</ul>
		
		<ul class="tabe-contents">
			<li class="item-detail"></li>
				<div>
					<div id="itemDetail" class="item-detail-content">
						<div class="item-detail-content-inside">
							<div class="vendor-item">
								<!-- 제품 관련 상세 이미지 -->
								<div class="type-IMAGE_PIC">
									<img src="">
								</div>
								<div class="type-IMAGE_PIC">
									<img src="">
								</div>
								<div class="type-IMAGE_PIC">
									<img src="">
								</div>
								<div class="type-IMAGE_PIC">
									<img src="">
								</div>
								<div class="type-IMAGE_PIC">
									<img src="">
								</div>
								<div class="type-IMAGE_PIC">
									<img src="">
								</div>
							</div>
						</div>
					</div>
				</div>
			<li class="item-review"></li>
				<div class="sdp-review">
					<button type="button" class="sdp-review-register">상품평쓰기</button>
					<h4 class="sdp-reivew-title">상품평</h4>
					<div class="sdp-review-notice" style="display: blocl;">동일한 상품에 대해 작성된 상품평입니다.</div>
					<div class="sdp-review-avg">
						<section class="sdp-review-avg-total-star">
							<div class="sdp-review-avg-total-star-info-gray">
                        		<div class="sdp-review-avg-total-star-info-orange" data-rating="4.5" style="width: 222px;"></div>
                   			</div>
                   			<div class="sdp-review-avg-total-star-info-count">0</div>
						</section>
						<section class="sdp-review-avg-gallary">
							
						</section>
					</div>
				</div>
			<li class="item-inquiry"></li>
			<li class="item-etc"></li>
		</ul>
	</div>
</div>



<script>
	$(function(){
		$(document).ready(function(){
			window.onpageshow = function (event){
				if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
					$("#nameItem").val("");
				}
			}
		});
	});
</script>

</body>
</html>
