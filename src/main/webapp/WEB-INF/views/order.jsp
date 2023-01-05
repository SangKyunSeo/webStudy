<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!DOCTYPE html>
<html>
<head>
	<title>주문</title>
</head>

<body>
	<h1>
		주문 페이지
	</h1>

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
			<td>상품번호</td>
			<td> ${detailList.idItem}</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td> ${detailList.nameItem}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td> ${detailList.priceItem}</td>
		</tr>
	</table>
	<form action="/successOrder" name="orderForm" id="orderForm" method="POST">
		<input type="hidden" value="${orderNumber}" id="idOrder" name="idOrder">
		<input type="hidden" value="${buyer.memberId}" id="memberId" name="memberId">
		<input type="hidden" value="${buyer.memberAddress}" id="addressOrder" name="addressOrder">
		<input type="hidden" value="${date}" id="dateOrder" name="dateOrder">
		<input type="hidden" value="${detailList.idItem}" id="idItem" name="idItem">
		<label for="amount">수량</label>
		<input type="number" name="amountOrder" id="amountOrder">
		<input type="hidden" value="${detailList.priceItem}" id="priceOrder" name="priceOrder">
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="buy" name="buy" >결제</button>
			<button class="cancle btn-danger" type="button">취소</button>
		</div>
	</form>
</body>
<script>
$(function(){
	IMP.init('imp01501022');
	$("#buy").click(function(){
		
		IMP.request_pay({
		    pg : "html5_inicis",
		    pay_method : "card",
		    merchant_uid: "11", // 상점에서 관리하는 주문 번호를 전달
		    name : "주문명:결제테스트",
		    amount : ${detailList.priceItem} / ${detailList.priceItem} + 100,
		    buyer_email : "${buyer.memberId}",
		    buyer_name : "${buyer.memberName}",
		    buyer_tel : "${buyer.memberPhone}",
		    buyer_addr : "${buyer.memberAddress}",
		    buyer_postcode : "16548"
		}, function(rsp) { // callback 로직
			if(rsp.success){
				var msg = "결제가 완료 되었습니다.";
				msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				alert(msg);
				document.orderForm.action= "/successOrder";
				document.orderForm.submit();
			}else{
				var msg = "결제가 실패하였습니다.";
				msg += rsp.error_code + " 에러내용: " + rsp.error_msg;
				alert(msg);
				location.href="/itemdetail/${detailList.idItem}";
			}
		});
	
	});
});
</script>

</html>
